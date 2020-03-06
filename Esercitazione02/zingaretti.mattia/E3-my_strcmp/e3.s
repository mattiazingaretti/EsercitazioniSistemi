.globl my_strcmp

my_strcmp:
	movl 4(%esp), %ecx	# const char* c = s1;
    	movl 8(%esp), %edx	#const char* d = s2;
	
	movb (%edx),%al
L: 	cmpb (%ecx), %al	#if( *c != *d ) 	
	jne E                   #goto E;
	notb (%ecx)
	cmpb $0, (%ecx)        #if(!*c) goto E
	notb (%ecx)  
	jne E
	incl %ecx		#c++
	incl %edx 	 	#d++
   	jmp L
E: movb (%ecx),%al
   subb (%edx), %al 		#*c -*d;
   ret
