package com.sortega.simplelists;

/**
 *
 * @author sortega
 */
public class DoubleLinkedList implements SimpleList {

    private DoubleLinkedNode first;

    public DoubleLinkedList() {
        this.first = null;
    }

    @Override
    public void add(String value) {
        DoubleLinkedNode newValue = new DoubleLinkedNode(value);
        if (isEmpty()) {
            this.first = newValue;
        } else {
            insertAfter(findLast(), newValue);
        }
    }

    @Override
    public String[] values() {
        if (isEmpty()) {
            return new String[]{};

        } else {
            String[] values = new String[this.size()];
            DoubleLinkedNode current = first;

            int i = 0;
            while (current != null) {
                values[i] = current.getValue();
                current = current.getNext();
                i++;
            }
            return values;
        }
    }

    @Override
    public Node find(String value) {
        DoubleLinkedNode current = this.first;
        while (current != null) {
            if (current.getValue().equals(value)) {
                return current;
            } else {
                current = current.getNext();
            }
        }

        return null;
    }

    @Override
    public void delete(Node node) {
        DoubleLinkedNode current = this.first;
        while (current != null) {
            if (current.equals(node)) {
                removeNode(current);
                break;
            } else {
                current = current.getNext();
            }
        }
    }

    private void removeNode(DoubleLinkedNode node) {
        if (node == first) {
            this.first = node.getNext();
        }
        if (node.hasPrev()) {
            node.getPrev().setNext(node.getNext());
        }
        if (node.hasNext()) {
            node.getNext().setPrev(node.getPrev());
        }
    }

    public int size() {
        DoubleLinkedNode current = this.first;
        int size = 0;
        while (current != null) {
            current = current.getNext();
            size++;
        }
        return size;
    }

    private boolean isEmpty() {
        return this.first == null;
    }

    private DoubleLinkedNode findLast() {
        DoubleLinkedNode current = first;
        while (current.hasNext()) {
            current = current.getNext();
        }
        return current;
    }

    private void insertAfter(DoubleLinkedNode current, DoubleLinkedNode newValue) {
        current.setNext(newValue);
        newValue.setPrev(current);
    }
}