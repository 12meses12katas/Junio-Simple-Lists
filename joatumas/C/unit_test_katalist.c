#include <stdio.h>
#include <stdlib.h>
#include "katalist.h"

extern s_list list;
cadena *llista_cadenes;

int main(){
	cadena listo1[MAXCADENA] = {"fred", "wilma", 0};
	cadena aux_cad;
	//print_llista();

	//First license:
	init();
	//list = List.new;

	assert_nil(list.find("fred"));
	list.add("fred");
	assert_nil(list.find("fred"));
	llista_cadenes = list.values();
	print_llista(llista_cadenes);
	aux_cad = list.find("fred")->value;
	assert_equal("fred", list.find("fred")->value);
	assert_nil(list.find("wilma"));
	list.add("wilma");
	assert_equal("fred",  list.find("fred")->value);
	assert_equal("wilma", list.find("wilma")->value);
	assert_equal_n(listo1, list.values());

	//list = List.new;
	init();
	/*TODO: to be uncommented in the future:

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
