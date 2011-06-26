/*
 * SinglyLinkedList.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef SINGLYLINKEDLIST_H_
#define SINGLYLINKEDLIST_H_

#include "SimpleList.h"
#include <string>

struct SinglyLinkedNode;

class SinglyLinkedList : public SimpleList<SinglyLinkedNode, std::string>
{
public:
	SinglyLinkedList();
	~SinglyLinkedList();

	// Add a node to the list.
	virtual void 						add(const std::string& _string);

	// Delete a node from the list.
	virtual void						remove(SinglyLinkedNode* _node);
};

// A node of the list.
struct SinglyLinkedNode
{
	// Constructors
	SinglyLinkedNode()
		: next_(0) { }

	SinglyLinkedNode(const std::string& _value)
		: next_(0), value_(_value) { }

	// Next element in the list.
	SinglyLinkedNode* next_;

	// Value of this node.
	std::string value_;
};


#endif /* SINGLYLINKEDLIST_H_ */
