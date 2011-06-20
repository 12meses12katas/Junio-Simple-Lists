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

template <typename LIST>
bool list_unit_test()
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

#endif /* UNIT_TESTS_H_ */
