
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
    slist.delete(slist.find("wilma"))
    print slist.values()
    assert ["fred", "betty", "barney"] == slist.values()
    slist.delete(slist.find("barney"))
    assert ["fred", "betty"] == slist.values()
    slist.delete(slist.find("fred"))
    assert ["betty"] == slist.values()
    slist.delete(slist.find("betty"))
    assert [] == slist.values()
