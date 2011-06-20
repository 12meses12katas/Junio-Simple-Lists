//============================================================================
// Name        : KataSimpleLists.cpp
// Author      : David Alfonso
// Description : Kata for the
//============================================================================

#include "Lists/SinglyLinkedList.h"
#include "Lists/DoublyLinkedList.h"
#include "UnitTests.h"

#include <iostream>

using namespace std;

int main()
{
	bool slres = list_unit_test<SinglyLinkedList>();
	bool dlres = list_unit_test<DoublyLinkedList>();

	if (slres && dlres)
		cout << "All tests OK." << endl;

	return 0;
}
