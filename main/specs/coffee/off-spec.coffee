define ['jasmine', 'publisher'], (jasmine, Publisher)->
  "use strict"


  describe "Test the off method => ", ()->

    it "Object with add and update events. Removed update == true, Removed add == true and trigger().length == 0 ", ()->

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


      expect(publisher.off 'add').toBe true
      expect(publisher.off 'update').toBe true

      expect(Object.keys(publisher.trigger()).length).toEqual 0

      return


    it "Object with add and update events. Removed update == true, trigger add == add and trigger().length == 1", ()->
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
        return param

      publisher.on 'update', ()->
        return 'update'

      expect(publisher.off 'update').toBe true
      expect(publisher.trigger('add', 'add')).toEqual 'add'
      expect(Object.keys(publisher.trigger()).length).toEqual 1
      return

    return




  return