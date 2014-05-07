###
  autor Volosincu Bogdan
###

define [], ()->
  "use strict"

  class PubSub2

    subs = []

    call_ = (obj, nume_, data_) ->
      if obj.nume == nume_
        obj.func.call null, data_
      false

    publish : (nume, data) ->
      call_ key, nume, data for key in subs
      false

    subscribe : (nume_, func_) ->
      if nume_ is 'undefined' or nume_ is null
        return
      if (func_ is 'undefined' or func_ is null) and typeof func_ not 'function'
        return

      subs.push
        nume: nume_
        func: func_
      false

  return PubSub2
