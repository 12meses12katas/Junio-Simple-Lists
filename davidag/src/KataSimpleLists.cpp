//============================================================================
// Name        : KataSimpleLists.cpp
// Author      : David Alfonso
// Description : Kata for the month of July (www.12meses12katas.com)
//============================================================================

#include <iostream>
#include "Lists/SinglyLinkedList.h"
#include "Lists/DoublyLinkedList.h"
#include "Lists/CircularLinkedList.h"
#include "UnitTests.h"

using namespace std;

int main()
{
	bool slres = generic_list_unit_test<SinglyLinkedList>();
	bool dlres = generic_list_unit_test<DoublyLinkedList>();
	bool clres = generic_list_unit_test<CircularLinkedList>();
	bool dllres = doubly_linked_list_test();

	if (slres && dlres && clres && dllres)
		cout << "All tests OK." << endl;

	return 0;
}
