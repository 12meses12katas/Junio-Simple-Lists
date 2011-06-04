
from simple_lists import SList, DList


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


def test_double_linked_list():    
    dlist = DList() 
    assert dlist.find("fred") == None 
    dlist.add("fred")
    assert "fred" == dlist.find("fred").value()
    assert dlist.find("wilma") == None 
    dlist.add("wildma") 
    assert "fred" == dlist.find("fred").value()
    assert "wildma" == dlist.find("wildma").value()
    assert ["fred", "wildma"] == dlist.values()

    dlist = DList()
    dlist.add("fred")
    dlist.add("wilma")
    dlist.add("betty")
    dlist.add("barney")
    assert ["fred", "wilma", "betty", "barney"] == dlist.values()
    dlist.delete(dlist.find("wilma"))
    #print dlist.values()
    assert ["fred", "betty", "barney"] == dlist.values()
    dlist.delete(dlist.find("barney"))
    assert ["fred", "betty"] == dlist.values()
    dlist.delete(dlist.find("fred"))
    assert ["betty"] == dlist.values()
    dlist.delete(dlist.find("betty"))
    assert [] == dlist.values()

    dlist.add("pepe")
    dlist.add("cuco")
    assert dlist._next._prev == dlist
    dlist.add("paco")
    assert dlist.find("cuco")._prev.value() == "pepe"
    assert dlist.find("cuco")._next.value() == "paco"
    
    dlist.delete(dlist.find("cuco"))
    assert dlist.find("cuco") is None
    assert dlist.find("paco")._prev.value() == "pepe"

