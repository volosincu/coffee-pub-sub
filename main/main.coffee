config =
  baseUrl : './main/lib'
  paths :
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


require.config config


require ['cup', 'ps2'], (Cup, PubSub2)->
  "use strict"

  ol =
    aprop : undefined,
    bprop : undefined,
    cprop : undefined,
    dprop : undefined


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
