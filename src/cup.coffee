###
  autor Volosincu Bogdan
###

Object.prototype.keys = (o) ->

  keys = prop for prop in o
  keys

c =
  extend : (source) ->
    dest =
      ext : undefined,
      sup : undefined

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

ext = c.extend volo
c.print ext





