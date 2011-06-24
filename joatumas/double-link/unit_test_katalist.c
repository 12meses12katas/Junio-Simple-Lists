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
	//second license:
	assert_equal_n(listo1, list.values());

	//list = List.new;
	init();
	list.add("fred");
	list.add("wilma");
	list.add("betty");
	list.add("barney");
	listo1[0] = "fred"; listo1[1] = "wilma"; listo1[2] = "betty"; listo1[3] = "barney"; listo1[4] = 0;
	assert_equal_n(listo1, list.values());

	list.delete(list.find("wilma"));
	listo1[0] = "fred"; listo1[1] = "betty"; listo1[2] = "barney"; listo1[3] = 0;
	assert_equal_n(listo1, list.values());

	list.delete(list.find("barney"));
	listo1[0] = "fred"; listo1[1] = "betty"; listo1[2] = 0;
	assert_equal_n(listo1, list.values());

	list.delete(list.find("fred"));
	listo1[0] = "betty"; listo1[1] = 0;
	assert_equal_n(listo1, list.values());

	list.delete(list.find("betty"));
	listo1[0] = 0;
	assert_equal_n(listo1, list.values());

	exit(0);
}
