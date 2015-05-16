define ['jasmine', 'publisher'], (jasmine, Publisher)->
  "use strict"


  describe "priority on attached subscribers", ()->

    it "Test the values of properties and the methods call ", ()->

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : 'dprop'
        eprop : (param)->
          return param

      publisher = new Publisher(o)

      expect(publisher.aprop).toEqual 'aprop'
      expect(publisher.bprop).toEqual 'bprop'
      expect(publisher.cprop 'cprop').toEqual 'cprop'
      expect(publisher.dprop).toEqual 'dprop'
      expect(publisher.eprop 'eprop').toEqual 'eprop'

      return


    it "Attach 5 subscribers to dprop with the fallowing priorities : 1,2,3,4,10", ()->

      ol =
        bprop : undefined
        cprop : undefined
        dprop : (param)->
          console.log 'Test the ' + param
          return 'result'
        aprop : 'aval'
        eprop : (param)->
          console.log 'eprop called ' + param
          return
        order_of_dprop_subscribers : []
        order_expected : [1, 2, 3, 4, 10]

      o =
        aprop : 'aprop'
        bprop : 'bprop'
        cprop : (param)->
          return param
        dprop : (param)->
          return param
        eprop : 'eprop'

      publisher = new Publisher o

      publisher.attachTo 'dprop', ()->
        console.log "subscriber 1 in first object on property with same name - dprop"
        return
      , 14


      publisher.dprop 'dprop'


      pro = new Publisher ol

      pro.attachTo 'dprop', ()->
        console.log "subscriber 1"
        this.order_of_dprop_subscribers.push 1
        return
      , 1

      pro.attachTo 'dprop', ()->
        console.log "subscriber 2"
        this.order_of_dprop_subscribers.push 2
        return
      , 2

      pro.attachTo 'dprop', ()->
        console.log "subscriber 3"
        this.order_of_dprop_subscribers.push 3
        return
      , 3

      pro.attachTo 'dprop', ()->
        console.log "subscriber 4"
        this.order_of_dprop_subscribers.push 4
        return
      , 4

      pro.attachTo 'dprop',()->
        console.log "subscriber 2 more important "
        this.order_of_dprop_subscribers.push 2
        return
      , 2

      pro.attachTo 'dprop',()->
        console.log "subscriber 10 "
        this.order_of_dprop_subscribers.push 10
        return
      , 10

      pro.dprop 'priority of subscribers'

      expect([1, 2, 2, 3, 4, 10].join()).toEqual(pro.order_of_dprop_subscribers.join());


      return

    return
  return
