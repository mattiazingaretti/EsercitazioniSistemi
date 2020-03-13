.globl counteq

counteq:
							#int counteq(short* v1, short* v2, int n){
	pushl %ecx					#int i = 0 ; //esp +16
	pushl %eax				#int a  = 0;	//esp+20
	addl $8,%esp
	movl 4(%esp), %ebx			#short *b = v1;//Parametri passati counteq
	movl 8(%esp), %edx			#short* d = v2;
L:	cmpl %ecx,12(%esp)				#if(i >= c)
	jge E							#goto E;
	movw (%ebx,%ecx , 2),%ax
	cmpw (%edx,%ecx,2),%ax		#if(b[i] != d[i]) 
	jne I							#goto I;
	incl 20(%esp)					#a += 1;
	incl %ecx					#i++;
	jmp L						#goto L;
E: 	movl 20(%esp), %eax
	popl %eax
	popl %ecx
	ret
I : incl %ecx					#b++;
	jmp L						#goto L;


											
