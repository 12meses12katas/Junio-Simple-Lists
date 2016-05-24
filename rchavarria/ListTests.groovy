import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test 


class ListTests {
    
    def list
    
    @Before
    public void setUp() throws Exception {
        //        list = new SimplyLinkedList()
        list = new DoublyLinkedList()
    }
    
    @After
    public void tearDown() throws Exception {
    }
    
    @Test
    public void testAddOne(){
        assert list.find("fred") == null
        list.add("fred")
        assert "fred" == list.find("fred").value
    }
    
    @Test
    public void testAddTwo(){
        assert null == list.find("fred")
        
        list.add("fred")
        assert "fred" == list.find("fred").value
        assert list.find("wilma") == null
        
        list.add("wilma")
        assert "fred" == list.find("fred").value
        assert "wilma" == list.find("wilma").value
        assert ["fred", "wilma"]== list.values()
    }
    
    @Test
    public void testMultipleValues(){
        list.add("fred")
        list.add("wilma")
        list.add("betty")
        list.add("barney")
        
        assert "fred" == list.find("fred").value
        assert "wilma" == list.find("wilma").value
        assert "betty" == list.find("betty").value
        assert "barney" == list.find("barney").value
        
        assert [
            "fred",
            "wilma",
            "betty",
            "barney"
        ]== list.values()
    }
    
    @Test
    public void testDelete(){
        list.add("fred")
        list.add("wilma")
        list.add("betty")
        list.add("barney")
        assert [
            "fred",
            "wilma",
            "betty",
            "barney"
        ]== list.values()
        
        list.delete(list.find("wilma"))
        assert [
            "fred",
            "betty",
            "barney"
        ]== list.values()
        
        list.delete(list.find("barney"))
        assert ["fred", "betty"]== list.values()
        
        list.delete(list.find("fred"))
        assert ["betty"]== list.values()
        
        list.delete(list.find("betty"))
        assert []== list.values()
    }
}
