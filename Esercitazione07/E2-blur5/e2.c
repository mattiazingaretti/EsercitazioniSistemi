#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int sumFiveNeighbours(int i, int j, int w, unsigned char*in){
	int ris = 0;
	for(int k = -2 ; k < 3; k++){
		for(int t = -2 ; t < 3; t++){
			ris += in[w*(i+k) +j+t];
		}
	}
	return ris;
}

void blur5(unsigned char* in, unsigned char* out, int w, int h){
	//in rappresenta una matrice linearizzata
	for(int i = 0; i<h; i++){
		for(int j = 0; j < w ; j++){
			//Se posso calcolare la media della matrice 5x5 centrata in (i,j)
			if( i>= 2 && i <= h -3 && j >= 2 && j<= w-3){
					int sum = sumFiveNeighbours(i, j, w, in );
					int average = sum/25;
					out[w*i+j] = average;
			}else{
				out[w*i+j] = in[w*i+j];
				}
			 
		}
	}
}

