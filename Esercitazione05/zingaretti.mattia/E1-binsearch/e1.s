.globl binsearch
#v <-> ecx , m<-> ebx,x <-> edx ,j<->eax, i <-> edi  
binsearch:							#int binsearch(int *v, int n, int x) {
 
	pushl %edi
	pushl %ebx
	pushl %esi
	
	xorl %edi,%edi						#int i=0; 
    movl 20(%esp) ,%eax					#int j=n;
L:  cmpl %eax, %edi						#if(i>=j) 
	jge E									#goto E
    movl %eax,%ebx						#int m = (i+j)/2;
    addl %edi,%ebx
    sarl $1,%ebx
    movl 24(%esp),%esi
    movl 16(%esp), %ecx
    cmpl (%ecx,%ebx, 4),%esi			#if (v[m]== x)
    je E1								#goto E1;
    cmpl (%ecx,%ebx, 4),%esi			#if (v[m]>x) 
	jl L1								#goto L1;
    cmpl (%ecx,%ebx, 4),%esi			#if(v[m]<=x)
    jge L2									# goto L2;
	jmp L								#goto L;
L1: movl %ebx,%eax						#j = m;
	jmp L								#goto L3;
L2:	incl %ebx							#i=m+1;
	movl %ebx, %edi
	jmp L
E:  movl $0, %eax						#return 0;
	jmp E3
E1: 
	movl $1, %eax
	jmp E3							#return 1;
E3: popl %esi
	popl %ebx
	popl %edi
	ret



