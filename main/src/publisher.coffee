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

    _self = this;
    _self.prototype = {};

    cbk_on = {}

    # callbacks attached to property,
    # this callbacks execute automatically when the property is called
    cbk_attached  = {}

    isFunction = (o) ->
      return typeof o is 'function'

    ## polyfill - for ie8 and <
    Object::keys = (o) ->
      keys = (prop for prop of o when o.hasOwnProperty prop)
      keys

    ## polyfill - for ie8 and <
    Array.prototype.indexOf = (element, fromIndex)->
      if fromIndex is undefined
        fromIndex = 0
      index = -1
      if @.length > 0
        for i,el of @
          if el == element
            index = i
      return index

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


    # constructor logic - creates the keys in the wrapper
    for key, value of object
      if isFunction value
        proxi = new routekey(key);
        _self[key] = proxi.route
        cbk_attached[key] = [value]
      else
        _self[key] = value



    _self.constructor.prototype.attachTo = (prop, theFunc, withPriority) ->

      if arguments[2] is undefined
        withPriority = cbk_attached[prop].length++  #increments the length of cbk_attached[prop]

      if cbk_attached[prop][withPriority] is undefined  or cbk_attached[prop][withPriority] is null
        cbk_attached[prop][withPriority] = theFunc
      else
        Array.prototype.splice.call cbk_attached[prop], withPriority, 0, theFunc
      return

    _self.constructor.prototype.on = (cbk_name,  cbk) ->
      cbk_on[cbk_name] = cbk
      return


    ## called without any parameters the trigger function will return the list of all published callbacks
    _self.constructor.prototype.trigger = (context, cbk_name, params) ->
      rez = {}
      if typeof context is "string"
        params = cbk_name
        cbk_name = context
        context = _self
        if typeof(params) is 'array'
          rez = cbk_on[cbk_name].apply context, params
        else
          rez = cbk_on[cbk_name].call context, params
      else if arguments.length == 3
        if typeof(params) is 'array'
          rez = cbk_on[cbk_name].apply context, params
        else
          rez = cbk_on[cbk_name].call context, params
      else
        rez = cbk_on

      return rez

    ## returns true or false
    _self.constructor.prototype.off = (event) ->
      removed = false
      if (Object.keys(cbk_on).indexOf event) > -1
        removed = delete cbk_on[event]
      return removed



    return _self

  return Publisher
)

