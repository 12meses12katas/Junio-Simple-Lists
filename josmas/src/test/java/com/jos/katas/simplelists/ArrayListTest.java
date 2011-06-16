package com.jos.katas.simplelists;


import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class ArrayListTest {
	
	ArrayList list;
	
	@Before
	public void setUp() throws Exception {
		list = new ArrayList();
	}
	
	@Test
	public void createList() {
		assertNotNull(list);    
	}
	
	@Test
	public void emptyList() {
		assertNull(list.find("fred"));
	}
	
	@Test
	public void addToList() {
		list.add("fred");
	    assertEquals("fred", list.value(list.find("fred")));
	}
	
	@Test
	public void addTwoElements() {
		list.add("fred");
		assertNull(list.find("wilma"));
		list.add("wilma");
	    assertEquals("fred", list.value(list.find("fred")));
	    assertEquals("wilma", list.value(list.find("wilma")));
	}
	
	@Test
	public void itShouldReturnAllValues() {

	    list.add("fred");
	    list.add("wilma");
	    list.add("betty");
	    list.add("barney");
	    assertArrayEquals(new String[] {"fred", "wilma", "betty", "barney"}, list.values());
	}
	
	@Test
	public void itShouldDeleteOneValue() {
		list.add("fred");
	    list.add("wilma");
	    list.add("betty");
	    list.add("barney");
		list.delete(list.find("wilma"));
	    assertArrayEquals(new String[] {"fred", "betty", "barney"}, list.values());
	    list.delete(list.find("barney"));
	    assertArrayEquals(new String[] {"fred", "betty"}, list.values());
	    list.delete(list.find("fred"));
	    assertArrayEquals(new String[] {"betty"}, list.values());
	    list.delete(list.find("betty"));
	    assertArrayEquals(new String[] {}, list.values());
	}
}