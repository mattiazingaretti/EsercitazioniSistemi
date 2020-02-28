.globl f

f:	movl 4(%esp), %eax
	movl 4(%esp), %edx
	movl 8(%esp), %ecx
	imull %edx, %eax
	movl 8(%esp), %edx
	imull %edx, %ecx
	subl %ecx, %eax	
	ret

