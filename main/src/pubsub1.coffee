###
  autor Volosincu Bogdan
###



moda =
  nume : 'nedefinit'
  fn : (param) ->
    if param? then @nume = param
    console.log @nume
    false
  setNume: (nume, fn) ->
    @nume = nume
    if fn? then fn.call(this ,nume)
    false



modb =
  nume : 'nedefinit'
  fn : (param) ->
    if param? then @nume = param
    console.log @nume
    false
  numeAdaugat : (nume) ->
    console.log "in a so adaugat numele " + nume
    false



fna = moda.fn
fnb = modb.fn

moda.nume = 'bogdan'
modb.nume = 'mihai'

moda.setNume 'bogdan', modb.numeAdaugat


