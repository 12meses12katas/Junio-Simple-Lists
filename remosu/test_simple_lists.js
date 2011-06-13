var assert = require('assert');
var simple_lists = require('./simple_lists');

slist = new simple_lists.SList();
assert.equal(slist.find("fred"), null);
slist.add("fred")
assert.equal("fred", slist.find("fred").value())
assert.equal(null, slist.find("wilma"))
slist.add("wilma")
assert.equal("fred",  slist.find("fred").value())
assert.equal("wilma", slist.find("wilma").value())
assert.deepEqual(["fred", "wilma"], slist.values())

list = new simple_lists.SList();
list.add("fred")
list.add("wilma")
list.add("betty")
list.add("barney")
assert.deepEqual(["fred", "wilma", "betty", "barney"], list.values())
list.delete(list.find("wilma"))
assert.deepEqual(["fred", "betty", "barney"], list.values())
list.delete(list.find("barney"))
assert.deepEqual(["fred", "betty"], list.values())
list.delete(list.find("fred"))
assert.deepEqual(["betty"], list.values())
list.delete(list.find("betty"))
assert.deepEqual([], list.values())

