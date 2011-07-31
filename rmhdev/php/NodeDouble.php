<?php

require_once 'Node.abstract.php';

class NodeDouble extends AbstractNode{

    protected $previousNode;

    public function  __construct($value) {
        $this->previousNode = NULL;
        parent::__construct($value);
    }

    public function getPreviousNode() {
        return $this->previousNode;
    }

    protected function setPreviousNode($node){
        $this->previousNode = $node;
    }

    public function appendNextNode($node){
        $this->setNextNode($node);
        if ($node){
            $oldPreviousNode = $node->getPreviousNode();
            if ($oldPreviousNode){
                $this->setPreviousNode($oldPreviousNode->getPreviousNode());
                $oldPreviousNode->setNextNode($this);
            }
            $node->setPreviousNode($this);
        }
    }

    public function isFirstNode() {
        return is_null($this->previousNode);
    }

    public function unlink(){
        $previousNode = $this->getPreviousNode();
        $nextNode = $this->getNextNode();

        if ($previousNode){
            $previousNode->setNextNode($nextNode);
        }
        if ($nextNode){
            $nextNode->setPreviousNode($previousNode);
        }
    }
}
