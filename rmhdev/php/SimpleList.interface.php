<?php

interface SimpleList {

    public function add($value);

    public function find($value);

    public function values();

    public function delete($value);
}
