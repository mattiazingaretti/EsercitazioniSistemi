#include "e1.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h> //For debug if needed

int compare(const void* ap, const void* bp){
	person_t *p = (person_t*)ap;
	person_t * q = (person_t*)bp;
	return strcmp(p->name,q->name);
}

void printPerson(person_t* p, size_t nel){
	person_t *c = p;
	for(int i =0; i < nel ; i++)
	 printf("%s %d \n", (c+i)->name, (c+i)->age);
}

void sort_people(person_t p[], size_t nel){
	printPerson(p, nel);
	qsort(p, nel ,sizeof(person_t), compare);
	printf("\n");
	printPerson(p, nel);
}


person_t *find_person(char *key, person_t sorted[], size_t nel){
	person_t* res = NULL;
	res =  bsearch(&key, sorted, nel, sizeof(person_t),compare);
	return res;
}
