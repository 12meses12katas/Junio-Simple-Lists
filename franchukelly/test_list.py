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

    def test_find_values (self):
        """
        Tests find method behaviour.
        Values can be searched using find method, if a value is not found the
        None value is returned.
        """
        self.assertTrue (self.list.find ('testing') is None)

        self.list.add ('first value')
        self.list.add ('second value')
        self.list.add ('third value')

        self.assertTrue (self.list.find ('testing') is None)
        self.assertEquals (self.list.find ('first value').value, 'first value')
        self.assertEquals (self.list.find ('second value').value,
                           'second value')
        self.assertEquals (self.list.find ('third value').value, 'third value')

    def test_delete_values (self):
        """
        Tests delete method behaviour.
        The list must not have empty nodes when a value is deleted.
        """
        self.list.add ('first value')
        self.list.add ('second value')
        self.list.add ('third value')

        self.list.delete ('second value')
        self.assertEquals (self.list.first_node.value, 'first value')
        self.assertEquals (self.list.last_node.value, 'third value')
        self.assertEquals (self.list.first_node.next_node.value, 'third value')

        self.list.delete ('third value')
        self.assertEquals (self.list.first_node.value, 'first value')
        self.assertEquals (self.list.last_node.value, 'first value')
        self.assertTrue (self.list.first_node.next_node is None)

        self.list.delete ('first value')
        self.assertTrue (self.list.first_node is None)
        self.assertTrue (self.list.last_node is None)

    def test_get_values (self):
        """
        Tests values method behaviour.
        """
        self.assertEquals (self.list.values (), [])

        self.list.add ('first value')
        self.assertEquals (self.list.values (), ['first value'])

        self.list.add ('second value')
        self.assertEquals (self.list.values (), ['first value', 'second value'])

        self.list.delete ('second value')
        self.assertEquals (self.list.values (), ['first value'])

        self.list.delete ('first value')
        self.assertEquals (self.list.values (), [])


if __name__ == '__main__':
    unittest.main ()
