define [], ()->
  "use strict";

  if Object::keys is undefined
    Object::keys = (o) ->
      keys = (prop for prop of o when o.hasOwnProperty prop)
      keys

  if [].indexOf is undefined
    Array.prototype.indexOf = (element, fromIndex)->
      if fromIndex is undefined
        fromIndex = 0
      index = -1
      if @.length > 0
        for i,el of @
          if el == element
            index = i
      return index



  return