#include <stdio.h>
#include <stdlib.h>
#include "katalist.h"

extern s_list llista;

int main(){
	cadena listo1[MAXCADENA] = {"hola", "hola2", "hola3", 0};
	//print_llista();

	//First license:
	init();
	//list = List.new;

	assert_nil(llista.find("fred"));
	llista.add("fred");
	assert_nil(llista.find("fred"));

	/*TODO: to be uncommented in the future:
	assert_equal("fred", list.find("fred").value());
	assert_nil(list.find("wilma"));
	list.add("wilma");
	assert_equal("fred",  list.find("fred").value());
	assert_equal("wilma", list.find("wilma").value());
	assert_equal(["fred", "wilma"], list.values());

	list = List.new;
	list.add("fred");
	list.add("wilma");
	list.add("betty");
	list.add("barney");
	assert_equal(["fred", "wilma", "betty", "barney"], list.values());
	list.delete(list.find("wilma"));
	assert_equal(["fred", "betty", "barney"], list.values());
	list.delete(list.find("barney"));
	assert_equal(["fred", "betty"], list.values());
	list.delete(list.find("fred"));
	assert_equal(["betty"], list.values());
	list.delete(list.find("betty"));
	assert_equal([], list.values());
	*/
	exit(0);
}
