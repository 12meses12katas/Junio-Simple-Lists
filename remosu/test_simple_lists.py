
from simple_lists import SList


def test_simple_list():    
    slist = SList() #list = List.new
    assert slist.find("fred") == None #assert_nil(list.find("fred"))
    slist.add("fred")
    assert "fred" == slist.find("fred").value()
    assert slist.find("wilma") == None #assert_nil(list.find("wilma"))
    slist.add("wildma") #list.add("wilma")
    assert "fred" == slist.find("fred").value() #assert_equal("fred",  list.find("fred").value())
    assert "wildma" == slist.find("wildma").value()   #assert_equal("wilma", list.find("wilma").value())
    #assert_equal(["fred", "wilma"], list.values())

    #list = List.new
    #list.add("fred")
    #list.add("wilma")
    #list.add("betty")
    #list.add("barney")
    #assert_equal(["fred", "wilma", "betty", "barney"], list.values())
    #list.delete(list.find("wilma"))
    #assert_equal(["fred", "betty", "barney"], list.values())
    #list.delete(list.find("barney"))
    #assert_equal(["fred", "betty"], list.values())
    #list.delete(list.find("fred"))
    #assert_equal(["betty"], list.values())
    #list.delete(list.find("betty"))
    #assert_equal([], list.values())
