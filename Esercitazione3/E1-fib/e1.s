
.globl fib
							#int fib(int n) {
fib: pushl %esi 			#prologo
	 subl $4, %esp
	 movl 8(%esp), %ebx		#int ebx = n;
L:   cmpl $2,%ebx  			# if (ebx>=2) 
	 jge E					# goto E; 
	 movl $1, %eax			#return 1
E:   decl %ebx 				# int esi = fib(ebx-1);
	 call fib
	 movl %eax,%esi
	 decl %ebx
	 call fib 				# int eax = fib(ebx-2);
	 addl %esi, %eax		# eax +=  esi;
							#return eax;
							#}
	 addl $4,%esp 			#epilogo
	 popl %esi
	 
	 ret
	 

