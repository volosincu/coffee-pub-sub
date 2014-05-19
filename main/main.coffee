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
    jasmine:
      exports: 'jasmine'
    'polyfill' :
      deps : []
      exports : 'polyfill'
    cup :
      deps : ['polyfill']
      exports : 'cup'
    proto :
      deps : ['cup']
      exports : 'proto'
    spec:
      exports: 'spec',
      deps: ['jasmine' ,'video']
    'jasmine-html':
      deps: ['jasmine'],
      exports: 'jasmine'




require.config config


require ['cup', 'ps2', 'ps1', 'proto'], (Cup, PubSub2, PubSub1, Proto)->
  "use strict"






