// Generated by CoffeeScript 1.7.1

/*
  autor Volosincu Bogdan
 */
define([], function() {
  "use strict";
  var PubSub2;
  PubSub2 = (function() {
    var call_, subs;

    function PubSub2() {}

    subs = [];

    call_ = function(obj, nume_, data_) {
      if (obj.nume === nume_) {
        obj.func.call(null, data_);
      }
      return false;
    };

    PubSub2.prototype.publish = function(nume, data) {
      var key, _i, _len;
      for (_i = 0, _len = subs.length; _i < _len; _i++) {
        key = subs[_i];
        call_(key, nume, data);
      }
      return false;
    };

    PubSub2.prototype.subscribe = function(nume_, func_) {
      if (nume_ === 'undefined' || nume_ === null) {
        return;
      }
      if ((func_ === 'undefined' || func_ === null) && typeof func_(!'function')) {
        return;
      }
      subs.push({
        nume: nume_,
        func: func_
      });
      return false;
    };

    return PubSub2;

  })();
  return PubSub2;
});