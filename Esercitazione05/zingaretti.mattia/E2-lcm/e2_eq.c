#include "e2.h"

int lcm(int x, int y) {
    int ebx = x;
    int edi = y;
    int ecx = x;
    if (ebx > edi) 
        ecx = x;
L:; 
	int eax = ecx/ebx;
	int edx = ecx %ebx;
	if(edx != 0) goto E;
    eax = ecx/edi;
	edx = ecx %edi;
    if(edx != 0) goto E;
    return ecx;
    
E: ecx++;
   goto L;
}
