char my_strcmp(const char* s1, const char* s2) {
    const char* c = s1;
    const char* d = s2;
L: if(!*c) goto E;
   if(*c != *d) goto E;
   c++;
   d++;
   goto L;
E: return  *c -*d;
  
}
