#include<stdio.h>

int count_substrings(const char* s,const char* sub ){
	int len = 0, in=0, ris =0 ;
	const char* app = sub;
	//calcolo len di sub
	while(*sub++){len++;}
	sub = app;	
	if(*s== '\0' && *app== '\0') ris++;
	while(*s){
	printf("%d %d %c %c \n ", in , ris ,*s, *app);	
		if(in == len || (len == 1 && *s == *sub) ){
			ris++;
			in = 0;
			if(*s == *(app-len +1)){
				in++;
			}
			app = sub;
			app++;
		}
		if(*s == *app){
			in++;
			app++;
			s++;
		}else{
		s++;
		}
		
	
	}
	return ris;
}

