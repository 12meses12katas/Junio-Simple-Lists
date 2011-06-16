package com.sortega.simplelists;

class SinglyLinkedNode implements Node {

    private final String value;
    private SinglyLinkedNode next;

    public SinglyLinkedNode(String value) {
        this.value = value;
        this.next = null;
    }

    @Override
    public String getValue() {
        return this.value;
    }

    public SinglyLinkedNode getNext() {
        return next;
    }

    public void setNext(SinglyLinkedNode next) {
        this.next = next;
    }

    public boolean hasNext() {
        return this.next != null;
    }
}
