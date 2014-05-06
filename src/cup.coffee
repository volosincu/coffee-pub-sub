###
  autor Volosincu Bogdan
###


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



ol =
  aprop : undefined,
  bprop : undefined,
  cprop : undefined,
  dprop : undefined



cont = () ->
  @.activ = undefined
  @.tip = undefined
  @.prieteni= undefined
  @.nume = undefined
  @.id = undefined


volo = new cont()

c = new Cup()

ext = c.extend_source volo, ol
c.print ext





