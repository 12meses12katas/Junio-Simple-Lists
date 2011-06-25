class SinglyLinkedList:
    class Node:
        def __init__(self, value=None):
            self.value = value
            self.next = None    
        

    def __init__(self):
        self.list = None 
    
    def __str__(self):
        values = self.values()
        return ", ".join(map(str, values))
            
    def add(self, value):
        """Adds `value` to the list."""
        if self.list:
            node = self.list
            while node.next:
                node = node.next
            node.next = self.Node(value)    
        else:
            self.list = self.Node(value)

    def delete(self, value):
        """Deletes all occurences of `value` from the list."""
        values = self.values()
        self.list = None
        for v in filter(lambda v: v != value, values):
            self.add(v)

    def find(self, value):
        """
        If `value` is in the list, returns the first
        Node object that has that value.
        In other case returns None.
        """
        node = self.list
        while node:
            if node.value == value:
                return node
            node = node.next
        return node 
        
    def length(self):
        """Returns the length of the list."""
        return len(self.values())
            
    def values(self):
        """Returns a Python list."""
        list = []
        node = self.list
        while node:
            list.append(node.value)
            node = node.next
        return list

class DoublyLinkedList:
    class Node:
        def __init__(self, value, prev=None):
            self.value = value
            self.prev = prev
            self.next = None
    
    def __init__(self):
        self.list = None
    
    def __str__(self):
        values = self.values()
        return ", ".join(map(str, values))

    def add(self, value):
        """Adds `value` to the list."""
        if self.list:
            node = self.list
            while node.next:
                node = node.next
            node.next = self.Node(value, node)
        else:
            self.list = self.Node(value)

    def delete(self, value):
        """Deletes all occurrences of `value` from the list."""
        values = self.values()
        self.list = None
        for v in filter(lambda v: v != value, values):
            self.add(v)

    def find(self, value):
        """
        If `value` is in the list, returns the first
        Node object that has that value.
        In other case returns None.
        """
        node = self.list
        while node:
            if node.value == value:
                return node
            node = node.next
        return node

    def length(self):
        """Returns the length of the list."""
        return len(self.values())   

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
