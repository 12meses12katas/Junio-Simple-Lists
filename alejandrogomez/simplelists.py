class SinglyLinkedList:
    _current = 1
    # TODO give arbitrary values to initialize the list
    def __init__(self, value=None):
        self._value = value
        self._next = None
        
    def __str__(self):
        return ', '.join(map(str, self))
        
    def __iter__(self):
        return self
        
    def next(self):
        elem = self.elem(SinglyLinkedList._current)
        if elem:
            SinglyLinkedList._current += 1
            return elem     
        else:
            SinglyLinkedList._current = 1
            raise StopIteration
            
    def elem(self, index):
        """Returns the value at `index` if exists. If not returns None."""
        if index == 1:
            return self._value
        elif self._next and index > 0:
            return self._next.elem(index - 1)
        else:
            return None
    
    def add(self, value):
        """Add `value` to the bottom of the list."""
        if self._next:
            self._next.add(value)
        elif self._value:
            self._next = SinglyLinkedList(value)
        else:
            self._value = value
            
    def delete(self, value):
        """Delete all occurrences of `value` from the list."""
        new_values = filter(lambda x: x != value, self)
        self._value = self._next = None
        for elem in new_values:
            self.add(elem)
        
    def find(self, value):
        """Returns the node with `value`, if any. If not returns None."""
        if self._value == value:
            return self
        elif self._next:
            self._next.find(value)
        else:
            return None
        
    def length(self):
        """Length of the list."""
        return sum(map(lambda x:1, self))
            
    def values(self):
        """Returns a Python list."""
        return list(self)


class DoublyLinkedList:
    _current = 1
    # TODO give arbitrary values to initialize the list
    def __init__(self, value=None, prev=None):
        self._value = value
        self._prev = prev
        self._next = None
        
    def __str__(self):
        return ', '.join(map(str, self))
        
    def __iter__(self):
        return self
        
    def next(self):
        elem = self.elem(DoublyLinkedList._current)
        if elem:
            DoublyLinkedList._current += 1
            return elem     
        else:
            DoublyLinkedList._current = 1
            raise StopIteration
            
    def elem(self, index):
        """Returns the value at `index` if exists. If not returns None."""
        if index == 1:
            return self._value
        elif self._next and index > 0:
            return self._next.elem(index - 1)
        else:
            return None
    
    def add(self, value):
        """Add `value` to the bottom of the list."""
        if self._next:
            self._next.add(value)
        elif self._value:
            self._next = DoublyLinkedList(value, self)
        else:
            self._value = value
            
    def delete(self, value):
        """Delete all occurrences of `value` from the list."""
        new_values = filter(lambda x: x != value, self)
        self._value = self._next = None
        for elem in new_values:
            self.add(elem)
        
    def find(self, value):
        """Returns the node with `value`, if any. If not returns None."""
        if self._value == value:
            return self
        elif self._next:
            self._next.find(value)
        else:
            return None
        
    def length(self):
        """Length of the list."""
        return sum(map(lambda x:1, self))
            
    def values(self):
        """Returns a Python list."""
        return list(self)