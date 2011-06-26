/*
 * SinglyLinkedList.cpp
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#include "SinglyLinkedList.h"
#include <cassert>


SinglyLinkedList::SinglyLinkedList()
{
	sentinel_node_ = new SinglyLinkedNode();
	head_ = sentinel_node_;
}

SinglyLinkedList::~SinglyLinkedList()
{
	// Delete all elements in the list.
	while (head_ != sentinel_node_)
	{
		SinglyLinkedNode* node_tmp = head_->next_;
		delete head_;
		head_ = node_tmp;
	}
	delete sentinel_node_;
}

void SinglyLinkedList::add(const std::string& _string)
{
	SinglyLinkedNode* new_node = new SinglyLinkedNode(_string);

	// General case
	new_node->next_ = head_;
	head_ = new_node;
}

void SinglyLinkedList::remove(SinglyLinkedNode* _node)
{
	// General case
	SinglyLinkedNode** prev_node_next = &head_;
	SinglyLinkedNode*  node = head_;

	while (node != sentinel_node_)
	{
		if (node == _node)
		{
			*prev_node_next = node->next_;
			delete _node;
			return;
		}
		prev_node_next = &node->next_;
		node = node->next_;
	}
}
