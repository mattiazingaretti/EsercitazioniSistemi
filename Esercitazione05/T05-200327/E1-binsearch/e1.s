.globl binsearch
#v <-> ecx , m<-> ebx,x <-> edx ,j<->eax, i <-> edi  
binsearch:							#int binsearch(int *v, int n, int x) {
    pushl %edi
    pushl %ebx
    xorl %edi,%edi						#int i=0; 
    movl 16(%esp), %eax					#int j=n;
L:  cmpl %eax,%edi						#if(i>=j) 
	jge	E								 #goto E;
    xorl %ebx,%ebx
    addl %edi,%ebx
    addl %eax,%ebx
    shrl $1,%ebx						#int m = (i+j)/2;
    movl 20(%esp),%edx
    movl 12(%esp), %ecx
    cmpl (%ecx,%ebx, 4),%edx			#if (v[m]== x)
    je E1								 #goto E1;
    cmpl (%ecx, %ebx, 4), %edx			#if (v[m]>x) 
    jg L1								 #goto L1;
    cmpl (%ecx,%ebx,4),%edx				#if(v[m]<=x) 
    jle L2								 #goto L2;
L3: jmp L								#goto L;
L1: movl %ebx,%eax						#j = m;
	jmp L3								#goto L3;
L2:	incl %ebx
	movl %ebx,%edi						#i=m+1;
	jmp L3								#goto L3;
E:  movl $0,%eax
	popl %edi
	popl %ebx			#return 0;
	ret
E1: movl $1,%eax
	popl %edi
	popl %ebx						#return 1;	}
	ret
