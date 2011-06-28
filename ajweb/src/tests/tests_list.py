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
    
    def testGetListValues(self):
        self.assertEquals( self.testList, List(['andromeda', 'pegasus', 'olympo']).values() )
        
    def testFindElement(self):
        self.assertEquals( 'pegasus', List('pegasus').find('pegasus').value() )
    
    def testDeleteElement(self):     
        self.assertEquals( None,  List(['pegasus','andromeda']).delete('andromeda').find('andromeda') )
        self.assertEquals( ['pegasus','andromeda'], 
                           List().add('pegasus').add('andromeda').add('mars').delete('mars').values() )
        self.assertEquals( [], List(['pegasus','andromeda']).delete('pegasus').delete('andromeda').values())

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testNewList']
    unittest.main()