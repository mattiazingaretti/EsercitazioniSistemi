char * my_strcpy(char *dest, const char *src){
	char* start = dest;	
	while(*src){
		printf("Da 0x%x a 0x%x, vals: %c : %c (0x%x)\n",src,dest,*src,*dest,*dest);
		*dest = *src;
		src++;
		dest++;
	}
	*dest = 0; 
	return start;
}
