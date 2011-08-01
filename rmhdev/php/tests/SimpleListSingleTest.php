<?php

require '../SimpleListSingle.php';
require '../NodeSingle.php';

class SimpleListSingleTest extends PHPUnit_Framework_TestCase {

    public function testFindItemInEmptyListShouldReturnNull(){
        $list = new SimpleListSingle();
        $this->assertEquals(NULL, $list->find("fred"));
    }

    public function testSingleAddItemShouldReturnNodeSingle(){
        $list = new SimpleListSingle();
        $this->assertInstanceOf('NodeSingle', $list->add("fred"));
    }

    public function testSingleAddItemAndFindItShouldReturnItem() {
        $list = new SimpleListSingle();
        $list->add("fred");
        $this->assertEquals("fred", $list->find("fred")->getValue());
    }

    public function testSingleAddItemAndFindOtherShouldReturnNull(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $this->assertEquals(NULL, $list->find("wilma"));
    }

    public function testSingleAddItemsAndFindTheSecondOne(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $this->assertEquals("wilma", $list->find("wilma")->getValue());
    }

    public function testSingleGetValuesFromEmptyListShouldReturnEmptyArray() {
        $list = new SimpleListSingle();
        $this->assertEquals(array(), $list->values());
    }

    public function testSingleGetValuesFromListShouldReturnArray(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $this->assertEquals(array("fred", "wilma", "betty"), $list->values());
    }

    public function testSingleDeleteValueFromListWithOneItem(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->delete("fred");
        $this->assertEquals(array(), $list->values());
    }

    public function testSingleDeleteFirstValueFromListWithThreeElements(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("fred");
        $this->assertEquals(array("wilma", "betty"), $list->values());
    }

    public function testSingleDeleteLastValueFromListWithThreeElements(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("betty");
        $this->assertEquals(array("fred", "wilma"), $list->values());
    }

    public function testSingleDeleteMediumValueFromListWithThreeElements(){
        $list = new SimpleListSingle();
        $list->add("fred");
        $list->add("wilma");
        $list->add("betty");
        $list->delete("wilma");
        $this->assertEquals(array("fred", "betty"), $list->values());
    }

}
