###
  autor Volosincu Bogdan
###

c =
  extend : (source) ->
    dest =
      ext : undefined,
      sup : undefined

    dest[prop] = source[prop] for prop in source
    dest

  print : (obj) ->
    console.log prop for prop in obj


    

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

console.log c.extend volo




