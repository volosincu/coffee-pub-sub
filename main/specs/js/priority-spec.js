// Generated by CoffeeScript 1.7.1
define(['jasmine', 'proto'], function(jasmine, Proto) {
  "use strict";
  console.log(jasmine);
  describe("priority on attached subscribers", function() {
    beforeEach(function() {
      var pro;
      return pro = new Proto();
    });
    it("the priority of attached callbacks should chenge", function() {
      var ol, pro;
      ol = {
        aprop: "aval",
        bprop: void 0,
        cprop: void 0,
        dprop: function(param) {
          console.log('bum shaka laka ' + param);
          return 'result';
        }
      };
      pro = new Proto(ol);
      pro.attachTo('dprop', function() {
        console.log("subscriber 1");
        console.log(this.aprop);
      }, 1);
      pro.attachTo('dprop', function() {
        console.log("subscriber 2");
      }, 2);
      pro.attachTo('dprop', function() {
        console.log("subscriber 3");
      }, 3);
      pro.attachTo('dprop', function() {
        console.log("subscriber 4");
      }, 4);
      pro.attachTo('dprop', function() {
        console.log("subscriber 10");
      });
      pro.attachTo('dprop', function() {
        console.log("subscriber mai important 2");
      }, 2);
      console.log(pro.dprop('laka'));
      pro.on('test', function() {
        console.log('test 1, 2, 2, 10');
      });
      pro.trigger(pro, 'test');
    });
  });
});
