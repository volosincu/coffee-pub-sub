###
  autor Volosincu Bogdan
###

define [], ()->
  "use strict"

  class PubSub2

    subs = {}

    call_ = (handler, data_) ->
      handler.call null, data_
      return

    publish : (nume, data) ->
      if nume is 'undefined' or nume is null
        return
      if data is 'undefined' or data is null
        return

      callbk = subs[nume];
      call_ handler, data for handler in callbk
      return

    subscribe : (nume_, func_) ->
      if nume_ is 'undefined' or nume_ is null
        return
      if (func_ is 'undefined' or func_ is null) and typeof func_ not 'function'
        return

      subs[nume_] = Array.prototype.slice.call arguments, 1
      return

  return PubSub2
