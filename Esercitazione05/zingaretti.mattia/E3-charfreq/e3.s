.globl charfreq
charfreq:			#char charfreq(const char* s) {
    pushl %edi
    pushl %ebx
    pushl %ebp
    pushl %esi
    subl $1036,%esp
    
    leal 12(%esp),%edi
    movl $0, 4(%esp)
    movl $1024,8(%esp) 
	movl %edi,(%esp)					#unsigned edi[256];
    call memset							#memset(edi, 0, 256*sizeof(unsigned));
	movl 1056(%esp), %ebx				#const char* ebx = s; 
	
L1: cmpl $0,(%ebx)						#if(*ebx == '\0') 
	je E1								 #goto E1;
	movsbl (%ebx),%edx						#char dl = *ebx;
	incl (%edi,%edx, 4)					#edi[dl]++;
	incl %ebx							#ebx++;
	jmp L1								#goto L1;
E1:
	movl $0,%ebp						#unsigned ebp = 0;
    movl (%edi,%ebp,4),%ecx				#unsigned ecx = edi[0];
    movl $1,%esi						#int esi = 1;
L2: cmpl $256,%esi						#if( esi>=256) 
	jge E2								#	goto E2;
    cmpl (%edi,%esi,4),%ecx				#if(edi[esi]>ecx) {
    cmovll %esi,%ebp
	cmpl (%edi,%esi,4),%ecx
	cmovll (%edi,%esi,4),%ecx
    incl %esi							#esi++;
    jmp L2								#goto L2;
E2: movl %ebp,%eax						#int eax = ebp;
	addl $1036,%esp
	popl %esi
	popl %ebp
	popl %ebx
	popl %edi
	ret									#return eax;	}
