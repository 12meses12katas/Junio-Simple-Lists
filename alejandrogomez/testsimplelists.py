import unittest

from simplelists import SinglyLinkedList, DoublyLinkedList, MyList

class SinglyLinkedListTest(unittest.TestCase):
    def setUp(self): 
        self.sut = SinglyLinkedList()

    def test_singly_linked_list(self):
        self.assertIsNone(self.sut.find("adam"))
        self.assertEqual(0, self.sut.length())  
        self.sut.add("edgar")
        self.assertEqual(1, self.sut.length())
        self.sut.add("allen")
        self.assertEqual(2, self.sut.length())
        self.assertEqual("edgar", self.sut.find("edgar")._value)
        self.assertEqual(["edgar", "allen"], self.sut.values()) 
        self.sut.delete("allen")
        self.assertIsNone(self.sut.find("allen"))
        self.assertEqual(1, self.sut.length())
        self.sut.delete("adam")
        self.assertEqual(1, self.sut.length())
        self.sut.delete("edgar")
        self.assertEqual(0, self.sut.length())


class DoublyLinkedListTest(unittest.TestCase):
    def setUp(self): 
        self.sut = DoublyLinkedList()

    def test_singly_linked_list(self):
        self.assertIsNone(self.sut.find("adam"))
        self.assertEqual(0, self.sut.length())  
        self.sut.add("edgar")
        self.assertEqual(1, self.sut.length())
        self.sut.add("allen")
        self.assertEqual(2, self.sut.length())
        self.assertEqual("edgar", self.sut.find("edgar")._value)
        self.assertEqual(["edgar", "allen"], self.sut.values()) 
        self.sut.delete("allen")
        self.assertIsNone(self.sut.find("allen"))
        self.assertEqual(1, self.sut.length())
        self.sut.delete("adam")
        self.assertEqual(1, self.sut.length())
        self.sut.delete("edgar")
        self.assertEqual(0, self.sut.length())

class MyListTest(unittest.TestCase):
    def setUp(self): 
        self.sut = MyList()

    def test_singly_linked_list(self):
        self.assertIsNone(self.sut.find("adam"))
        self.assertEqual(0, self.sut.length())  
        self.sut.add("edgar")
        self.assertEqual(1, self.sut.length())
        self.sut.add("allen")
        self.assertEqual(2, self.sut.length())
        self.assertEqual("edgar", self.sut.find("edgar")._value)
        self.assertEqual(["edgar", "allen"], self.sut.values()) 
        self.sut.delete("allen")
        self.assertIsNone(self.sut.find("allen"))
        self.assertEqual(1, self.sut.length())
        self.sut.delete("adam")
        self.assertEqual(1, self.sut.length())
        self.sut.delete("edgar")
        self.assertEqual(0, self.sut.length())
if __name__ == "__main__":
    unittest.main()  
