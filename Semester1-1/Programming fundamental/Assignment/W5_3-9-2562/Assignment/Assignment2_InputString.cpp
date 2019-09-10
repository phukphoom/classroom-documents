#include<cstdio>
#include<cstring>

int main(){

    char x[20];
    scanf("%s",x);

    int i;
    for(i=0;i<strlen(x);i++){
        if(x[i]>='A'&&x[i]<='Z'){
            printf("%c",x[i]);
        }
    }

    return 0;
}