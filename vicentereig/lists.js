(function() {
  var LinkedList, Node;
  var __slice = Array.prototype.slice, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  Node = (function() {
    function Node(value) {
      var _ref;
      this.value = value;
      _ref = [null, null], this.next = _ref[0], this.prev = _ref[1];
    }
    Node.prototype.toString = function() {
      return "<" + this.value + ">";
    };
    return Node;
  })();
  LinkedList = (function() {
    function LinkedList() {
      this.first = null;
      this.size = 0;
    }
    LinkedList.prototype.add = function() {
      var values;
      values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return values.forEach(__bind(function(value) {
        var last, node;
        node = new Node(value);
        if (this.first != null) {
          last = this.first;
          while (last.next != null) {
            last = last.next;
          }
          last.next = node;
        } else {
          this.first = node;
        }
        return this.size++;
      }, this));
    };
    LinkedList.prototype.toString = function() {
      return this.join(", ");
    };
    LinkedList.prototype.join = function(delimiter) {
      var buffer, item;
      if (delimiter == null) {
        delimiter = " ";
      }
      buffer = "";
      item = this.first;
      while (item != null) {
        buffer += "" + item.value;
        if (item.next != null) {
          buffer += delimiter;
        }
        item = item.next;
      }
      return "<" + buffer + ">";
    };
    return LinkedList;
  })();
  exports.LinkedList = LinkedList;
}).call(this);
