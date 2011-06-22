package com.jos.katas.simplelists;

import com.jos.katas.simplelists.ArrayList.Element;

public interface List {

	public abstract Element find(String string);

	public abstract void add(String value);

	public abstract void delete(Element element);

	public abstract String value(Element element);

	public abstract String[] values();

}