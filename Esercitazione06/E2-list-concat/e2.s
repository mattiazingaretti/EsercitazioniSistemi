.globl list_concat
list_concat:					#void list_concat(node_t **l1, node_t *l2){
    movl 4(%esp),%ecx					#node_t *ecx = *l1;
    movl (%ecx),%ecx
    movl 8(%esp), %edx					#node_t *edx = l2;
    testl %ecx, %ecx						#if (ecx==NULL) 
    je S										#goto S;
L:  cmpl $0,4(%ecx)						#if((*ecx).next ==NULL)
	je E								#	goto E;
	movl 4(%ecx),%ecx					#ecx = (*ecx).next;
	jmp L								#goto L;
E:  movl 8(%esp),%eax  					#(*ecx).next = l2;
	movl %eax,4(%ecx)					#goto END;
	jmp END
S:  movl 4(%esp),%eax
	movl %edx, (%eax)						#*l1 = edx;
END: ret

