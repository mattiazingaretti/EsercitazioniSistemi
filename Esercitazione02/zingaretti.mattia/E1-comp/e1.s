.globl comp

comp:
	movl 4(%esp), %edx		 #int *c =(int*) xv;
   	movl 8(%esp), %ecx		 #int *a =(int*) yv;
   	movl (%edx), %eax
	subl (%ecx),%eax
	ret		 		 #return *c - *a;
