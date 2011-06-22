(function() {
  var assert, bestSongsEver, list, lists, numbers;
  lists = require('./lists.js');
  assert = require('assert');
  list = new lists.LinkedList();
  list.add("Hello");
  list.add("World");
  assert.equal(list.values(), ["Hello", "World"]);
  assert.equal(list.size, 2);
  console.log("" + list);
  numbers = new lists.LinkedList();
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(function(n) {
    return numbers.add("" + n);
  });
  assert.equal(numbers.size, 10);
  console.log("" + numbers);
  bestSongsEver = new lists.LinkedList();
  bestSongsEver.add("The Virgins - Teen Lovers", "Micah P. Hinson - Yard Of Blonde Girls", "Los Chunguitos - Soy Un Perro Callejero", "Pedazo Hit Acabo de Colar", "Mamá no puedo.");
  assert.equal(bestSongsEver.size, 5);
  console.log("" + bestSongsEver);
  assert.equal(numbers.find(5).value, "5");
}).call(this);
