define(['jasmine', 'cpubsub'], function(jasmine, cpubsub) {
  "use strict";
  describe("(priority-spec.coffee) priority on attached subscribers", function() {
    it("Test the values of properties and the methods call ", function() {
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
      pubsub = cpubsub.createChannel(o);
      expect(pubsub.aprop).toEqual('aprop');
      expect(pubsub.bprop).toEqual('bprop');
      expect(pubsub.cprop('cprop')).toEqual('cprop');
      expect(pubsub.dprop).toEqual('dprop');
      expect(pubsub.eprop('eprop')).toEqual('eprop');
    });
    it("Attach 5 subscribers to dprop with the fallowing priorities : 1,2,3,4,10", function() {
      var o, ol, pro, pubsub;
      ol = {
        bprop: void 0,
        cprop: void 0,
        dprop: function(param) {
          console.log('Test the ' + param);
          return 'result';
        },
        aprop: 'aval',
        eprop: function(param) {
          console.log('eprop called ' + param);
        },
        order_of_dprop_subscribers: [],
        order_expected: [1, 2, 3, 4, 10]
      };
      o = {
        aprop: 'aprop',
        bprop: 'bprop',
        cprop: function(param) {
          return param;
        },
        dprop: function(param) {
          return param;
        },
        eprop: 'eprop'
      };
      pubsub = cpubsub.createChannel(o);
      pubsub.attachTo('dprop', function() {
        console.log("subscriber 1 in first object on property with same name - dprop");
      }, 14);
      pubsub.dprop('dprop');
      pro = cpubsub.createChannel(ol);
      pro.attachTo('dprop', function() {
        console.log("subscriber 1");
        this.order_of_dprop_subscribers.push(1);
      }, 1);
      pro.attachTo('dprop', function() {
        console.log("subscriber 2");
        this.order_of_dprop_subscribers.push(2);
      }, 2);
      pro.attachTo('dprop', function() {
        console.log("subscriber 3");
        this.order_of_dprop_subscribers.push(3);
      }, 3);
      pro.attachTo('dprop', function() {
        console.log("subscriber 4");
        this.order_of_dprop_subscribers.push(4);
      }, 4);
      pro.attachTo('dprop', function() {
        console.log("subscriber 2 more important ");
        this.order_of_dprop_subscribers.push(2);
      }, 2);
      pro.attachTo('dprop', function() {
        console.log("subscriber 10 ");
        this.order_of_dprop_subscribers.push(10);
      }, 10);
      pro.dprop('priority of subscribers');
      expect([1, 2, 2, 3, 4, 10].join()).toEqual(pro.order_of_dprop_subscribers.join());
    });
  });
});
