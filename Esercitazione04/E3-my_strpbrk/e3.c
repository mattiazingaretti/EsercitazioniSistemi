#include "e3.h"
#include <stdio.h>

char *my_strpbrk(const char *s1, const char *s2){
	
	do{
		const char *b = s2;
		do{
			if(*b == *s1) return (char* )s1;
			if(*s1 == '\0') return NULL;
		}while(*b++);
	}while(*s1++);
}
