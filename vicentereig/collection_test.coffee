collection  = require('./collection.js')
assert = require('assert')
[new collection.LinkedList(), new collection.DoublyLinkedList(), new collection.List()].forEach (list) ->
  list.add "Hello"
  list.add "World"
  assert.equal list.values()[0], "Hello"
  assert.equal list.values()[1], "World"
  assert.equal list.size(), 2
  console.log "#{list}"
  list.delete "World"
  assert.equal list.find "World", null
  assert.equal list.size(), 1
  console.log "#{list}"

  list.clear()
  [1..10].forEach (n) ->
    list.add "#{n}"
  assert.equal list.size(), 10
  console.log "#{list}"
  if list.end?
    assert.equal list.find("5").value, "5"
  else
    assert.equal list.find("5"), "5"

  list.clear()
  list.add "The Virgins - Teen Lovers",
           "Micah P. Hinson - Yard Of Blonde Girls",
           "Los Chunguitos - Soy Un Perro Callejero",
           "Pedazo Hit Acabo de Colar", "Mamá no puedo."
  assert.equal list.size(), 5

  console.log "#{list}"

