/*
 * DoublyLinkedList.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef DOUBLYLINKEDLIST_H_
#define DOUBLYLINKEDLIST_H_

#include "SimpleList.h"
#include <string>

struct DoublyLinkedNode;

class DoublyLinkedList : public SimpleList<DoublyLinkedNode, std::string>
{
public:
	DoublyLinkedList();
	~DoublyLinkedList();

	// Add a node to the list.
	virtual void 						add(const std::string& _string);

	// Delete a node from the list.
	virtual void						remove(DoublyLinkedNode* _node);

private:
	// The tail of the list.
	DoublyLinkedNode* 			tail_;
};

// A node of the list.
struct DoublyLinkedNode
{
	// Constructors
	DoublyLinkedNode()
		: next_(0), prev_(0) { }

	DoublyLinkedNode(const std::string& _value)
	    : next_(0), prev_(0), value_(_value) { }

	// Next element in the list.
	DoublyLinkedNode* next_;

	// Previous element in the list.
	DoublyLinkedNode* prev_;

	// Value of this node.
	std::string value_;
};

#endif /* DOUBLYLINKEDLIST_H_ */
