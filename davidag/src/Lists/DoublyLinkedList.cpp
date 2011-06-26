/*
 * DoublyLinkedList.cpp
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#include "DoublyLinkedList.h"
#include <cassert>


DoublyLinkedList::DoublyLinkedList()
{
	sentinel_node_ = new DoublyLinkedNode();
	head_ = sentinel_node_;
	tail_ = sentinel_node_;
}

DoublyLinkedList::~DoublyLinkedList()
{
	// Delete all elements in the list. Same as in the singly linked list.
	while (head_ != sentinel_node_)
	{
		DoublyLinkedNode* node_tmp = head_->next_;
		delete head_;
		head_ = node_tmp;
	}
	delete sentinel_node_;
}

void DoublyLinkedList::add(const std::string& _string)
{
	DoublyLinkedNode* new_node = new DoublyLinkedNode(_string);

	// General case
	new_node->next_ = head_;
	head_->prev_ = new_node;
	head_ = new_node;
}

void DoublyLinkedList::remove(DoublyLinkedNode* _node)
{
	// Iterate forward to update next pointers.
	DoublyLinkedNode** prev_node_next = &head_;
	DoublyLinkedNode*  node = head_;

	while (node != sentinel_node_)
	{
		if (node == _node)
		{
			*prev_node_next = node->next_;
			break;
		}
		prev_node_next = &node->next_;
		node = node->next_;
	}

	// Iterate backward to update prev pointers.
	node = tail_;
	DoublyLinkedNode** next_node_prev = &tail_;

	while (node != 0)
	{
		if (node == _node)
		{
			*next_node_prev = node->prev_;
			break;
		}
		next_node_prev = &node->prev_;
		node = node->prev_;
	}

	delete _node;
}
