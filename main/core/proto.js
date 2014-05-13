// Generated by CoffeeScript 1.7.1

/*
  autor Volosincu Bogdan
 */
define([], function() {
  "use strict";
  var Proto;
  Proto = (function() {
    var callbacks, isFunction;

    callbacks = {};

    isFunction = function(o) {
      return typeof o === 'function';
    };

    function Proto(object) {
      var key, value;
      for (key in object) {
        value = object[key];
        if (isFunction(value)) {
          Proto.prototype[key] = function() {
            var i, k, _i, _len, _ref;
            _ref = callbacks[key];
            for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
              k = _ref[i];
              if (k !== void 0) {
                k.apply(Proto.prototype, i === 0 ? arguments : void 0);
              }
            }
          };
          callbacks[key] = [value];
        } else {
          Proto.prototype[key] = value;
        }
      }
    }

    Proto.prototype.on = function(prop, priority, fn) {
      if (arguments[2] === void 0) {
        fn = priority;
        priority = callbacks[prop].length++;
      }
      if (callbacks[prop][priority] === void 0 || callbacks[prop][priority] === null) {
        callbacks[prop][priority] = fn;
      } else {
        Array.prototype.splice.call(callbacks[prop], priority, 0, fn);
      }
    };

    return Proto;

  })();
  return Proto;
});
