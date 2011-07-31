<?php

require '../SimpleListDouble.php';
require '../NodeDouble.php';

class SimpleListDoubleTest extends PHPUnit_Framework_TestCase{

    public function testFindItemInEmptyList(){
        $list = new SimpleListDouble();
        $this->assertEquals(NULL, $list->find("fred"));
    }

    public function testAddItemShouldReturnNodeDouble(){
        $list = new SimpleListDouble();
        $this->assertInstanceOf('NodeDouble', $list->add("fred"));
    }

    public function testAddItemAndFindItShouldReturnItem() {
        $list = new SimpleListDouble();
        $list->add("fred");
        $this->assertEquals("fred", $list->find("fred")->getValue());
    }

    public function testAddItemAndFindOtherShouldReturnNull(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $this->assertEquals(NULL, $list->find("wilma"));
    }

    public function testAddItemsAndFindTheSecondOne(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $this->assertEquals("wilma", $list->find("wilma")->getValue());
    }

    public function testGetValuesFromEmptyListShouldReturnEmptyArray() {
        $list = new SimpleListDouble();
        $this->assertEquals(array(), $list->values());
    }

    public function testGetValuesFromListShouldReturnArray(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $this->assertEquals(array("fred", "wilma", "betty"), $list->values());
    }

    public function testDeleteValueFromListWithOneItem(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->delete("fred");
        $this->assertEquals(array(), $list->values());
    }

    public function testDeleteFirstValueFromListWithThreeElements(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("fred");
        $this->assertEquals(array("wilma", "betty"), $list->values());
    }

    public function testDeleteLastValueFromListWithThreeElements(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("betty");
        $this->assertEquals(array("fred", "wilma"), $list->values());
    }

    public function testDeleteMediumValueFromListWithThreeElements(){
        $list = new SimpleListDouble();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("wilma");
        $this->assertEquals(array("fred", "betty"), $list->values());
    }

}
