// Generated by CoffeeScript 1.7.1
var config;

config = {
  baseUrl: './main/lib',
  paths: {
    cup: 'cup',
    polyfill: 'polyfill',
    ps1: 'pubsub1',
    ps2: 'pubsub2',
    ps3: 'pubsub3'
  },
  shim: {
    'polyfill': {
      deps: [],
      exports: 'polyfill'
    },
    cup: {
      deps: ['polyfill'],
      exports: 'cup'
    }
  }
};

require.config(config);

require(['cup', 'ps2'], function(Cup, PubSub2) {
  "use strict";
  var c, cont, ext, handler, ol, ps, volo;
  ol = {
    aprop: void 0,
    bprop: void 0,
    cprop: void 0,
    dprop: void 0
  };
  cont = function() {
    this.activ = void 0;
    this.tip = void 0;
    this.prieteni = void 0;
    this.nume = void 0;
    return this.id = void 0;
  };
  volo = new cont();
  c = new Cup();
  ext = c.extend_source(volo, ol);
  c.print(ext);
  handler = function(value) {
    console.log(value);
    return false;
  };
  ps = new PubSub2();
  ps.subscribe("add", handler);
  return ps.publish("add", "just a value");
});