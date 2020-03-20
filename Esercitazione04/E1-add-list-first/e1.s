.global list_add_first

list_add_first:					#int list_add_first(node_t **l, short elem) {
		pushl %ebx		#prologo 		
		pushl %edi						
		subl $4, %esp
						
		movl 16(%esp),%edx			#node_t *ebx = *l;
		movl (%edx), %ebx
		
		movl $8, %ecx
		movl %ecx, (%esp)
		call malloc					#node_t * edi = malloc(sizeof(node_t));//lo assegno da eax
		movl %eax, %edi
		testl %edi,%edi				#if (edi == 0) 
		je E						#	goto E
		
		movl 20(%esp),%edx
		movl  %edx, (%edi)         #edi->elem = elem;
		movl %ebx, 4(%edi)         #edi->next = ebx;
		
		movl 16(%esp),%edx			#*l = edi;
		movl %edi,(%edx)					
		movl $0, %eax 				#return 0;
		jmp Q
E:		movl $-1,%eax 						#return -1;
		jmp Q
Q:  	addl $4, %esp #epilogo
		popl %edi
		popl %ebx
		ret

