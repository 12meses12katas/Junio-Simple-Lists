/*
 * SinglyLinkedList.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef SINGLYLINKEDLIST_H_
#define SINGLYLINKEDLIST_H_

#include "SimpleList.h"

struct SinglyLinkedNode;

class SinglyLinkedList : public SimpleList<SinglyLinkedNode>
{
public:
	SinglyLinkedList();
	virtual ~SinglyLinkedList();

	virtual void 						add(const std::string& _string);

	// Deletes a node from the list.
	virtual void						remove(SinglyLinkedNode* _node);

	// Finds a node in the list.
	virtual SinglyLinkedNode*		 	find(const std::string& _string);

	// Returns an array of all the values in the list.
	virtual std::vector<std::string>	values() const;

private:
	// The head of the list.
	SinglyLinkedNode* head_;
};

// A node of the list.
struct SinglyLinkedNode
{
	// Constructors
	SinglyLinkedNode() : next_(0) { }
	SinglyLinkedNode(const std::string& _value) : next_(0), value_(_value) { }

	// Next element in the list.
	SinglyLinkedNode* next_;

	// Value of this node.
	std::string value_;
};


#endif /* SINGLYLINKEDLIST_H_ */
