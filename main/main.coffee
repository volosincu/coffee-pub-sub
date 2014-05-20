config =
  baseUrl : '.'
  paths :
    proto : 'main/core/proto'
    jquery : 'libs/jquery/jquery.min'
    cup : 'main/core/cup'
    polyfill : 'main/core/polyfill'
    ps1 : 'main/core/pubsub1'
    ps2 : 'main/core/pubsub2'
    ps3 : 'main/core/pubsub3'
    jasmine: 'libs/jasmine/jasmine'
    'jasmine-html': 'libs/jasmine/jasmine-html'
    json2: 'libs/jasmine/json2'
    boot: 'libs/jasmine/boot'
  shim :
    jquery:
      exports: '$'
    polyfill :
      deps : []
      exports : 'polyfill'
    cup :
      deps : ['polyfill']
      exports : 'cup'
    proto :
      deps : ['cup']
      exports : 'proto'
    jasmine:
      deps : []
      exports: 'jasmine'
    'jasmine-html':
        deps: ['jasmine']
      exports: 'jasmine'
    boot:
      deps: ['jasmine', 'jasmine-html']
      exports: 'jasmine'


specs = ['main/specs/js/priority-spec']


require.config config


require ['boot','cup', 'ps2', 'proto'], (boot,Cup, PubSub2, Proto)->
  "use strict"

  require specs, ()->
    window.onload()

  return




