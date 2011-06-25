class SinglyLinkedList:
	class Node:
		def __init__(self, value=None):
			self.value = value
			self.next = None	
		
		def __str__(self):
			if self.next:
				return str(self.value) + ',' + str(self.next)
			else:
				return str(self.value)						

	def __init__(self):
		self.list = None 
	
	def add(self, value):
		if not self.list:
			self.list = self.Node(value)
		else:
			node = self.list
			while node.next:
				node = node.next
			node.next = self.Node(value)	

	def delete(self, value):
		values = self.values()
		self.list = None
		for v in values:
			if v != value:
				self.add(v)

	def find(self, value):
		node = self.list
		while node:
			if node.value == value:
				return node
			node = node.next
		return node	
		
	def length(self):
		node = self.list
		length_ = 0
		while node:
			length_ += 1
			node = node.next
		return length_
					
	def values(self):
		"""Returns a Python list."""
		list = []
		node = self.list
		while node:
			list.append(node.value)
			node = node.next
		return list
if __name__ == "__main__":
	list = SinglyLinkedList()
	list.add(1)
	list.add(2)	
	print list
