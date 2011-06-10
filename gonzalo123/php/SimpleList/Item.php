<?php
namespace SimpleList;

class Item
{
    private $key;
    private $value;
    function __construct($key, $value)
    {
        $this->key = $key;
        $this->value = $value;
    }
    public function value()
    {
        return $this->value;
    }

    public function key()
    {
        return $this->key;
    }
}