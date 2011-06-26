/*
 * SimpleList.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef SIMPLELIST_H_
#define SIMPLELIST_H_

#include <vector>

template <typename NODE, typename TYPE>
class SimpleList
{
public:
	// Add a new node to the list.
	virtual void 						add(const TYPE& _value) = 0;

	// Delete a node from the list.
	virtual void						remove(NODE* _node) = 0;

	// Find a node in the list.
	virtual NODE*		 			 	find(const TYPE& _value);

	// Return an array of all the values in the list.
	virtual std::vector<TYPE>			values() const;

protected:
	// The head of the list.
	NODE* 	head_;

	// The dummy node represents the end of the list.
	NODE*  	sentinel_node_;
};


template <typename NODE, typename TYPE>
NODE* SimpleList<NODE, TYPE>::find(const TYPE& _value)
{
	NODE* node = head_;

	while (node != sentinel_node_)
	{
		if (node->value_ == _value)
			return node;
		node = node->next_;
	}

	return 0;
}

template <typename NODE, typename TYPE>
std::vector<TYPE>	SimpleList<NODE, TYPE>::values() const
{
	std::vector<TYPE> array;
	NODE* node = head_;

	while (node != sentinel_node_)
	{
		// Trick to return the elements from tail to head so that the order
		// is the expected. It's like a push_front().
		array.insert(array.begin(), node->value_);
		node = node->next_;
	}
	return array;
}

#endif /* SIMPLELIST_H_ */
