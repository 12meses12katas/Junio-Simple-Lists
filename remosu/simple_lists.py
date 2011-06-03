
class SList(object):
    def __init__(self):
        self._value = None
        self._next = None

    def value(self):
        return self._value
        

    def find(self, value):
        if self._value == value:
            return self
        elif self._next:
            return self._next.find(value)
        else:
            return None

    def add(self, value):
        if self._value == None:
            self._value = value
        elif self._next == None:
            self._next = SList()
            self._next._value = value 
        

