#include<iostream>

using namespace std;

int main(){
    char *p,str[50];

    p=str;

    cin >> str;

    while(*p!='\0'){
        p++;
    }

    p--;
    while(p>=str){
        cout << *p;
        p--;
    }
    return 0;
}