
config =

  baseUrl : '.'


  paths :
    cpubsub : 'main/core/cpubsub'
    polyfill : 'main/core/polyfill'
    jquery : 'libs/jquery/jquery.min'
    jasmine: 'libs/jasmine/jasmine'
    'jasmine-html': 'libs/jasmine/jasmine-html'
    boot: 'libs/jasmine/boot'


  shim :
    polyfill :
      deps : []
      exports : 'polyfill'
    jquery:
      exports: '$'
    cpubsub :
      exports : 'cpubsub'
    jasmine:
      deps : ['polyfill']
      exports: 'jasmine'
    'jasmine-html':
        deps: ['jasmine']
      exports: 'jasmine'
    boot:
      deps: ['jasmine', 'jasmine-html']
      exports: 'jasmine'


specs = [
         'main/specs/js/priority-spec',
         'main/specs/js/on-trigger-spec',
         'main/specs/js/trigger-spec',
         'main/specs/js/off-spec'
         ]


require.config config


require ['boot'], (boot)->
  "use strict"

  require specs, ()->
    window.onload()

  return




