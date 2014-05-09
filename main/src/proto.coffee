###
  autor Volosincu Bogdan
###

define [], ()->
  "use strict"

  class Proto

    callbacks = {}

    constructor: (object) ->
      for key, fn of object
        Proto.prototype[key] = ()->
          for k, i in callbacks[key]
            k.apply(null, if i is 0 then arguments)
          return
        callbacks[key] = [fn]

    sub: (prop, fn) ->
      callbacks[prop].push fn
      return

  Proto