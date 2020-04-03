#include <stdlib.h>
#include "e2.h"

//p = ecx  q = edx 
void list_concat(node_t **l1, node_t *l2){
    node_t *ecx = *l1;
    node_t *edx = l2;
    if (ecx==NULL) goto S;
L:  if((*ecx).next ==NULL)
		goto E;
	ecx = (*ecx).next;
	goto L;
E:    (*ecx).next = l2;
	goto END;
S: *l1 = edx;
END:;
}
