// Generated by CoffeeScript 1.7.1
var config;

config = {
  baseUrl: './main/lib',
  paths: {
    proto: 'proto',
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
    },
    proto: {
      deps: ['cup'],
      exports: 'proto'
    }
  }
};

require.config(config);

require(['cup', 'ps2', 'ps1', 'proto'], function(Cup, PubSub2, PubSub1, Proto) {
  "use strict";
  var ol, pro;
  ol = {
    aprop: "aval",
    bprop: void 0,
    cprop: void 0,
    dprop: function(param) {
      return console.log('bum shaka laka ' + param);
    }
  };
  pro = new Proto(ol);
  pro.on('dprop', 1, function() {
    return console.log("subscriber 1");
  });
  pro.on('dprop', 2, function() {
    return console.log("subscriber 2");
  });
  pro.on('dprop', 3, function() {
    return console.log("subscriber 3");
  });
  pro.on('dprop', 4, function() {
    return console.log("subscriber 4");
  });
  pro.on('dprop', function() {
    return console.log("subscriber 10");
  });
  pro.on('dprop', 2, function() {
    return console.log("subscriber mai important 2");
  });
  return pro.dprop("laka");
});
