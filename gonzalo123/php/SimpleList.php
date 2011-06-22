<?php
require_once dirname(__FILE__) . '/SimpleList/Item.php';
use SimpleList\Item;

class SimpleList
{
    private $list = array();
    public function add($value)
    {
        $this->list[] = $value;
    }
    
    public function find($value)
    {
        $key = array_search($value, $this->list);
        if ($key !== false) {
            return new Item($key, $value);
        }
        return null;
    }
    
    public function values()
    {
        return $this->list;
    }
    
    public function delete(Item $item)
    {
        unset($this->list[$item->key()]);
        $this->list = array_values($this->list);
    }
}
