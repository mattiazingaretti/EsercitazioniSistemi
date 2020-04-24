int count_digits(const char *s) {
	int eax = 0;
	const char* ecx = s;
L:	if(*ecx == '\0') 
	goto E;
	if(*ecx < '0') goto L1;
	if(*ecx > '9') goto L1;
	eax++; //Provo a usare CMOVCC
L1:	ecx++;
	goto L;
E: return eax;
}
