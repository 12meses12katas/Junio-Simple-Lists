package com.jos.katas.simplelists;

public class List {
	
	Element elementsList [] = new Element[10]; // Initial size of 10
	int currentHead = 0;

	public List() {
		for (int i = 0; i < elementsList.length; i++) {
			elementsList[i] = null;
		}
	}
	public Element find(String string) {
		for (int i = 0; i < elementsList.length; i++) {
			if (elementsList[i] != null && elementsList[i].value.equals(string))
				return elementsList[i];
		}
		return null;
	}
	
	public void add(String value) {
		//TODO this is going to break if we go over 10 elements
		if (value != null && !value.equals("")){
			Element newElement = new Element();
			newElement.value = value; // I can access Element.value even if it is private???
			elementsList[currentHead] = newElement;
			++currentHead;
		}
	}

	public void delete(Element element) {
		if (element != null && find(element.getValue()) != null){
			for (int i = 0; i < currentHead; i++) {
				if (elementsList[i].getValue() == element.getValue()){
					for (int j = i; j < currentHead; j++) {
						elementsList[j] = elementsList[j+1];
					}
					elementsList[currentHead] = null;
					--currentHead;
					break;
				}
			}
		}
	}
	
	public String value(Element element) {
		if (element != null)
			return element.value();
		return null;
	}
	
	public String [] values() {
		if (elementsList.length == 0)
			return new String[] {};
		
		String[] theValues = new String[currentHead];
		for (int i = 0; i < currentHead; i++) {
			theValues[i] = elementsList[i].getValue();
		}
		return theValues;
	}
	
	/**
	 * Inner class Element
	 * @author jos
	 *
	 */
	private class Element{
		
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
