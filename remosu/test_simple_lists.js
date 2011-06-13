var assert = require('assert');
var simple_lists = require('./simple_lists');

slist = new simple_lists.SList();
slist.find("fred");
assert.equal(slist.find("fred"), null);
