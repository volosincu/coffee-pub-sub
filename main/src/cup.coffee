###
  autor Volosincu Bogdan
###

define [], ()->
  "use strict";

  class Cup
    extend: (objects...) ->
      for object in objects
        @[key] = value for key, value of object when object.hasOwnProperty key
      return

    extend_source : (source, dest) ->
      dest[prop] = source[prop] for prop in Object.keys source
      dest

    print : (obj) ->
      console.log(prop for prop in Object.keys obj)
      return

  Cup






