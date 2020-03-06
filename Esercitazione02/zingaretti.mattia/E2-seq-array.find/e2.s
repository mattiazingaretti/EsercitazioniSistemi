.globl find
find:
	movl 12(%esp),%ecx 		#int c = x;
    	movl 4(%esp), %edx 		#int* d = v;	
	movl 8(%esp),%eax 		#int a = n;
	decl %eax			#a--;
	L: cmpl $0, %eax		#if(a < 0)
	   jle E			#goto E
	   cmpl (%edx, %eax, 4), %ecx	#if(d[a] != c) 
	   jne 	L2			#goto L2; 
	   movl $1, %eax 		#return 1;
	   ret
	E:movl $0, %eax
	  ret			#return 0;
	L2: decl %eax		#a--;
	    jmp L;    
