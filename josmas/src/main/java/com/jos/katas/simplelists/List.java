package com.jos.katas.simplelists;

public class List {
	
	ListItem listItems [] = new ListItem[10]; // Initial size of 10
	int currentHead = 0;

	public List() {
		for (int i = 0; i < listItems.length; i++) {
			listItems[i] = null;
		}
	}
	public ListItem find(String string) {
		for (int i = 0; i < listItems.length; i++) {
			if (listItems[i] != null && listItems[i].value.equals(string))
				return listItems[i];
		}
		return null;
	}
	
	public void add(String value) {
		if (value != null && !value.equals("")){
			ListItem newItem = new ListItem();
			newItem.value = value; // I can access ListItem.value even if it is private???
			listItems[currentHead] = newItem;
			++currentHead;
		}
	}
	
	public String value(ListItem item) {
		if (item != null)
			return item.value();
		return null;
	}
	
	public String [] values() {
		if (listItems.length == 0)
			return new String[] {};
		
		String[] theValues = new String[currentHead];
		for (int i = 0; i < currentHead; i++) {
			theValues[i] = listItems[i].getValue();
		}
		return theValues;
	}
	
	/**
	 * Inner class ListItem
	 * @author jos
	 *
	 */
	private class ListItem{
		
		private String value;
		
		public String getValue() {
			return value;
		}

		public void setValue(String value) { //TODO not use cause inserting directly into value from hosting class -- look into this!
			this.value = value;
		}

		public String value() {
			return this.value;
		}
		
	}


}
