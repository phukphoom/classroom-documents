#include<iostream>

using namespace std;

int max (int,int);

int main(){
    int a,b,c,d;

    cin >> a >> b >> c >> d;
    cout << max(d,max(c,max(a,b)));

    return 0;
}

//--------------------function-------------------------
int max (int a,int b){
    if(a>=b){
        return a;
    }
    else{
        return b;
    }
}