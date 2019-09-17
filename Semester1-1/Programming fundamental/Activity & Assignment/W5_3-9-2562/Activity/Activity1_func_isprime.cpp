#include<iostream>
#include<cmath>
using namespace std;

bool isprime (int);

int main(){
    int n;

    cin >> n;
    cout << isprime(n);

    return 0;
}

//--------------------function-------------------------
bool isprime (int n){
    if(n<=1){
        return false;
    }

    int i;
    int count = 0;
    for(i=2;i<=sqrt(n);i++){
        if(n%i==0){
            count++;
        }
    }

    if(count==0){
        return true;
    }
    else{
        return false;
    }
}
