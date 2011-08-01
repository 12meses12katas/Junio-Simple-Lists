<?php

require_once 'SimpleList.abstract.php';

class SimpleListDouble extends AbstractSimpleList{

    public function add($value){
        $newNode = new NodeDouble($value);
        if ($this->isEmpty()){
            $this->setFirstNode($newNode);
        } else {
            $this->setLastNode($newNode);
        }
        return $newNode;
    }

    public function delete($value){
        $node = $this->find($value);
        if (!$node){
            return;
        }
        if ($node->isFirstNode()){
            $this->setFirstNode($node->getNextNode());
        }
        $node->unlink();
        unset($node);
    }

    protected function setLastNode($node) {
        $this->getLastNode()->appendNextNode($node);
    }
}
