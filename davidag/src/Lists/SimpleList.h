/*
 * SimpleList.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef SIMPLELIST_H_
#define SIMPLELIST_H_

#include <string>
#include <vector>

template <typename NODE>
class SimpleList
{
public:
	// Add a new node to the list.
	virtual void 						add(const std::string& _string) = 0;

	// Deletes a node from the list.
	virtual void						remove(NODE* _node) = 0;

	// Finds a node in the list.
	virtual NODE*		 			 	find(const std::string& _string) = 0;

	// Returns an array of all the values in the list.
	virtual std::vector<std::string>	values() const = 0;
};

#endif /* SIMPLELIST_H_ */
