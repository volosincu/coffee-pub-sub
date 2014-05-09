config =
  baseUrl : './main/lib'
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
    aprop : undefined,
    bprop : undefined,
    cprop : undefined,
    dprop : (param)->
      console.log 'bum shaka laka ' + param



  pro = new Proto(ol)
  pro.sub 'dprop', ()->
    console.log "subscriber unu"

  pro.dprop("laka")


  cont = () ->
    @.activ = undefined
    @.tip = undefined
    @.prieteni= undefined
    @.nume = undefined
    @.id = undefined


  volo = new cont()

  c = new Cup()

  ext = c.extend_source volo, ol
  c.print ext

  handler = (value) ->
    console.log value
    false

  ps = new PubSub2()

  ps.subscribe("add", handler)
  ps.publish "add", "just a value"
