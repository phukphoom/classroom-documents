#include<iostream>

using namespace std;

void star (int);

int main(){
    int n;
    cin >> n;

    for(int i=n;i>0;i--){
        star(i);
    }

    return 0;
}

void star (int n){
    for(int i=n-1;i>=0;i--){
        cout << "*";
    }
    cout << endl;
}