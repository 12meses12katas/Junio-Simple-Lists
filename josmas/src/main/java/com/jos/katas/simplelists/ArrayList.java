package com.jos.katas.simplelists;

public class ArrayList implements List {
	
	Element elementsList [] = new Element[10]; // Initial size of 10
	int currentHead = 0;

	public ArrayList() {
		for (int i = 0; i < elementsList.length; i++) {
			elementsList[i] = null;
		}
	}
	/* (non-Javadoc)
	 * @see com.jos.katas.simplelists.List#find(java.lang.String)
	 */
	@Override
	public Element find(String string) {
		for (int i = 0; i < elementsList.length; i++) {
			if (elementsList[i] != null && elementsList[i].value.equals(string))
				return elementsList[i];
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.jos.katas.simplelists.List#add(java.lang.String)
	 */
	@Override
	public void add(String value) {
		//TODO this is going to break if we go over 10 elements
		if (value != null && !value.equals("")){
			Element newElement = new Element();
			newElement.value = value; // I can access Element.value even if it is private???
			elementsList[currentHead] = newElement;
			++currentHead;
		}
	}

	/* (non-Javadoc)
	 * @see com.jos.katas.simplelists.List#delete(com.jos.katas.simplelists.ArrayList.Element)
	 */
	@Override
	public void delete(Element element) {
		if (element != null && find(element.value) != null){
			for (int i = 0; i < currentHead; i++) {
				if (elementsList[i].value == element.value){
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
	
	/* (non-Javadoc)
	 * @see com.jos.katas.simplelists.List#value(com.jos.katas.simplelists.ArrayList.Element)
	 */
	@Override
	public String value(Element element) {
		if (element != null)
			return element.value;
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.jos.katas.simplelists.List#values()
	 */
	@Override
	public String [] values() {
		if (elementsList.length == 0)
			return new String[] {};
		
		String[] theValues = new String[currentHead];
		for (int i = 0; i < currentHead; i++) {
			theValues[i] = elementsList[i].value;
		}
		return theValues;
	}
	
	/**
	 * Inner class Element
	 * @author jos
	 *
	 */
	class Element{
		
		private String value;
		
		public void setValue(String value) { //TODO not use cause inserting directly into value from hosting class -- look into this!
			this.value = value;
		}
	}
}
