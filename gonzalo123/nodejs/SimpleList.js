var Class = require('./Class.js').Class;

SimpleElement = Class.extend({
    value: null,
    next: null,
    
    init: function(value) {
        this.value = value;  
    },
    
    find: function(value) {
        if (value == this.value)
            return this;
        return this.hasNext() ? this.next.find(value) : null;
    },
    
    add: function(element) {
        this.next = element;
        return this;
    },
    
    getAll: function() {
        var all = [this];
        if (this.next != null) {
            all = all.concat(this.next.getAll());
        }
        return all;
    },
    
    remove: function(element) {
        if (this.next == element) {
            this.next = element.next;
            return true;
        } else if (this.hasNext()) {
            this.next.remove(element);
        }
        return false;
    },
    
    hasNext: function() {
        return this.next != null;
    }
});

exports.SimpleElement = SimpleElement;
