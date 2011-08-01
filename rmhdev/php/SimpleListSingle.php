<?php

require_once 'SimpleList.abstract.php';

class SimpleListSingle extends AbstractSimpleList{

    public function add($value) {
        $newNode = new NodeSingle($value);
        if (!$this->getFirstNode()) {
            $this->setFirstNode($newNode);
        } else {
            $this->setLastNode($newNode);
        }
        return $newNode;
    }

    public function delete($value) {
        if ($this->isEmpty()) {
            return;
        }
        $node = $this->getFirstNode();
        if ($node->isValue($value)) {
            $this->deleteFirstNode();
        } else {
            $this->deleteNonFirstNode($value);
        }
    }

    protected function setLastNode($node) {
        $this->getLastNode()->setNextNode($node);
    }

    protected function deleteFirstNode() {
        $node = $this->getFirstNode();
        $nextNode = $node->getNextNode();
        $this->setFirstNode($nextNode);
        unset($node);
    }

    protected function deleteNonFirstNode($value) {
        $node = $this->getFirstNode();
        while (!$node->isValue($value)) {
            $previousNode = $node;
            $node = $node->getNextNode();
        }
        if ($node->isValue($value)) {
            $nextNode = $node->getNextNode();
            $previousNode->setNextNode($nextNode);
            unset($node);
        }
    }

}
