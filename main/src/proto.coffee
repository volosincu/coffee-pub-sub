###
  autor Volosincu Bogdan
###

define [], ()->
  "use strict"

  class Proto

    callbacks = {}

    constructor: (object) ->
      for key, value of object
        if typeof value is 'function'
          Proto.prototype[key] = ()->
            for k, i in callbacks[key]
              if k isnt undefined
                k.apply(null, if i is 0 then arguments)
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

  Proto