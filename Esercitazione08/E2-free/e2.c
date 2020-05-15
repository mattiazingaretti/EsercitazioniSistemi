#include <unistd.h>
#include <stdlib.h>
#include "e2.h"
#include <stdio.h>

header_t* free_list = NULL;

void* mymalloc(size_t m) {
    header_t *p, *q = NULL;
    m = ((m+3)/4)*4;                // arrotonda al più piccolo multiplo di 4 maggiore o uguale a m
    if (m < 8) m = 8;               // garantisce spazio per il puntatore next
    for (p=free_list; p != NULL; q = p, p = p->next)    // cerca blocco libero first-fit
        if (p->size >= m) break;
    if (p == NULL) p = sbrk(4 + m); // nessun blocco libero, si espande l'heap
    else                            // toglie nodo dalla lista dei blocchi liberi
        if (q == NULL) free_list = free_list->next;
        else q->next = q->next->next;
    ((header_t*)p)->size = m;       // size misura il blocco a meno del campo size stesso  
    return (char*)p+4;
}

void myfree(void* p) {
	//p punta al payload	
	header_t* first = p-4;  
	first->next = NULL;
	
	if(free_list == NULL)
		free_list = first;
	else{
		header_t* tmp = first; 
		first->next = free_list;
		free_list = first;
	}
	
}
