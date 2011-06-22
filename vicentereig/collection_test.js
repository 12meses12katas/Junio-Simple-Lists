(function() {
  var assert, collection;
  collection = require('./collection.js');
  assert = require('assert');
  [new collection.LinkedList(), new collection.DoublyLinkedList(), new collection.List()].forEach(function(list) {
    list.add("Hello");
    list.add("World");
    assert.equal(list.values()[0], "Hello");
    assert.equal(list.values()[1], "World");
    assert.equal(list.size(), 2);
    console.log("" + list);
    list["delete"]("World");
    assert.equal(list.find("World", null));
    assert.equal(list.size(), 1);
    console.log("" + list);
    list.clear();
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(function(n) {
      return list.add("" + n);
    });
    assert.equal(list.size(), 10);
    console.log("" + list);
    if (list.end != null) {
      assert.equal(list.find("5").value, "5");
    } else {
      assert.equal(list.find("5"), "5");
    }
    list.clear();
    list.add("The Virgins - Teen Lovers", "Micah P. Hinson - Yard Of Blonde Girls", "Los Chunguitos - Soy Un Perro Callejero", "Pedazo Hit Acabo de Colar", "Mamá no puedo.");
    assert.equal(list.size(), 5);
    return console.log("" + list);
  });
}).call(this);
