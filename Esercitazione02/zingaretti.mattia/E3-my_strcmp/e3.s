.globl my_strcmp

my_strcmp:
	movl 4(%esp), %ecx	# const char* c = s1;
    	movl 8(%esp), %edx	#const char* d = s2;
	
L:
	movb (%edx),%al
 	cmpb (%ecx), %al 	#if( *c != *d ) 	
	jne E
	movb (%ecx),%ah	                   #goto E;
	notb %ah
	cmpb $0, %ah        #if(!*c) goto E  
	jne E
	incl %ecx		#c++
	incl %edx 	 	#d++
   	jmp L
	ret
E: 
   movb (%ecx),%al
   subb (%edx), %al 		#*c -*d;
   ret
