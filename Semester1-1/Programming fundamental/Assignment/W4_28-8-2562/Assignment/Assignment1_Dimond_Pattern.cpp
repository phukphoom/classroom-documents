#include<iostream>
#include<cmath>

using namespace std;

int Solve1(){
    int n;
    cin >> n;

    int i,a,b;
    for(i=0;i<=n;i++){
        for(a=0;a<n-i;a++){
            cout << " ";
        }
        for(b=0;b<(2*n+1)-(2*(n-i));b++){
            cout << "*";
        }
        cout << endl;
    }
    for(i=0;i<=n-1;i++){
        for(a=0;a<i+1;a++){
            cout << " ";
        }
        for(b=0;b<(2*n+1)-(2*(i+1));b++){
            cout << "*";
        }
        cout << endl;
    }
    return 0;
}

int Solve2(){
    int n;
    cin >> n;

    int i,a,b;
    for(i=1;i<(n*2);i++){
        for(a=0;a<abs(n-i);a++){
            cout << " ";
        }
        for(b=0;b<((2*n)-1)-(2*abs(n-i));b++){
            cout << "*";
        }
        cout << endl;
    }
    return 0;
}

int Solve3(){
    int n;
    cin >> n;

    int x,y;
    for(y=-n+1;y<=n-1;y++){
        for(x=-n+1;x<=n-1;x++){
            if(abs(x)+abs(y)<n){
                cout << "*";
            }
            else{
                cout << " "; 
            }
        }
        cout << endl;
    }
    return 0;
}

int main(){
    int run = Solve1();
    return 0;
}
