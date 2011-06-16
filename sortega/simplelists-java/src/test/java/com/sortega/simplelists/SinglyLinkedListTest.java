package com.sortega.simplelists;

import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author sortega
 */
public class SinglyLinkedListTest {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @Test
    public void newListsAreEmpty() {
        SimpleList instance = new SinglyLinkedList();
        assertArrayEquals(new String[0], instance.values());
    }

    @Test
    public void shouldAppendStringsAtTheEnd() {
        SimpleList instance = new SinglyLinkedList();
        instance.add("uno");
        instance.add("dos");
        instance.add("tres");
        assertArrayEquals(new String[] {"uno", "dos", "tres"}, instance.values());
    }

    @Test
    public void nullOnNotFound() {
        SimpleList instance = new SinglyLinkedList();
        instance.add("uno");
        instance.add("dos");
        instance.add("tres");
        assertNull(instance.find("cuatro"));
    }

    @Test
    public void nodeWhenFound() {
        SimpleList instance = new SinglyLinkedList();
        instance.add("uno");
        instance.add("dos");
        instance.add("tres");
        instance.add("dos");

        Node result = instance.find("dos");
        assertNotNull(result);
        assertEquals("dos", result.getValue());
    }

    @Test
    public void shouldDeleteNodes() {
         SimpleList instance = new SinglyLinkedList();
        instance.add("fred");
        instance.add("wilma");
        instance.add("betty");
        instance.add("barney");

        assertArrayEquals(new String[] {"fred", "wilma", "betty", "barney"},
                instance.values());
        instance.delete(instance.find("wilma"));
        assertArrayEquals(new String[] {"fred", "betty", "barney"},
                instance.values());
        instance.delete(instance.find("barney"));
        assertArrayEquals(new String[] {"fred", "betty"}, instance.values());
        instance.delete(instance.find("fred"));
        assertArrayEquals(new String[] {"betty"}, instance.values());
        instance.delete(instance.find("betty"));
        assertArrayEquals(new String[] {}, instance.values());
    }
}