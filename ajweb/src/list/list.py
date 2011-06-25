'''
Created on Jun 15, 2011

@author: ajweb.eu
'''

class ListNode():
    '''
    Nodes (items) used by the List class.
    '''
    def __init__( self, value=None):
        self.val = value
        self.next = None
        self.prev = None
    
    def value(self):
        return self.val
    
    def getNext(self):     
        return self.next
    
    def setNext(self, node):
        if node.value(): self.next = node
        else: self.next = None
        return self
        
    def prev(self, node=None):
        if node is not None: self.prev = node 
        return self.prev
    
    def __nonzero__(self):
        return False if self.val==None else True
    

class List(object):
    '''
    list object. holds methods to work on the list and keeps track of the items (nodes)
    '''

    def __init__(self, item=None):
        #self.items = []
        self.first = ListNode()
        if item: self.add(item)
        
        
    def add(self, item):    
        if type(item)==type([]): [self.add(i) for i in item]
        else:
            newNode = ListNode(item)
            if self.isEmpty():
                self.first = newNode
            else:
                self.getLast().setNext(newNode)
        return self
    
    def getLast(self):
        item = self.first
        last = None
        while item:
            last = item
            item = item.getNext()
        return last
            
        
    def empty(self):
        self.first = ListNode()
        return self
    
    def isEmpty(self):
        return False if self.first else True
    
    
    def values(self):
        item = self.first
        values=[]
        while item:
            values.append(item.value())
            item=item.getNext()
        return values
    
    def find(self, value):
        item = self.first
        while item:
            if item.value()==value: return item
            item=item.getNext()
        return None
    
    def __findLinked(self, node):
        """
        finds a node that has the passed node as next (link)
        """
        item=self.first
        while item and item.getNext():
            if item.getNext().value() == node.value(): return item
            item = item.getNext()
        return None   
    
    def delete(self, value):
        item = self.first
        while item :
            if item.value()==value:
                # we have: --prev--item--next
                # we want: --prev--next
                prev = self.__findLinked(item)
                if prev: prev.setNext( item.getNext() or ListNode() )
                if self.first==item: self.first=self.first.getNext() or ListNode()
                del(item)
                return self
            item=item.getNext()
        return self
