Perhaps there’s more to the humble list of values than you might think. Let’s experiment with some basic list processing.

Lists are one of the first data structures we learn as programmers. But familiarity doesn’t mean that we can’t learn a little from them.
For this kata we’re going to code up three implementations of a list that has the following basic interface:

The list consists of nodes. Each node has a string value, along with whatever housekeeping the list itself needs.
New nodes are added to the end of the list.
You can ask the list if it contains a given string. If it does, it returns the node containing that string.
You can delete a node from the list.
You can ask the list to return an array of all its values.
Here’s a basic set of unit tests to illustrate the behavior.

    list = List.new
    assert_nil(list.find("fred"))
    list.add("fred")
    assert_equal("fred", list.find("fred").value())
    assert_nil(list.find("wilma"))
    list.add("wilma")
    assert_equal("fred",  list.find("fred").value())
    assert_equal("wilma", list.find("wilma").value())
    assert_equal(["fred", "wilma"], list.values())

    list = List.new
    list.add("fred")
    list.add("wilma")
    list.add("betty")
    list.add("barney")
    assert_equal(["fred", "wilma", "betty", "barney"], list.values())
    list.delete(list.find("wilma"))
    assert_equal(["fred", "betty", "barney"], list.values())
    list.delete(list.find("barney"))
    assert_equal(["fred", "betty"], list.values())
    list.delete(list.find("fred"))
    assert_equal(["betty"], list.values())
    list.delete(list.find("betty"))
    assert_equal([], list.values())
For the kata, where the idea is to practice, let’s write three implementations of the list:

A singly linked list (each node has a reference to the next node).
A doubly linked list (each node has a reference to both the next and previous nodes).
Some other implementation of your choosing, except that it should use no references (pointers) to collect nodes together in the list.
Obviously, we won’t be using predefined library classes as our list implementations…

Objectives

There’s nothing magical or surprising in list implementations, but there are a fair number of boundary conditions. For example, when deleting from the singly-linked list, did you have to deal with the case of deleting the first element in the list specially?

For this kata, concentrate on ways of removing as many of these boundary conditions as possible. Then ask yourself: Is the resulting code, which will contain fewer special cases, easier to read and maintain? How easy was it to eliminate these special cases? Were there trade-offs, where removing a special case in one area complicated the code in another. Is there a sweet-spot when it comes to simplifying code?

Original: http://codekata.pragprog.com/2007/01/kata_twenty_one.html