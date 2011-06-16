#include <stdio.h>
#include "katalist.h"

s_list llista;

int max_ind = 0;

void init(){
	llista.add = add_f;
	llista.delete = delete_f;
	llista.find = find_f;
	llista.first = NULL;
}

void print_llista(cadena *llista){
	int i;
	for(i=0; i<MAXCADENA; i++){
		if(llista[i] == 0){
			break;
		}
		printf("%s\n",llista[i]);
	}
}

void print_node(node_t *node){
	printf("%s\n", node->cad);
}

int assert_equal(cadena *llista1, cadena *llista2){
	return 0;
}
int assert_nil(node_t *nod){
}

void add_f(cadena cad){
}
void delete_f(node_t *node){
}
node_t *find_f(cadena cad){
	return 0;
}

