#include<iostream>

using namespace std;

int main(){

    int x=10,y=20,z=30;
    int *p1=&x,*p2=&y;
    
    cout << x << " " << y << " " << z << " "  << *p1 << " " << *p2;

    x = 80; 
    
    cout << endl;
    cout << x << " " << y << " " << z << " " << *p1 << " " << *p2;

    p1=&z;
    p2=p1;

    cout << endl;
    cout << x << " " << y << " " << z << " " << *p1 << " " << *p2;

    *p1=100;
    
    cout << endl;
    cout << x << " " << y << " " << z << " " << *p1 << " " << *p2;


    return 0;
}