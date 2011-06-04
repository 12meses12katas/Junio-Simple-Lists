
class SList(object):
    def __init__(self):
        self._value = None
        self._next = None

    def value(self):
        return self._value
        

    def find(self, value):
        if self._value == value:
            return self
        elif self._value is None:
            return None
        else:
            return self._next.find(value)

    def add(self, value):
        if self._value == None:
            self._value = value
            self._next = SList()
        else:
            self._next.add(value)

    def values(self):
        if self._value is None:
            return []
        else:
            return [self._value] + self._next.values()

    def delete(self, node):
        if node == self:
            self._value = self._next._value
            self._next = self._next._next
        else:
            self._next.delete(node)

class DList(SList):
    def __init__(self):
        self._value = None
        self._next = None
        self._prev = None 

    def add(self, value):
        if self._value == None:
            self._value = value
            self._next = DList()
            self._next._prev = self
        else:
            self._next.add(value)
