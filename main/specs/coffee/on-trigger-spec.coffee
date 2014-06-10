define ['jasmine', 'publisher'], (jasmine, Publisher)->
  "use strict"


  describe "Test the on trigger methods => ", ()->

    it "On add() and update() subscribers, trigger and check returns", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      publisher = new Publisher o

      publisher.on 'add', (param)->
        console.log 'add published'
        return param

      publisher.on 'update', ()->
        console.log 'update published'
        return 'update'

      expect(publisher.trigger('add', 'add')).toEqual 'add'
      expect(publisher.trigger 'update').toEqual 'update'

      return


    it "Trigger without subscriber name (context nor params) and check if the array of subscribers was returned.", ()->

      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'CoffeeScript'

      publisher = new Publisher o

      publisher.on 'add', (param)->
        console.log 'add published'
        return param

      publisher.on 'update', ()->
        console.log 'update published'
        return 'update'

      func = typeof publisher.trigger()['add']

      expect(func).toEqual 'function'
      expect(publisher.trigger()['add']('add')).toEqual 'add'
      expect(typeof []).toEqual typeof publisher.trigger()

      return
    return

    


  return