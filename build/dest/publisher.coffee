###
  autor Volosincu Bogdan
###



((context, factory)->


  if typeof define == 'function' and define.amd
    define ['exports'], (exports)->
      context.Publisher = factory context, exports
      return context.Publisher
    return
  else if typeof exports != 'undefined'
    factory context, exports
    return
  else
    context.Publisher = factory context, {}
    return

)(this, (context, Publisher)->

  Publisher = (object)->

    _self = Object.create @;

    cbk_on = {}

    # callbacks attached to property,
    # this callbacks execute automatically when the property is called
    cbk_attached  = {}

    isFunction = (o) ->
      return typeof o is 'function'

    routekey = (_key_)->
      free_key = _key_;
      return o =
        route: ()->
          result = {}
          for k, i in cbk_attached[free_key]
            if k isnt undefined
              if i is 0
                result = k.apply _self, arguments
              else
                k.apply _self
          return result
      return


    for key, value of object
      if isFunction value
        proxi = new routekey(key);
        _self[key] = proxi.route
        cbk_attached[key] = [value]
      else
        _self[key] = value



    _self.__proto__.attachTo = (prop, theFunc, withPriority) ->

      if arguments[2] is undefined
        withPriority = cbk_attached[prop].length++  #increments the length of cbk_attached[prop]

      if cbk_attached[prop][withPriority] is undefined  or cbk_attached[prop][withPriority] is null
        cbk_attached[prop][withPriority] = theFunc
      else
        Array.prototype.splice.call cbk_attached[prop], withPriority, 0, theFunc
      return

    _self.__proto__.on = (cbk_name,  cbk) ->
      cbk_on[cbk_name] = cbk
      return


    ## called without any parameters the trigger function will return the list of all published callbacks
    _self.__proto__.trigger = (context, cbk_name, params) ->
      rez = {}
      if typeof context is "string"
        params = cbk_name
        cbk_name = context
        context = _self
        if Object.prototype.toString.call(params) is '[object Array]'		
          rez = cbk_on[cbk_name].apply context, params
        else
          rez = cbk_on[cbk_name].call context, params
      else if arguments.length == 3
        if Object.prototype.toString.call(params) is '[object Array]'
          rez = cbk_on[cbk_name].apply context, params
        else
          rez = cbk_on[cbk_name].call context, params
      else
        rez = cbk_on

      return rez

    ## returns true or false
    _self.__proto__.off = (event) ->
      removed = false
      if (Object.keys(cbk_on).indexOf event) > -1
        removed = delete cbk_on[event]
      return removed



    return _self

  return Publisher
)

