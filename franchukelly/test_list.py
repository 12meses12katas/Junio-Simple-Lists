# -*- coding: utf-8 -*-

import unittest

from single_list import SingleList


class TestSingleList (unittest.TestCase):
    """
    Unit tests for single list implementation.
    """

    def setUp (self):
        self.list = SingleList ()

    def test_add_values (self):
        """
        Tests add method behaviour.
        New values must be inserted at the end of the list, so the first node
        must be always the same, and the last node must contain the last value
        inserted.
        """
        self.assertTrue (self.list.first_node is None)
        self.assertTrue (self.list.last_node is None)

        self.list.add ('first value')
        self.assertFalse (self.list.first_node is None)
        self.assertEquals (self.list.first_node.value, 'first value')
        self.assertFalse (self.list.last_node is None)
        self.assertEquals (self.list.last_node.value, 'first value')

        self.list.add ('second value')
        self.assertFalse (self.list.first_node is None)
        self.assertEquals (self.list.first_node.value, 'first value')
        self.assertFalse (self.list.last_node is None)
        self.assertEquals (self.list.last_node.value, 'second value')


if __name__ == '__main__':
    unittest.main ()
