<?php

interface Node {

    public function getValue();

    public function isValue($value);

    public function isLastNode();

    public function setNextNode($node);

    public function getNextNode();
    
}
