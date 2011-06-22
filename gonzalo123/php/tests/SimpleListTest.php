<?php
require_once dirname(__FILE__) . '/../SimpleList.php';

class tSimpleListsTest extends PHPUnit_Framework_TestCase
{
    public function testSimple()
    {
        $simpleList = new SimpleList();
        $this->assertNull($simpleList->find('fred'));
        
        $simpleList->add("fred");
        
        $this->assertEquals("fred", $simpleList->find("fred")->value());
        $this->assertNull($simpleList->find('wilma'));
        
        $simpleList->add("wilma");
        
        $this->assertEquals("fred", $simpleList->find("fred")->value());
        $this->assertEquals("wilma", $simpleList->find("wilma")->value());
        
        $simpleList = new SimpleList();
        $simpleList->add("fred");
        $simpleList->add("wilma");
        $simpleList->add("betty");
        $simpleList->add("barney");
        
        $this->assertEquals(array("fred", "wilma", "betty", "barney"), $simpleList->values());
        $simpleList->delete($simpleList->find("wilma"));

        $this->assertEquals(array("fred", "betty", "barney"), $simpleList->values());

        $simpleList->delete($simpleList->find("barney"));
        $this->assertEquals(array("fred", "betty"), $simpleList->values());

        $simpleList->delete($simpleList->find("fred"));
        $this->assertEquals(array("betty"), $simpleList->values());

        $simpleList->delete($simpleList->find("betty"));
        $this->assertEquals(array(), $simpleList->values());
    }
}