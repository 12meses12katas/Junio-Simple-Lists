# -*- coding: utf-8 -*-

"""
Double linked list implementation.
"""

from list import List, Node


class DoubleList (List):
    """
    A double linked list implementation.
    Each node must have a reference to the next and the previous one.
    """

    def __init__ (self):
        super (DoubleList, self).__init__ ()

    def add (self, value):
        """
        Adds a new value at the end of the list.
        """
        node = Node (value)

        # Empty list
        if not self.first_node:
            self.first_node = node

        else:
            self.last_node.next_node = node

        # Add node at the end of the list
        node.prev_node = self.last_node
        self.last_node = node

    def find (self, value):
        """
        Finds a value into the list, it returns the node that contains the
        given value.
        """
        node = self.first_node
        while (node and node.value != value):
            node = node.next_node

        return node

    def delete (self, value):
        """
        Deletes the node that contains the given value from the list.
        """
        node = self.find (value)

        # Delete first node
        if self.first_node == node:
            self.first_node = node.next_node
            if node.next_node:
                node.next_node.prev_node = None

        else:
            prev = node.prev_node
            prev.next_node = node.next_node
            if node.next_node:
                node.next_node.prev_node = prev
            

        # Delete last node
        if self.last_node == node:
            self.last_node = node.prev_node

        node.prev_node = None
        node.next_node = None

