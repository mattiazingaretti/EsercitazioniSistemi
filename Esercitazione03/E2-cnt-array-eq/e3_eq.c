#include <stdlib.h>
#include <string.h>

void* clone(const void* src, int n) {
    
    void* des = malloc(n);
    if (des != 0) goto  E;
    return 0;
 E: memcpy(des, src, n);
    return des;
}
