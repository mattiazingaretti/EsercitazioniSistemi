.globl lcm

lcm:						#int lcm(int x, int y) {
    pushl %ebx
    pushl %edi
    movl 12(%esp), %ebx			#int ebx = x;
    movl 16(%esp), %edi			#int edi = y;
    movl %ebx, %ecx				#int ecx = x;
    cmpl %edi, %ebx				#if (ebx > edi) 
    cmovgl %ebx,%ecx    		#ecx = x;
L:
	movl %ecx, %eax
	movl %eax,%edx
	sarl $31,%edx
	idivl %ebx					#int eax = ecx/ebx;
								#int edx = ecx %ebx;
	testl %edx,%edx				#if(edx != 0) 
	jne E						  #goto E;
    movl %ecx, %eax
	movl %eax,%edx
	sarl $31, %edx
    idivl %edi					#eax = ecx/edi;
								#edx = ecx %edi;
    testl %edx,%edx				#if(edx != 0) 
    jne E						#goto E;
    popl %edi 
    popl %ebx
    movl %ecx,%eax
    ret							#return ecx;
    
E: incl %ecx					#ecx++;
   jmp L							#goto L;}

