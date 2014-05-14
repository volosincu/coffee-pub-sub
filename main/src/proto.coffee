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

    callbacks = {}

    isFunction = (o)->
      return typeof o is 'function'

    constructor: (object) ->
      for key, value of object
        if isFunction value
          Proto.prototype[key] = ()->
            for k, i in callbacks[key]
              if k isnt undefined
                k.apply Proto.prototype, if i is 0 then arguments
            return
          callbacks[key] = [value]
        else
          Proto.prototype[key] = value

    on: (prop, priority, fn) ->
      if arguments[2] is undefined
        fn = priority
        priority = callbacks[prop].length++

      if callbacks[prop][priority] is undefined  or callbacks[prop][priority] is null
        callbacks[prop][priority] = fn
      else
        Array.prototype.splice.call callbacks[prop], priority, 0, fn
      return


  return Proto


)








