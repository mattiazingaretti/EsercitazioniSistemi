int comp(void* xv, void* yv) {
    int *c =(int*) xv;
    int *a =(int*) yv;
    return *c - *a;
}
