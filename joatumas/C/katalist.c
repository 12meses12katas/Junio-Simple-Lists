#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "katalist.h"

s_list list;

int max_ind = 0;
cadena vector_cadena[MAXCADENA];

void init(){
	node_t *aux;
	list.add = add_f;
	list.delete = delete_f;
	list.find = find_f;
	list.values = values_f;
	max_ind = 0;
	//Free memory... hipòcrita...
	aux = find_last();
	while(aux != NULL){
		delete_f(aux);
		aux = find_last();
	}
	list.first = NULL;
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
	aux = ret = list.first;
	while(aux != NULL){
		ret = aux;
		aux = aux->next;
	}
	return(ret);
}

void print_node(node_t *node){
	printf("%s\n", node->cad);
}

int assert_equal(cadena cad1, cadena cad2){
	if(strcmp(cad1, cad2)){
		printf("Son diferents\n");
		return(1);
	}else{
		printf("Son iguals\n");
		return(0);
	}
}

int assert_equal_n(cadena *llista1, cadena *llista2){
	int i=0;
	for(i=0; i<MAXCADENA; i++){
		if(llista1[i] == 0 && llista2[i] == 0){
			//son iguals
			printf("Son iguals\n");
			return(0);
		}else if(llista1[i] == 0 && llista2[i] == 0){
			//son diferents
			printf("Son diferents\n");
			return(1);
		}else{
			if(strcmp(llista1[i], llista2[i])){
				//son diferents
				printf("Son diferents\n");
				return(1);
			}
		}
	}
	printf("Xungo\n");
	return(1);
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
	aux->value = aux->cad;
	//aux->value = value_f;
	aux3 = find_last();
	if(aux3 == NULL){
		//Void list
		list.first = aux;
	}else{
		aux3->next = aux;
	}
}

void delete_f(node_t *node){
	node_t *act, *ant;
	act = ant = list.first;
	while((act != NULL) && (act->index != node->index)){
		ant = act;
		act = act->next;
	}
	if(act == ant){
		//FIRST node
		list.first = act->next;
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
	node_t *aux = list.first;
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
	int i=0;
	node_t *aux = list.first;
	while(aux != NULL){
		vector_cadena[i] = aux->cad;
		aux = aux->next;
		i++;
	}
	vector_cadena[i] = 0;
	return(vector_cadena);
}

/*inline cadena value_f(){
	return aux->cad; 
}*/
