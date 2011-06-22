package com.sortega.simplelists;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author sortega
 */
public class SinglyLinkedListTest {
    private SimpleList empty;
    private SimpleList numbers;
    private SimpleList names;

    @Before
    public void setUp() throws Exception {
        empty = new SinglyLinkedList();

        numbers = new SinglyLinkedList();
        numbers.add("uno");
        numbers.add("dos");
        numbers.add("tres");

        names = new SinglyLinkedList();
        names.add("fred");
        names.add("wilma");
        names.add("betty");
        names.add("barney");
    }

    @Test
    public void newListsAreEmpty() {
        SimpleList instance = new SinglyLinkedList();
        assertArrayEquals(new String[0], instance.values());
    }

    @Test
    public void shouldAppendFirstElement() {
        empty.add("primero");
        assertArrayEquals(new String[] {"primero"},
                empty.values());
    }

    @Test
    public void shouldAppendStringsAtTheEnd() {
        numbers.add("cuatro");
        assertArrayEquals(new String[] {"uno", "dos", "tres", "cuatro"},
                numbers.values());
    }

    @Test
    public void nullOnNotFound() {
        assertNull(numbers.find("cuatro"));
    }

    @Test
    public void nodeWhenFound() {
        Node result = numbers.find("dos");
        assertNotNull(result);
        assertEquals("dos", result.getValue());
    }

    @Test
    public void shouldDeleteFirst() {
        names.delete(names.find("fred"));
        assertArrayEquals(new String[] {"wilma", "betty", "barney"},
                names.values());
    }

    @Test
    public void shouldDeleteLast() {
        names.delete(names.find("barney"));
        assertArrayEquals(new String[] {"fred", "wilma", "betty"},
                names.values());
    }

    @Test
    public void shouldDeleteNode() {
        names.delete(names.find("wilma"));
        assertArrayEquals(new String[] {"fred", "betty", "barney"},
                names.values());
    }

    @Test
    public void shouldDeleteOnly() {
        SimpleList list = new SinglyLinkedList();
        list.add("only");

        list.delete(list.find("only"));
        assertArrayEquals(new String[] {}, list.values());
    }
}
