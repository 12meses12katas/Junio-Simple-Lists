<?php

require_once '../src/Chain.php';
require_once 'Hamcrest/hamcrest.php';

class ChainTests extends PHPUnit_Framework_TestCase {

  public function test_add_behaviour() {
    $chain = new Chain();
    assertThat($chain->find('fred'), is(null));
    $chain->add('fred');
    assertThat($chain->find('fred'), is('fred'));
    assertThat($chain->find('wilma'), is(null));
    $chain->add('wilma');
    assertThat($chain->find('fred'), is('fred'));
    assertThat($chain->find('wilma'), is('wilma'));
    assertThat($chain->getTokens(), contains(array('fred', 'wilma')));
  }

  public function test_delete_behaviour() {
    $chain = new Chain();
    $chain->add('fred')->add('wilma')->add('betty')->add('barney');
    assertThat($chain->getTokens(), contains(array('fred', 'wilma', 'betty', 'barney')));
    $chain->delete('wilma');
    assertThat($chain->getTokens(), contains(array('fred', 'betty', 'barney')));
    $chain->delete('barney');
    assertThat($chain->getTokens(), contains(array('fred', 'betty')));
    $chain->delete('fred');
    assertThat($chain->getTokens(), contains(array('betty')));
    $chain->delete('betty');
    assertThat($chain->getTokens(), contains(array()));
  }

}