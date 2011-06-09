package com.sortega.simplelists;

/**
 *
 * @author sortega
 */
public interface SimpleList {
    public Node find(String value);
    public void add(String value);
    public String[] values();
    public void delete(Node node);
}
