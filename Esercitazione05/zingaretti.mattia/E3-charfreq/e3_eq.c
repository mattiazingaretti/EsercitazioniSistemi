#include <string.h>
#include "e3.h"

char charfreq(const char* s) {
    unsigned edi[256];
    memset(edi, 0, 256*sizeof(unsigned));
	
	const char* ebx = s; 
L1: if(*ebx == '\0') goto E1;
	char dl = *ebx; //s <->
	edi[dl]++; //edi <-> freq
	ebx++;
	goto L1;
E1:;
	unsigned ebp = 0;
    unsigned ecx = edi[0];
    int esi = 1;
L2: if( esi>=256) goto E2;
    if (edi[esi]>ecx) {
      ebp = esi;
      ecx = edi[esi];
     }
    esi++;
    goto L2;
E2:;int eax = ebp;
	return eax;
}
