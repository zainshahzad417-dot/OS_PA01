#include "../include/myutils.h"

int count_words(char *str){
    int count = 1;
    for(int i=0;str[i]!='\0';i++){
       if(str[i]==' '){
           count++;
        }
    }
    return count;
}


