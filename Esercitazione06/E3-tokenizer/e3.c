#include "e3.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char **tokenize(const char *str, const char *delim, int *num_tok){
	*num_tok =0;
	int l = strlen(str);
	char **ris = malloc(sizeof(char*)*l);
	char s[l];
	strcpy(s, str);
	
	char* token = strtok(s,delim);
	printf("%s\n", token);
	int j = 0;
	while(token != NULL){
		
		if(strlen(token) >0){
			(*num_tok)++;
			ris[j] = malloc(sizeof(char)*(strlen(token)+1));
			ris[j] = strcpy(ris[j],token);
			j++;
		}
		token = strtok(NULL, delim);
		
		}
	}
	
	
	return ris;
}
