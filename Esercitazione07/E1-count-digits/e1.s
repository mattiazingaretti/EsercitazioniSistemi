.global count_digits
									#int count_digits(const char *s) {
count_digits:				
	movl $0,%eax						#int eax = 0;
	movl 4(%esp), %ecx					#const char* ecx = s;
L:	cmpb $0,(%ecx)						#if(*ecx == '\0') 
	je E									#goto E;
	cmpb $48,(%ecx)						#if(*ecx < '0') 
	jl L1									#goto L1;
	cmpb $57, (%ecx)					#if(*ecx > '9')
	jg L1									#goto L1;
	incl %eax							#eax++; 
L1:	incl %ecx							#ecx++;
	jmp L								#goto L;
E: ret									#return eax;

