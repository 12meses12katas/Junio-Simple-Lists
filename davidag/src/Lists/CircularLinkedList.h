/*
 * CircularLinkedList.h
 *
 *  Created on: 25/06/2011
 *      Author: david
 */

#ifndef CIRCULARLINKEDLIST_H_
#define CIRCULARLINKEDLIST_H_

#include "SinglyLinkedList.h"

class CircularLinkedList : public SinglyLinkedList {
public:
	CircularLinkedList();

	// Add a node to the list.
	virtual void 						add(const std::string& _string);

	// Delete a node from the list.
	virtual void						remove(SinglyLinkedNode* _node);
};

#endif /* CIRCULARLINKEDLIST_H_ */
