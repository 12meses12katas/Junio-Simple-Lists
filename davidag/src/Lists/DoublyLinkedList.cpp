/*
 * DoublyLinkedList.cpp
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#include "DoublyLinkedList.h"
#include <cassert>

DoublyLinkedList::DoublyLinkedList()
	: head_(0), tail_(0)
{

}

DoublyLinkedList::~DoublyLinkedList()
{

}

void DoublyLinkedList::add(const std::string& _string)
{
	DoublyLinkedNode* new_node = new DoublyLinkedNode(_string);

	if (head_ == 0)
	{
		// Boundary condition: Zero elements in the list.
		head_ = new_node;
		tail_ = head_;
	}
	else if (head_ == tail_)
	{
		// Boundary condition: One element in the list.
		head_->next_ = new_node;
		new_node->prev_ = head_;
		tail_ = new_node;
	}
	else
	{
		// General case: More than 1 element in the list.
		tail_->next_ = new_node;
		new_node->prev_ = tail_;
		tail_ = new_node;
	}
}

void DoublyLinkedList::remove(DoublyLinkedNode* _node)
{
	assert(_node != 0);

	if (head_ == _node)
	{
		// Boundary condition: Removing the head of the list.

		// Make the 2nd element, the new head of the list (if it exists).
		if (head_->next_)
		{
			head_->next_->prev_ = 0;
			head_ = head_->next_;
		}
		else
		{
			// or make the list empty.
			head_ = 0;
			tail_ = 0;
		}
	}
	else if (tail_ == _node)
	{
		// Boundary condition: Removing the tail of the list.

		// Make the previous element (which does exist, as this is not the head
		// of the list).
		assert(tail_->prev_ != 0);
		tail_->prev_->next_ = 0;
		tail_ = tail_->prev_;
	}
	else
	{
		// General case: Removing an element that is not the head nor the tail.
		assert(_node->prev_ != 0 && _node->next_ != 0);

		// Link the previous element with the next element.
		_node->prev_->next_ = _node->next_;
		_node->next_->prev_ = _node->prev_;
	}

	// Delete the node.
	delete _node;
}

DoublyLinkedNode* DoublyLinkedList::find(const std::string& _string)
{
	// Same as in a SinglyLinkedList.
	DoublyLinkedNode* node = head_;

	while (node)
	{
		if (node->value_ == _string)
			return node;
		node = node->next_;
	}

	return 0;
}

std::vector<std::string> DoublyLinkedList::values() const
{
	// Same as in a DoublyLinkedList.
	std::vector<std::string> array;
	DoublyLinkedNode* node = head_;

	while (node)
	{
		array.push_back(node->value_);
		node = node->next_;
	}
	return array;
}
