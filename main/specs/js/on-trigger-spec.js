define(['jasmine', 'cpubsub'], function(jasmine, cpubsub) {
  "use strict";
  describe("(on-trigger-spec.coffee) Test the on trigger methods => ", function() {
    it("On add() and update() subscribers, trigger and check returns", function() {
      var o, pubsub;
      o = {
        aprop: 'aprop',
        bprop: 'bprop',
        cprop: function(param) {
          return param;
        },
        dprop: 'dprop',
        eprop: function(param) {
          return param;
        }
      };
      pubsub = new cpubsub(o);
      pubsub.on('add', function(param) {
        console.log('add published');
        return param;
      });
      pubsub.on('add', function(param) {
        console.log('add published');
        return param;
      });
      pubsub.on('update', function() {
        console.log('update published');
        return 'update';
      });
      expect(pubsub.trigger('add', 'add')).toEqual('add');
      expect(pubsub.trigger('update')).toEqual('update');
    });
    it("On add-more() and update-more() subscribers, trigger with array params", function() {
      var o, pubsub;
      o = {
        aprop: 'aprop',
        bprop: 'bprop',
        cprop: function(param) {
          return param;
        },
        dprop: 'dprop',
        eprop: function(param) {
          return param;
        }
      };
      pubsub = new cpubsub(o);
      pubsub.on('add-more', function(param1, param2, param3) {
        console.log('add-more', param1, param2, param3);
        return [param1, param2, param3].join(',');
      });
      pubsub.on('update-more', function() {
        console.log('update more should is expected to be called with one argument', arguments);
        return Array.prototype.slice.apply(arguments).join(",");
      });
      expect(pubsub.trigger('add-more', ['add1', 'add2', 'add3'])).toEqual(['add1', 'add2', 'add3'].join(','));
      expect(pubsub.trigger('update-more', ['update-more'])).toEqual('update-more');
    });
    it("Trigger without subscriber name (context nor params) and check if the array of subscribers was returned.", function() {
      var func, o, pubsub;
      o = {
        name: 'Bogdan',
        surname: 'Volosincu',
        language: 'CoffeeScript'
      };
      pubsub = new cpubsub(o);
      pubsub.on('add', function(param) {
        console.log('add published');
        return param;
      });
      pubsub.on('update', function() {
        console.log('update published');
        return 'update';
      });
      func = typeof pubsub.trigger()['add'];
      expect(func).toEqual('function');
      expect(pubsub.trigger()['add']('add')).toEqual('add');
      expect(typeof []).toEqual(typeof pubsub.trigger());
    });
  });
});
