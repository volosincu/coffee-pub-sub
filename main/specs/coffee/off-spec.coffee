define ['jasmine', 'cpubsub'], (jasmine, cpubsub)->
  "use strict"


  describe "(off-spec.coffee) Test the off method => ", ()->

    it "Object with add and update events. Removed update == true, Removed add == true and trigger().length == 0 ", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      pubsub = new cpubsub o

      pubsub.on 'add', (param)->
        console.log 'add published'
        return param

      pubsub.on 'update', ()->
        console.log 'update published'
        return 'update'


      expect(pubsub.off 'add').toBe true
      expect(pubsub.off 'update').toBe true

      expect(Object.keys(pubsub.trigger()).length).toEqual 0

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

      pubsub = new cpubsub o

      pubsub.on 'add', (param)->
        return param

      pubsub.on 'update', ()->
        return 'update'

      expect(pubsub.off 'update').toBe true
      expect(pubsub.trigger('add', 'add')).toEqual 'add'
      expect(Object.keys(pubsub.trigger()).length).toEqual 1
      return

    return




  return
