# -*- coding: utf-8 -*-

"""
Single list implementation.
"""

from list import List, Node


class SingleList (List):
    """
    A single list implementation.
    Each node must have only a reference to the next one.
    """

    def __init__ (self):
        super (SingleList, self).__init__ ()
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
        pass

