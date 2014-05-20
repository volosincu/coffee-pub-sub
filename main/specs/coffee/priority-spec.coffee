define ['jasmine', 'proto'], (jasmine, Proto)->
  "use strict"

  console.log jasmine

  describe "priority on attached subscribers", ()->
    beforeEach ()->
      pro = new Proto()

    it "the priority of attached callbacks should chenge", ()->
      ol =
        aprop : "aval"
        bprop : undefined
        cprop : undefined
        dprop : (param)->
          console.log 'bum shaka laka ' + param
          return 'result'

      pro = new Proto(ol)
      pro.attachTo 'dprop', ()->
        console.log "subscriber 1"
        console.log this.aprop
        return
      , 1

      pro.attachTo 'dprop', ()->
        console.log "subscriber 2"
        return
      , 2

      pro.attachTo 'dprop', ()->
        console.log "subscriber 3"
        return
      , 3

      pro.attachTo 'dprop', ()->
        console.log "subscriber 4"
        return
      , 4

      pro.attachTo 'dprop',()->
        console.log "subscriber 10"
        return

      pro.attachTo 'dprop', ()->
        console.log "subscriber mai important 2"
        return
      , 2

      console.log pro.dprop 'laka'

      pro.on 'test', ()->
        console.log 'test 1, 2, 2, 10'
        return

      pro.trigger pro, 'test'
      return

    return
  return