<?php

class Chain {

  private $first;

  public function find($token) {
    $current = $this->first;
    while ($current != null) {
      if ($token == $current->token)
        return $current;
      $current = $current->next;
    }
    return null;
  }

  public function add($token) {
    if ($this->first == null)
      $this->first = new Link($token);
    else
      $this->getLast()->linkTo(new Link($token));
    return $this;
  }

  public function delete($token) {
    if ($this->isEmpty())
      return $this;

    if ($token == $this->first->token) {
      $this->first = $this->first->next;
      return $this;
    }

    $previous = $this->first;
    $current = $previous->next;
    while ($current != null) {
      if ($token == $current->token)
        $previous->next = $current->next;
      $previous = $previous->next;
      $current = $previous != null ? $previous->next : null;
    }
    return $this;
  }

  public function getTokens() {
    $tokens = array();
    $current = $this->first;
    while ($current != null) {
      $tokens[] = $current->token;
      $current = $current->next;
    }
    return $tokens;
  }

  private function getLast() {
    $current = $this->first;
    while ($current->next != null) {
      $current = $current->next;
    }
    return $current;
  }

  private function isEmpty() {
    return $this->first == null;
  }

}

class Link {

  public $token;
  public $next;

  public function __construct($token) {
    $this->token = $token;
  }

  public function __toString() {
    return $this->token;
  }

  public function linkTo(Link $link) {
    $this->next = $link;
    return $this;
  }

}