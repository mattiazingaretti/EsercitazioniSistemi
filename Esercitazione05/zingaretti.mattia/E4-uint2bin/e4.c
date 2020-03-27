#include <stdio.h>

void uint2bin(unsigned x, char bin[32]){
	for(int i = 0;i < 31;i++){
		*(bin+i) = ( (x>>i) & 0x1 ) ? '1':'0' ;
		//printf("%c", bin[i]);
	}
}
