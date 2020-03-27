#include "e2.h"

int lcm(int x, int y) {
    int greater = y;
    if (x > y) //CO un setcc
        greater = x;
L:  if(greater %x != 0) goto E;
    if(greater %y != 0) goto E;
    return greater;
    
E: greater++;
   goto L;
}
