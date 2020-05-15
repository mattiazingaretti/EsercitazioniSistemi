.globl is_prefix						
	
is_prefix:										#int is_prefix(const char* s1, const char* s2){
	movl 4(%esp),%eax								#const char* eax = s1;
	movl 8(%esp),%ecx								#const char* ecx = s2;
L:  cmpb $0,(%eax)									#if (*eax == 0) 
		je E											#goto E;
	movb (%ecx),%dl
	cmpb (%eax),%dl								#if(*eax != *ecx)
		jne E											#goto E;
	incl %eax										#eax++;//In IA32 posso usare incl perchè sono stringhe
	incl %ecx										#ecx++;
	jmp L											#goto L;
E:  cmpb $0,(%eax)										#return *eax == 0; //posso usare un setcc
	sete %al
	movsbl %al,%eax
	ret
