import unittest

from simplelists import SinglyLinkedList

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
		self.assertEqual("edgar", self.sut.find("edgar").value)
		self.assertEqual(["edgar", "allen"], self.sut.values())	
		self.sut.delete("edgar")
		self.assertIsNone(self.sut.find("edgar"))
		self.assertEqual(1, self.sut.length())
		self.sut.delete("adam")
		self.assertEqual(1, self.sut.length())
		self.sut.delete("allen")
		self.assertEqual(0, self.sut.length())


if __name__ == "__main__":
	unittest.main()	 
