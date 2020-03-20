#include <stdlib.h>
#include "e1.h"

int list_add_first(node_t **l, short elem) {
    node_t *ebx = *l;		//node_t *p = *l;
    node_t *edi;			//node_t* edi = n;
    
    edi = malloc(sizeof(node_t));//lo assegno da eax
    
    if (edi == NULL) goto E;           // allocation error
    edi->elem = elem;
    edi->next = ebx;
    *l = edi;
    return 0;
E:	return -1;
}

