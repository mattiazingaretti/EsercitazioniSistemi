int find(int* v, int n, int x) {
	int c = x;
    	int* d = v;
	int a = n;
	a--;
	L: if(a < 0) goto E;
	   if(d[a] != c) goto L2; 
	   return 1;
	E:return 0;
	L2: a--;
	    goto L;	    
}
