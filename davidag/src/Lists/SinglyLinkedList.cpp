/*
 * SinglyLinkedList.cpp
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#include "SinglyLinkedList.h"
#include <cassert>

SinglyLinkedList::SinglyLinkedList()
	: head_(0)
{

}

SinglyLinkedList::~SinglyLinkedList()
{
	// Delete all elements in the list.
	while (head_)
	{
		SinglyLinkedNode* node_tmp = head_->next_;
		delete head_;
		head_ = node_tmp;
	}
}

void SinglyLinkedList::add(const std::string& _string)
{
	SinglyLinkedNode* new_node = new SinglyLinkedNode(_string);

	// Boundary condition: Zero elements in the list.
	if (head_ == 0)
	{
		head_ = new_node;
		return;
	}
	else
	{
		new_node->next_ = head_;
		head_ = new_node;
	}
}

void SinglyLinkedList::remove(SinglyLinkedNode* _node)
{
	assert(_node != 0);

	// Boundary condition: remove the head element.
	if (head_ == _node)
	{
		head_ = head_->next_;
		delete _node;
	}
	else
	{
		// General case: removing an element that is not the head element.
		SinglyLinkedNode* node = head_;
		while (node->next_)
		{
			if (node->next_ == _node)
			{
				node->next_ = node->next_->next_;
				delete _node;
				return;
			}
			node = node->next_;
		}

		assert(false && "Node not found");
	}
}

SinglyLinkedNode* SinglyLinkedList::find(const std::string& _string)
{
	SinglyLinkedNode* node = head_;

	while (node)
	{
		if (node->value_ == _string)
			return node;
		node = node->next_;
	}

	return 0;
}

std::vector<std::string> SinglyLinkedList::values() const
{
	std::vector<std::string> array;
	SinglyLinkedNode* node = head_;

	while (node)
	{
		// Trick to return the elements from tail to head so that the order
		// is the expected. It's like a push_front().
		array.insert(array.begin(), node->value_);
		node = node->next_;
	}

	return array;
}
