/*
 * CircularLinkedList.cpp
 *
 *  Created on: 25/06/2011
 *      Author: david
 */

#include "CircularLinkedList.h"

CircularLinkedList::CircularLinkedList()
{
	sentinel_node_->next_ = head_;
}

void CircularLinkedList::add(const std::string& _string)
{
	SinglyLinkedNode* new_node = new SinglyLinkedNode(_string);
	SinglyLinkedNode* node = head_;

	// General case
	new_node->next_ = head_;

	while (node->next_ != head_)
		node = node->next_;

	node->next_ = new_node;
	head_ = new_node;
}

void CircularLinkedList::remove(SinglyLinkedNode* _node)
{
	if (sentinel_node_->next_ == _node)
		sentinel_node_->next_ = _node->next_;

	SinglyLinkedList::remove(_node);
}

