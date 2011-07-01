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
        
    def getPrevious(self):
        return self.prev
    
    def setPrevious(self, node):
        if node.value(): self.prev = node
        else: self.prev = None
        return self
    
    def __nonzero__(self):
        return False if self.val==None else True
    

class List(object):
    '''
    list object. holds methods to work on the list and keeps track of the items (nodes)
    Only keeps a one reference, to the first item on the list
    '''

    def __init__(self, item=None):
        self.first = ListNode()
        if item: self.add(item)
        
        
    def add(self, item):    
        if type(item)==type([]): [self.add(i) for i in item]
        else:
            newNode = ListNode(item)
            if self.isEmpty():
                self.first = newNode
            else:
                newNode.setPrevious(self.getLast())
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
    
    def __findLinkedUp(self, node):
        """
            finds a node that has the node passed as arg as next (link)
            todo: this should need no loop: just get the item previous
                  to the current one
        """
        item=self.first
        while item and item.getNext():
            if item.getNext().value() == node.value(): return item
            item = item.getNext()
        return None   
    
    def __findLinkedDown(self, node):
        """ finds a node that has the passed node as prev link 
            todo: just get the next node? Is it really possible to have a 
                  link to the current node in a place on the chain
                  that is not the next or previous nodes?
        """
        item = self.getLast()
        while item and item.getPrevious():
            if item.getPrevious().value() == node.value(): return item
            item = item.getPrevious()
        return None
    
    def delete(self, value):
        item = self.first
        while item :
            if item.value()==value:
                # we have: --1--2--3
                # we want: --1--3--4
                prev = self.__findLinkedUp(item)
                next = self.__findLinkedDown(item)
                if prev: prev.setNext( item.getNext() or ListNode() )
                if next: next.setPrevious( item.getPrevious() or ListNode() )
                if self.first==item: self.first=self.first.getNext() or ListNode()
                del(item)
                return self
            item=item.getNext()
        return self

    
    
        
        