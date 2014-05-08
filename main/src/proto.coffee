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
          #callbacks[key][0].call(null)
          for k in callbacks[key]
            k.call(null)
          return
        callbacks[key] = [fn]

      console.log callbacks

    pub: () ->
      console.log "bum"
      return

    sub: (prop, fn) ->
      callbacks[prop].push fn
      return

  Proto