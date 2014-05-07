###
  autor Volosincu Bogdan
###


define [], ()->
  "use strict"

  do() ->
    class Moda
      nume : 'nedefinit'
      fn : (param) ->
        if param? then @nume = param
        console.log @nume
        return
      setNume: (nume, fn) ->
        @nume = nume
        if fn? then fn.call(this ,nume)
        return

    class Modb
      nume : 'nedefinit'
      fn : (param) ->
        if param? then @nume = param
        console.log @nume
        return
      numeAdaugat : (nume) ->
        console.log "in a so adaugat numele " + nume
        return

    moda = new Moda()
    modb = new Modb()

    fna = moda.fn
    fnb = modb.fn

    moda.nume = 'bogdan'
    modb.nume = 'mihai'

    moda.setNume 'bogdan', modb.numeAdaugat
    return



  return


