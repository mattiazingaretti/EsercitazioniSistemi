char * my_strcpy(char *dest, const char *src){
	char* start = dest;
	while(*src || *dest){
		*dest = *src;
		src++;
		dest++;
	}
	return start;
}
