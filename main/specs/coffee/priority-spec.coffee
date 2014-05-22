define ['jasmine', 'proto'], (jasmine, Proto)->
  "use strict"


  describe "priority on attached subscribers", ()->

    beforeEach ()->

      return

    it "attach 5 subscribers to dprop, the first property with the fallowing priorities : 1,2,3,4,10", ()->

      ol =
        bprop : undefined
        cprop : undefined
        dprop : (param)->
          console.log 'bum shaka laka ' + param
          return 'result'
        aprop : "aval"
        eprop : (param)->
          console.log 'eeeeeee ' + param
          return
#        orderOfProperties : [1,2]

      pro = new Proto(ol)

      pro.attachTo 'dprop', ()->
        console.log "subscriber 1"
        #console.log this.orderOfProperties
        console.log this.aprop
        return
      , 1

      pro.attachTo 'dprop', ()->
        console.log "subscriber 2"
#        this.orderOfProperties.push 2
        return
      , 2

      pro.attachTo 'dprop', ()->
        console.log "subscriber 3"
#        this.orderOfProperties.push 3
        return
      , 3

      pro.attachTo 'dprop', ()->
        console.log "subscriber 4"
#        this.orderOfProperties.push 4
        return
      , 4

      pro.attachTo 'dprop',()->
        console.log "subscriber 10"
#        this.orderOfProperties.push 10
        return

      pro.attachTo 'eprop',()->
        console.log "subscriber ee"
        return


      pro.dprop 'laka'
      pro.eprop 'epr'

      console.log pro.aprop

#      pro.eprop 'lata'
      #console.log pro.orderOfProperties
      #expect(foo).toEqual(1);

    it "the priority of attached callbacks should chenge", ()->

#      pro.attachTo 'dprop', ()->
#        console.log "subscriber mai important 2"
#        return
#      , 2
#
#      console.log pro.dprop 'laka'
#
#      pro.on 'test', ()->
#        console.log 'test 1, 2, 2, 10'
#        return
#
#      pro.trigger pro, 'test'
      return

    return
  return