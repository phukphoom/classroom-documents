#include<iostream>

using namespace std;

int main(){
    char str[50];
    cin >> str;

    char *head,*tail;
    head=str;
    tail=str;
    
    while(*tail!='\0'){
        //cout << *tail;
        tail++;
    }
    tail--;

    while(*head<=*tail){
        if(*head!=*tail){
            cout << "Not palindrome";
            return 0;
        }
        head++;
        tail--;
    }

    cout << "Palindrome";
    return 0;
}