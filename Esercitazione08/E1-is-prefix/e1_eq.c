#include "e1.h"

int is_prefix(const char* s1, const char* s2){
	const char* eax = s1;
	const char* ecx = s2;
L:  if (*eax == 0) 
		goto E;
	if(*eax != *ecx)
		goto E;
	eax++;//In IA32 posso usare incl perchè sono stringhe
	ecx++;
	goto L;
E:  return *eax == 0; //posso usare un setcc
}

