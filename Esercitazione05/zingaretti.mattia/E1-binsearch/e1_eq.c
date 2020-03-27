#include "e1.h"

int binsearch(int *v, int n, int x) {
    int i=0; 
    int j=n;
L:  if(i>=j) goto E;
    int m = (i+j)/2;
    if (v[m]== x) goto E1;
    if (v[m]>x) goto L1;
    if(v[m]<=x) goto L2;
L3: goto L;
L1: j = m;
	goto L3;
L2:	i=m+1;
	goto L3;
E:  return 0;
E1: return 1;
}
