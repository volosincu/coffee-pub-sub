###
  autor Volosincu Bogdan
###



((context, factory)->


  if typeof define == 'function' and define.amd
    define ['exports'], (exports)->
      context.Proto = factory context, exports
      return context.Proto
    return
  else if typeof exports != 'undefined'
    factory context, exports
    return
  else
    context.Proto = factory context, {}
    return

)(this, (context, Proto)->

  class Proto

    callbacks_attached  = {}
    callbacks_on = {}

    isFunction = (o) ->
      return typeof o is 'function'

    constructor: (object) ->
      for key, value of object
        if isFunction value
          Proto.prototype[key] = ()->

            for k, i in callbacks_attached[key]
              if k isnt undefined
                k.apply Proto.prototype, if i is 0 then arguments
            return 'baga' : 'mare'
          callbacks_attached[key] = [value]
          callbacks_on[key] = {}
        else
          Proto.prototype[key] = value

    attach: (prop, priority, fn) ->
      if arguments[2] is undefined
        fn = priority
        priority = callbacks_attached[prop].length++

      if callbacks_attached[prop][priority] is undefined  or callbacks_attached[prop][priority] is null
        callbacks_attached[prop][priority] = fn
      else
        Array.prototype.splice.call callbacks_attached[prop], priority, 0, fn
      return

    on : (prop_name, cbk_name,  cbk) ->
      callbacks_on[prop_name][cbk_name] = cbk
      return

    trigger : (prop_name, cbk_name) ->
      callbacks_on[prop_name][cbk_name].call null
      return


  return Proto


)








