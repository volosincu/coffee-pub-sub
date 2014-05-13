config =
  baseUrl : './main/core'
  paths :
    proto : 'proto'
    cup : 'cup'
    polyfill : 'polyfill'
    ps1 : 'pubsub1'
    ps2 : 'pubsub2'
    ps3 : 'pubsub3'
  shim :
    'polyfill' :
      deps : []
      exports : 'polyfill'
    cup :
      deps : ['polyfill']
      exports : 'cup'
    proto :
      deps : ['cup']
      exports : 'proto'


require.config config


require ['cup', 'ps2', 'ps1', 'proto'], (Cup, PubSub2, PubSub1, Proto)->
  "use strict"

  ol =
    aprop : "aval"
    bprop : undefined
    cprop : undefined
    dprop : (param)->
      console.log 'bum shaka laka ' + param

  pro = new Proto(ol)
  pro.on 'dprop', 1,()->
    console.log "subscriber 1"
    console.log this.aprop
    return

  pro.on 'dprop', 2,()->
    console.log "subscriber 2"

  pro.on 'dprop', 3,()->
    console.log "subscriber 3"

  pro.on 'dprop', 4,()->
    console.log "subscriber 4"

  pro.on 'dprop',()->
    console.log "subscriber 10"

  pro.on 'dprop', 2,()->
    console.log "subscriber mai important 2"

  pro.dprop "laka"

