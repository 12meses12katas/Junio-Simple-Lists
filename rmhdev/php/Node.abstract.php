<?php

require_once 'Node.interface.php';

abstract class AbstractNode implements Node {

    protected $value;
    protected $nextNode;

    public function  __construct($value) {
        $this->value = $value;
        $this->nextNode = NULL;
    }

    public function getValue(){
        return $this->value;
    }

    public function isValue($value){
        return ($this->getValue() == $value);
    }

    public function isLastNode(){
        return is_null($this->nextNode);
    }

    public function setNextNode($node){
        $this->nextNode = $node;
    }

    public function getNextNode(){
        return $this->nextNode;
    }

}
