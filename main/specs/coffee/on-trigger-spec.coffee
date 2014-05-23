define ['jasmine', 'proto'], (jasmine, Proto)->
  "use strict"


  describe "Test the on trigger methods", ()->

    it "On add() and update() subscribers, trigger and check returns", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      proto = new Proto o

      proto.on 'add', (param)->
        console.log 'add published'
        return param

      proto.on 'update', ()->
        console.log 'update published'
        return 'update'

      expect(proto.trigger('add', 'add')).toEqual 'add'
      expect(proto.trigger 'update').toEqual 'update'

      return


    it "Trigger without subscriber name (context nor params) and check if the array of subscribers was returned", ()->

      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'CoffeeScript'

      proto = new Proto o

      proto.on 'add', (param)->
        console.log 'add published'
        return param

      proto.on 'update', ()->
        console.log 'update published'
        return 'update'

      func = typeof proto.trigger()['add']

      expect(func).toEqual 'function'
      expect(proto.trigger()['add']()).toEqual 'add'
      expect(typeof []).toEqual typeof proto.trigger()

      return


    it "On (cnk_on) subscribers list is empty.", ()->

      o =
        name : 'Bogdan'
        surname : 'Volosincu'
        language : 'JavaScript'

      proto = new Proto o

      expect(proto.trigger().length).toEqual 0

      return

    return
  return