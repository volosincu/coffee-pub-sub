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

      publisher.on 'add', (param)->
        console.log 'add published'
        return param


      publisher.on 'update', ()->
        console.log 'update published'
        return 'update'

      expect(publisher.trigger('add', 'add')).toEqual 'add'
      expect(publisher.trigger 'update').toEqual 'update'

      return



    it "On add-more() and update-more() subscribers, trigger with array params", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      publisher = new Publisher o

      publisher.on 'add-more', (param1, param2, param3)->
        console.log 'add-more', param1, param2, param3
        return [param1, param2, param3].join ','

      publisher.on 'update-more', ()->
        console.log 'update more should is expected to be called with one argument', arguments
        return Array.prototype.slice.apply(arguments).join ","

      expect(publisher.trigger('add-more', ['add1', 'add2', 'add3'])).toEqual ['add1', 'add2', 'add3'].join ','
      expect(publisher.trigger 'update-more', ['update-more']).toEqual 'update-more'

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