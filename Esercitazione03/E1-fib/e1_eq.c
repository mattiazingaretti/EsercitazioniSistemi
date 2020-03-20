
int fib(int n) {
	int ebx = n;
L:  if (ebx>=2) goto E; 
	return 1;
	
E:; int eax = fib(ebx-1);
	int esi = fib(ebx-2);
	eax +=  esi;
	return eax;
}
