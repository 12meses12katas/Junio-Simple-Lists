/*
 * unit_tests.h
 *
 *  Created on: 19/06/2011
 *      Author: david
 */

#ifndef UNIT_TESTS_H_
#define UNIT_TESTS_H_

#include <cassert>
#include <vector>
#include <algorithm>
#include "Lists/DoublyLinkedList.h"

template <typename LIST>
bool generic_list_unit_test()
{
	{
		LIST list;

		assert(list.find("fred") == 0);

		list.add("fred");

		assert("fred" == list.find("fred")->value_);
		assert(list.find("wilma") == 0);

		list.add("wilma");

		assert("fred" == list.find("fred")->value_);
		assert("wilma" == list.find("wilma")->value_);

		std::vector<std::string> values(2);
		values[0] = "fred";
		values[1] = "wilma";
		assert(values == list.values());
	}

	{
		LIST list;
		list.add("fred");
		list.add("wilma");
		list.add("betty");
		list.add("barney");

		std::vector<std::string> values(4);
		values[0] = "fred";
		values[1] = "wilma";
		values[2] = "betty";
		values[3] = "barney";
		assert(values == list.values());

		list.remove(list.find("wilma"));

		values.erase(std::find(values.begin(), values.end(), "wilma"));
		assert(values == list.values());

		list.remove(list.find("barney"));

		values.erase(std::find(values.begin(), values.end(), "barney"));
		assert(values == list.values());

		list.remove(list.find("fred"));

		values.erase(std::find(values.begin(), values.end(), "fred"));
		assert(values == list.values());

		list.remove(list.find("betty"));

		assert(std::vector<std::string>() == list.values());
	}

	return true;
}

bool doubly_linked_list_test()
{
	DoublyLinkedList dl_list;

	dl_list.add("Peter");
	dl_list.add("Jakob");
	dl_list.add("Carol");

	DoublyLinkedNode* peter = dl_list.find("Peter");
	DoublyLinkedNode* jakob = dl_list.find("Jakob");
	DoublyLinkedNode* carol = dl_list.find("Carol");

	assert(carol->prev_ == 0);
	assert(carol->next_ == jakob && jakob->prev_ == carol);
	assert(jakob->next_ == peter && peter->prev_ == jakob);

	dl_list.add("Richard");

	DoublyLinkedNode* richard = dl_list.find("Richard");

	assert(richard->next_ == carol && carol->prev_ == richard);

	dl_list.remove(jakob);

	assert(richard->next_ == carol && carol->prev_ == richard);
	assert(carol->next_ == peter && peter->prev_ == carol);

	dl_list.remove(richard);

	assert(carol->next_ == peter && carol->prev_ == 0);
	assert(peter->prev_ == carol);

	return true;
}

#endif /* UNIT_TESTS_H_ */
