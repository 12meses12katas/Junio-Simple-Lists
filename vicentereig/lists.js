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
        var current, node;
        node = new Node(value);
        if (this.first != null) {
          current = this.first;
          while (current.next != null) {
            current = current.next;
          }
          current.next = node;
        } else {
          this.first = node;
        }
        return this.size++;
      }, this));
    };
    LinkedList.prototype.find = function(value) {
      return this.select(function(item) {
        return item.value === ("" + value);
      });
    };
    LinkedList.prototype.values = function() {
      return this.collect(function(node) {
        return node.value;
      });
    };
    LinkedList.prototype.each = function(callback) {
      var item, _results;
      item = this.first;
      _results = [];
      while (item != null) {
        callback.call(this, item);
        _results.push(item = item.next);
      }
      return _results;
    };
    LinkedList.prototype.collect = function(callback) {
      var item, values;
      item = this.first;
      values = [];
      while (item != null) {
        values.push(callback.call(this, item));
        item = item.next;
      }
      return values;
    };
    LinkedList.prototype.select = function(callback) {
      var item, notFound;
      item = this.first;
      notFound = true;
      while ((item != null) && notFound) {
        notFound = !callback.call(this, item);
        if (notFound) {
          item = item.next;
        }
      }
      return item;
    };
    LinkedList.prototype.each = function(callback) {
      var item, _results;
      item = this.first;
      _results = [];
      while (item != null) {
        callback.call(this, item);
        _results.push(item = item.next);
      }
      return _results;
    };
    LinkedList.prototype.toString = function() {
      return this.join(", ");
    };
    LinkedList.prototype.join = function(delimiter) {
      var buffer;
      if (delimiter == null) {
        delimiter = " ";
      }
      buffer = "";
      this.each(function(item) {
        buffer += "" + item.value;
        if (item.next != null) {
          return buffer += delimiter;
        }
      });
      return "<" + buffer + ">";
    };
    return LinkedList;
  })();
  exports.LinkedList = LinkedList;
}).call(this);
