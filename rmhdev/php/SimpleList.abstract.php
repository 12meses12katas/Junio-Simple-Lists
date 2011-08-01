<?php

require_once 'SimpleList.interface.php';

abstract class AbstractSimpleList implements SimpleList{

    protected $firstNode;

    public function __construct() {
        $this->firstNode = NULL;
    }

    public function find($value) {
        if (!$this->isEmpty()) {
            $node = $this->getFirstNode();
            while ($node) {
                if ($node->isValue($value)) {
                    return $node;
                }
                $node = $node->getNextNode();
            }
        }
        return NULL;
    }

    protected function getFirstNode() {
        return $this->firstNode;
    }

    protected function setFirstNode($node) {
        $this->firstNode = $node;
    }

    public function values() {
        if ($this->isEmpty()) {
            return array();
        }
        $node = $this->getFirstNode();
        $result = array();
        while ($node) {
            $result[] = $node->getValue();
            $node = $node->getNextNode();
        }
        return $result;
    }

    protected function isEmpty(){
        return is_null($this->firstNode);
    }

    protected function getLastNode(){
        $lastNode = $this->getFirstNode();
        while (!$lastNode->isLastNode()){
            $lastNode = $lastNode->getNextNode();
        }
        return $lastNode;
    }

}
