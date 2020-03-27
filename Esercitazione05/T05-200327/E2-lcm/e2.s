.globl lcm

# x <-> ecx, greater <-> eax ,y <-> edx
lcm:						#int lcm(int x, int y) {
    movl 8(%esp),%eax			#int greater = y;
    movl 4(%esp), %ecx
    cmpl 8(%esp), %ecx			#if (x > y) 
    jg S							
L:  pushl %edx
	pushl %eax
	movl %eax,%edx
	sarl $31,%edx
	idiv %ecx
	popl %eax
	testl %edx,%edx 				#if(greater %x != 0)
	jne E							#goto E;
	popl %edx
	
	pushl %edx
	pushl %eax
	pushl %ebx
	movl %edx,%ebx
	movl %eax,%edx
	sarl $31,%edx
	idiv %ebx
	popl %ebx
	popl %eax
	testl %edx,%edx 				#if(greater %y != 0)
	jne E							#goto E;
	popl %edx
	
    ret							#return greater;
    
E: incl %eax	#greater++;
   jmp L		#goto L;
S: movl %ecx, %eax				# greater = x;
   jmp L
