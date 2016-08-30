define(['jasmine', 'cpubsub'], function(jasmine, cpubsub) {
  "use strict";
  describe("Test the off method => ", function() {
    it("Object with add and update events. Removed update == true, Removed add == true and trigger().length == 0 ", function() {
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
      pubsub.on('update', function() {
        console.log('update published');
        return 'update';
      });
      expect(pubsub.off('add')).toBe(true);
      expect(pubsub.off('update')).toBe(true);
      expect(Object.keys(pubsub.trigger()).length).toEqual(0);
    });
    it("Object with add and update events. Removed update == true, trigger add == add and trigger().length == 1", function() {
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
        return param;
      });
      pubsub.on('update', function() {
        return 'update';
      });
      expect(pubsub.off('update')).toBe(true);
      expect(pubsub.trigger('add', 'add')).toEqual('add');
      expect(Object.keys(pubsub.trigger()).length).toEqual(1);
    });
  });
});
