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

    # callbacks attached to property,
    # this callbacks execute automatically when the property is called
    cks_attached  = {}

    isFunction = (o) ->
      return typeof o is 'function'

    constructor: (object) ->
      for key, value of object
        if isFunction value
          Proto.prototype[key] = ()->
            result = {}
            for k, i in cks_attached[key]
              if k isnt undefined
                if i is 0
                  result = k.apply Proto.prototype, arguments
                else
                  k.apply Proto.prototype
            return result
          cks_attached[key] = [value]
        else
          Proto.prototype[key] = value


    # attach to property X the callback with priority 1..
    attachTo: (prop, theFunc, withPriority) ->
      if arguments[3] is undefined
        withPriority = cks_attached[prop].length++

      if cks_attached[prop][withPriority] is undefined  or cks_attached[prop][withPriority] is null
        cks_attached[prop][withPriority] = theFunc
      else
        Array.prototype.splice.call cks_attached[prop], withPriority, 0, theFunc
      return


  return Proto


)








