
define [], ()->
  "use strict";

  if Object::keys?
    Object::keys = (o) ->
      keys = (prop for prop of o when o.hasOwnProperty prop)
      keys

  return