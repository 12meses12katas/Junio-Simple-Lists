(function() {
  var DoublyLinkedList, LinkedList, List, Node;
  var __slice = Array.prototype.slice, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
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
      var _ref;
      _ref = [null, 0], this.head = _ref[0], this._size = _ref[1];
    }
    LinkedList.prototype.add = function() {
      var values;
      values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      this._size += values.length;
      return values.forEach(__bind(function(value) {
        var node;
        node = new Node(value);
        if (this.head != null) {
          return this.end().next = node;
        } else {
          return this.head = node;
        }
      }, this));
    };
    LinkedList.prototype["delete"] = function(value) {
      return this.reject(function(node) {
        return node.value !== value;
      });
    };
    LinkedList.prototype.reject = function(callback) {
      var current, deleted, prev;
      current = this.head;
      prev = null;
      while (((current != null ? current.next : void 0) != null) && callback.call(this, current)) {
        prev = current;
        current = current.next;
      }
      deleted = current;
      prev.next = current.next;
      this._size--;
      return deleted;
    };
    LinkedList.prototype.find = function(value) {
      return this.select(function(item) {
        return item.value === value;
      });
    };
    LinkedList.prototype.values = function() {
      return this.collect(function(node) {
        return node.value;
      });
    };
    LinkedList.prototype.size = function() {
      return this._size;
    };
    LinkedList.prototype.clear = function() {
      this.head = null;
      return this._size = 0;
    };
    LinkedList.prototype.end = function() {
      var current;
      current = this.head;
      while (current.next != null) {
        current = current.next;
      }
      return current;
    };
    LinkedList.prototype.each = function(callback) {
      var item, _results;
      item = this.head;
      _results = [];
      while (item != null) {
        callback.call(this, item);
        _results.push(item = item.next);
      }
      return _results;
    };
    LinkedList.prototype.collect = function(callback) {
      var item, values;
      item = this.head;
      values = [];
      while (item != null) {
        values.push(callback.call(this, item));
        item = item.next;
      }
      return values;
    };
    LinkedList.prototype.select = function(callback) {
      var item, notFound;
      item = this.head;
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
      item = this.head;
      _results = [];
      while (item != null) {
        callback.call(this, item);
        _results.push(item = item.next);
      }
      return _results;
    };
    LinkedList.prototype.join = function(delimeter) {
      var buffer;
      if (delimeter == null) {
        delimeter = " ";
      }
      buffer = "";
      this.each(function(item) {
        buffer += "" + item.value;
        if (item.next != null) {
          return buffer += delimeter;
        }
      });
      return "<" + buffer + ">";
    };
    LinkedList.prototype.toString = function() {
      return this.join(", ");
    };
    return LinkedList;
  })();
  DoublyLinkedList = (function() {
    __extends(DoublyLinkedList, LinkedList);
    function DoublyLinkedList() {
      DoublyLinkedList.__super__.constructor.apply(this, arguments);
    }
    DoublyLinkedList.prototype.add = function() {
      var values;
      values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      this._size += values.length;
      return values.forEach(__bind(function(value) {
        var last, node;
        node = new Node(value);
        if (this.head != null) {
          last = this.end();
          last.next = node;
          return node.prev = last;
        } else {
          return this.head = node;
        }
      }, this));
    };
    DoublyLinkedList.prototype["delete"] = function(value) {
      var current, next, prev, _ref, _ref2;
      if (((_ref = this.head) != null ? _ref.value : void 0) === value) {
        this.head = this.head.next;
        this.head.prev = null;
        return this._size--;
      } else {
        current = this.head;
        while ((current.next != null) && current.value !== value) {
          current = current.next;
        }
        _ref2 = [current.next, current.prev], next = _ref2[0], prev = _ref2[1];
        if (prev != null) {
          prev.next = next;
        }
        if (next != null) {
          next.prev = prev;
        }
        return this._size--;
      }
    };
    return DoublyLinkedList;
  })();
  List = (function() {
    function List() {
      this.storage = [];
    }
    List.prototype.add = function() {
      var values;
      values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return values.forEach(__bind(function(value) {
        return this.storage.push(value);
      }, this));
    };
    List.prototype.find = function(value) {
      return this.storage[this.storage.indexOf(value)];
    };
    List.prototype.values = function() {
      return this.storage;
    };
    List.prototype["delete"] = function(value) {
      return this.storage.splice(this.storage.indexOf(value), 1);
    };
    List.prototype.toString = function() {
      return "<" + (this.join(", ")) + ">";
    };
    List.prototype.join = function(delimeter) {
      return this.storage.join(delimeter);
    };
    List.prototype.size = function() {
      return this.storage.length;
    };
    List.prototype.clear = function() {
      return this.storage = [];
    };
    return List;
  })();
  this.LinkedList = LinkedList;
  this.DoublyLinkedList = DoublyLinkedList;
  this.List = List;
}).call(this);
