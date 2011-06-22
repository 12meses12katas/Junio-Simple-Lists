package com.sortega.simplelists;

/**
 *
 * @author sortega
 */
public class DoubleLinkedNode implements Node {
    private DoubleLinkedNode prev, next;
    private final String value;

    public DoubleLinkedNode(String value) {
        this.value = value;
    }

    @Override
    public String getValue() {
        return value;
    }

    public DoubleLinkedNode getNext() {
        return next;
    }

    public void setNext(DoubleLinkedNode next) {
        this.next = next;
    }

    public DoubleLinkedNode getPrev() {
        return prev;
    }

    public void setPrev(DoubleLinkedNode prev) {
        this.prev = prev;
    }

    public boolean hasPrev() {
        return this.prev != null;
    }

    public boolean hasNext() {
        return this.next != null;
    }
}
