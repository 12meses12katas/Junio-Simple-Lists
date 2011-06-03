
from simple_lists import SList


def test_simple_list():    
    slist = SList() 
    assert slist.find("fred") == None 
    slist.add("fred")
    assert "fred" == slist.find("fred").value()
    assert slist.find("wilma") == None 
    slist.add("wildma") 
    assert "fred" == slist.find("fred").value()
    assert "wildma" == slist.find("wildma").value()
    assert ["fred", "wildma"] == slist.values()

    slist = SList()
    slist.add("fred")
    slist.add("wilma")
    slist.add("betty")
    slist.add("barney")
    assert ["fred", "wilma", "betty", "barney"] == slist.values()
    #list.delete(list.find("wilma"))
    #assert_equal(["fred", "betty", "barney"], list.values())
    #list.delete(list.find("barney"))
    #assert_equal(["fred", "betty"], list.values())
    #list.delete(list.find("fred"))
    #assert_equal(["betty"], list.values())
    #list.delete(list.find("betty"))
    #assert_equal([], list.values())
