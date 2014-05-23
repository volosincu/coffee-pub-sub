define [], ()->
  "use strict";

  if Object::keys is undefined
    Object::keys = (o) ->
      keys = (prop for prop of o when o.hasOwnProperty prop)
      keys

  return