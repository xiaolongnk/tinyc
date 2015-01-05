#include <stdio.h>

int mprint(int *a, int size){
    int i;
    for(i = 0; i<size;  i++){
        printf("%d  ",a[i]);
    }
    puts("");
}
