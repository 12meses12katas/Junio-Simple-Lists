'''
Created on Jun 15, 2011

@author: ajweb.eu
'''

import unittest
from list.list import List, ListNode

class TestList(unittest.TestCase):


    def setUp(self):
        self.testList = ['andromeda', 'pegasus', 'olympo']

    def tearDown(self):
        pass
    
    def testAddItem(self):
        self.assertEquals( ListNode('fred').value(), List().add('fred').find('fred').value() )
        self.assertEquals( self.testList, List().add(self.testList).values() )
        
    def testIsEmpty(self):
        self.assertTrue(List().isEmpty())        
      
    def testToEmptyList(self):
        self.assertEquals( [], List('pluton').empty().values() )
        
    def testGetNextNode(self):
        self.assertEquals( 'mercury', List().add('venus').add('mercury').find('venus').getNext().value())
    
    def testGetListValues(self):
        self.assertEquals( self.testList, List(['andromeda', 'pegasus', 'olympo']).values() )
        
    def testFindElement(self):
        self.assertEquals( 'pegasus', List('pegasus').find('pegasus').value() )
    
    def testDeleteElement(self):   
#       delete last element, find returns None if can't find element   
        self.assertEquals( None,  List(['pegasus','andromeda']).delete('andromeda').find('andromeda') )
#       delete first element, check that the first is now the one that was in second place
        self.assertEquals( 'mars', 
                           List().add('pegasus').add('andromeda').add('mars').delete('pegasus').find('andromeda').getNext().value() )
#       delete all elements
        self.assertEquals( [], List(['pegasus','andromeda']).delete('pegasus').delete('andromeda').values())
        
            
    def testGetPrevious(self):
        self.assertEquals('jupiter', List(['jupiter', 'saturn'])
                                        .find('saturn')
                                        .getPrevious()
                                        .value() 
                        )
        self.assertEquals('pluto', List(['urano', 'jupiter', 'pluto', 'saturn', 'mars'])
                                        .delete('saturn')
                                        .find('mars')
                                        .getPrevious()                                        
                        )


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testNewList']
    unittest.main()