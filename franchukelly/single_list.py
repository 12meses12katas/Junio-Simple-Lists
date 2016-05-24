# -*- coding: utf-8 -*-

"""
Single linked list implementation.
"""

from list import List, Node


class SingleList (List):
    """
    A single linked list implementation.
    Each node must have only a reference to the next one.
    """

    def __init__ (self):
        super (SingleList, self).__init__ ()

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
        prev = self.first_node

        # Delete first node
        if prev and prev.value == value:
            self.first_node = prev.next_node

            if self.last_node == prev:
                self.last_node = None

        else:
            next = prev.next_node
            while (next and next.value != value):
                prev = next
                next = next.next_node

            if next:
                prev.next_node = next.next_node
                next.next_node = None

                if self.last_node == next:
                    self.last_node = prev

