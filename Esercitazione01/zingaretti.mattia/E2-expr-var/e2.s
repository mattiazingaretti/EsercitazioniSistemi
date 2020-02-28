.globl f

f:	movl 4(%esp),%eax
	movl 4(%esp),%ecx
	imull $2, %eax
	subl $7, %eax
	imull %ecx, %eax
	incl %eax
	ret
