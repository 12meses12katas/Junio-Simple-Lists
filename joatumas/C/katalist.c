#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "katalist.h"

s_list llista;

int max_ind = 0;
cadena vector_cadena[MAXCADENA];

void init(){
	llista.add = add_f;
	llista.delete = delete_f;
	llista.find = find_f;
	llista.first = NULL;
	llista.values = values_f;
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

node_t *find_last(){
	node_t *aux, *ret;
	aux = ret = llista.first;
	while(aux != NULL){
		ret = aux;
		aux = aux->next;
	}
	return(ret);
}

void print_node(node_t *node){
	printf("%s\n", node->cad);
}

int assert_equal(cadena *llista1, cadena *llista2){
	//if(strcmp(llista1, llista2))
	return 0;
}

int assert_nil(node_t *nod){
	if(nod == NULL){
		printf("Es null\n");
		return(1);
	}else{
		printf("No es null\n");
		return(0);
	}
}

void add_f(cadena cad_in){
	node_t *aux, *aux3;
	aux = (node_t *)malloc(sizeof(node_t));
	strcpy(aux->cad, cad_in);
	aux->next = NULL;
	aux->index = max_ind++;
	//aux->value = value_f;
	aux3 = find_last();
	if(aux3 == NULL){
		//Void list
		llista.first = aux;
	}else{
		aux3->next = aux;
	}
}

void delete_f(node_t *node){
	node_t *act, *ant;
	act = ant = llista.first;
	while((act != NULL) && (act->index != node->index)){
		ant = act;
		act = act->next;
	}
	if(act == ant){
		//FIRST node
		llista.first = act->next;
	}else if(act == NULL){
		//Node not in list
	}else{
		//internode
		ant->next = act->next;
	}
	//Free memory:
	free(act);
}

node_t *find_f(cadena cad){
	node_t *aux = llista.first;
	while(aux != NULL){
		if (strcmp(aux->cad, cad)){
			aux = aux->next;
		}else{
			return(aux);
		}
	}
	return NULL;
}

cadena *values_f(){
	return(vector_cadena);
}
