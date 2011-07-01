# -*- coding: utf-8 -*-

"""
List TDD kata.
"""


class Node (object):
    """
    A list's node.
    """

    def __init__ (self, value):
        """
        Creates a new list's node.
        """
        self.value = value
        self.next_node = None


class List (object):
    """
    Abstract class for list implementations.
    """

    def __init__ (self):
        """
        Creates an empty list.
        """
        self.first_node = None
        self.last_node = None

    def add (self, value):
        """
        Adds a new value at the end of the list.
        """
        pass

    def find (self, value):
        """
        Finds a value into the list.
        """
        pass

    def delete (self, value):
        """
        Deletes a value from the list.
        """
        pass

    def values (self):
        """
        Returns an array (in this case it's a Python's list) with all the
        values from the list.
        """
        values_list = []
        node = self.first_node
        while node:
            values_list.append (node.value)
            node = node.next_node

        return values_list

