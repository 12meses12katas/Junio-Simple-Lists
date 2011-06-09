package com.sortega.simplelists;

/**
 *
 * @author sortega
 */
public class SinglyLinkedList implements SimpleList {
    private SinglyLinkedNode firstNode;

    public SinglyLinkedList() {
        this.firstNode = null;
    }

    @Override
    public Node find(String value) {
        for (SinglyLinkedNode node = this.firstNode; node != null; node = node.getNext()) {
            if (node.getValue().equals(value)) {
                return node;
            }
        }
        return null;
    }

    @Override
    public void add(String value) {
        SinglyLinkedNode newNode = new SinglyLinkedNode(value);
        if (this.firstNode == null) {
            this.firstNode = newNode;
        } else {
           SinglyLinkedNode lastNode = firstNode;
           while(lastNode.hasNext()) {
               lastNode = lastNode.getNext();
           }
           lastNode.setNext(newNode);
        }
    }

    @Override
    public String[] values() {
        String[] values = new String[this.size()];
        int i=0;
        for (SinglyLinkedNode node = this.firstNode; node != null; node = node.getNext()) {
            values[i++] = node.getValue();
        }
        return values;
    }

    @Override
    public void delete(Node node) {
        if (this.firstNode == node) {
            this.firstNode = this.firstNode.getNext();
        } else {
            SinglyLinkedNode previousNode = this.firstNode;
            while (previousNode.hasNext()) {
                SinglyLinkedNode currentNode = previousNode.getNext();
                if (node == currentNode) {
                    previousNode.setNext(currentNode.getNext());
                    break;
                }
                previousNode = previousNode.getNext();
            }
        }
    }

    private int size() {
        int size = 0;
        SinglyLinkedNode next = firstNode;
        while (next != null) {
            size++;
            next = next.getNext();
        }
        return size;
    }
}
