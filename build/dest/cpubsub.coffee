###
  autor Volosincu Bogdan
###



((context, factory)->


  if typeof define == 'function' and define.amd
    define ['exports'], (exports)->
      context.cpubsub = factory context, exports
      return context.cpubsub
    return
  else if typeof exports != 'undefined'
    factory context, exports
    return
  else
    context.cpubsub = factory context, {}
    return

)(this, (context, cpubsub)->


  isFunction = (o) ->	
      return typeof o is 'function'

  genId = () ->
    gid = Math.random(Math.random(99)) * 100
    gid.toString().split(".")[1]

  cpubsub = (object)->

    @.id = genId
    
    _self = Object.create @;

    cbk_on = {}

    # callbacks attached to property,
    # this callbacks execute automatically when the property is called
    cbk_attached  = {}

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

    _self.__proto__.on = (cbk_name,  cbk, context) ->
      if context
        cbk_on[cbk_name] = cbk.bind context
      else 
        cbk_on[cbk_name] = cbk.bind {}
      return


    ## called without any parameters the trigger function will return the list of all published callbacks
    _self.__proto__.trigger = (cbk_name, params) ->
      rez = {}

      if arguments.length > 0
        if Object.prototype.toString.call(params) is '[object Array]'
          ## callback is a bound function
          fake_ctx = {}; 
          rez = cbk_on[cbk_name].apply fake_ctx, params
        else
          rez = cbk_on[cbk_name].call fake_ctx, params
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

  return {
    createChannel : (base) ->
      new cpubsub base
    }
)

