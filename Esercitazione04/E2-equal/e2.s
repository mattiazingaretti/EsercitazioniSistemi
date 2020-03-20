.globl list_equal

list_equal:
	movl 4(%esp), %ecx 			#const node_t *ecx = l1;
	movl 8(%esp), %edx			#const node_t *edx = l2;
L:	testl %ecx,%ecx				#if(ecx == 0) 
	je E							#goto E;
	testl %edx,%edx 				#if(edx == 0) 
	je E							#goto E;
	movw (%edx), %di
	cmpw %di, (%ecx)			#if (ecx->elem != edx->elem)
	jne Q							#goto Q
	movl 4(%ecx), %ecx			#ecx = ecx->next;
	movl 4(%edx), %edx			#edx = edx-> next;
	jmp L						#goto L;
E:	testl %ecx,%ecx				#if(ecx != 0)
	jne Q							#goto Q;
	testl %edx, %edx			#if(edx != 0)
	jne Q							#goto Q
	movl $1, %eax				#return 1
	jmp F		
Q:	movl $0, %eax				#return 0
	jmp F
F: ret

