#include <stdlib.h>
#include "e2.h"
//Posso usare registri caller save tanto non chiamo nessuna funzione
int list_equal(const node_t *l1, const node_t *l2) {
    const node_t *ecx = l1; //lettura parametri
    const node_t *edx = l2; 
L:  if(ecx == 0) goto E;
	if(edx == 0) goto E;
    if (ecx->elem != edx->elem) goto Q;
	ecx = ecx->next;
	edx = edx->next;
    goto L;
E:  if(ecx != 0) goto Q;
	if(edx != 0) goto Q;
	return 1;
Q: return 0;
}
