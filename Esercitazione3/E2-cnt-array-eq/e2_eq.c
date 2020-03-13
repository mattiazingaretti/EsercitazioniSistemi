/*int counteq(short* v1, short* v2, int n) {
    int i, cnt = 0;
    for (i=0; i<n; ++i) cnt += (v1[i]==v2[i]);
    return cnt;
}
*/

int counteq(short* v1, short* v2, int n){
	int b ; //Variabili  b <-> i
	int a  = 0;	// a <-> cnt
	short * di = v1;//Parametri passati counteq
	short* si = v2;
	int c = n;
	b = 0;
L:	if(b >= c) goto E;
	if(di[b] != si[b]) goto I;
	a += 1;
	b++;
	goto L;
E: return a;
I : b++;
	goto L;
}
