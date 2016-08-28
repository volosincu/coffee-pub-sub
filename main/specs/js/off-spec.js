define(['jasmine', 'publisher'], function(jasmine, Publisher) {
  "use strict";
  describe("Test the off method => ", function() {
    it("Object with add and update events. Removed update == true, Removed add == true and trigger().length == 0 ", function() {
      var o, publisher;
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
      publisher = new Publisher(o);
      publisher.on('add', function(param) {
        console.log('add published');
        return param;
      });
      publisher.on('update', function() {
        console.log('update published');
        return 'update';
      });
      expect(publisher.off('add')).toBe(true);
      expect(publisher.off('update')).toBe(true);
      expect(Object.keys(publisher.trigger()).length).toEqual(0);
    });
    it("Object with add and update events. Removed update == true, trigger add == add and trigger().length == 1", function() {
      var o, publisher;
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
      publisher = new Publisher(o);
      publisher.on('add', function(param) {
        return param;
      });
      publisher.on('update', function() {
        return 'update';
      });
      expect(publisher.off('update')).toBe(true);
      expect(publisher.trigger('add', 'add')).toEqual('add');
      expect(Object.keys(publisher.trigger()).length).toEqual(1);
    });
  });
});
