.globl counteq

counteq:
							#int counteq(short* v1, short* v2, int n){
	movl $0, %eax
	movl $0, %ecx
	movl 4(%esp),%ebx
	movl 8(%esp),%edx
	
L:	cmpl 12(%esp),%ecx
	jge E
	movw (%edx,%ecx,2), %di
	cmpw (%ebx,%ecx,2),%di
	sete %dl
	movl %edl, %eax
	incl %ecx 
	jmp L
E:	ret
											
