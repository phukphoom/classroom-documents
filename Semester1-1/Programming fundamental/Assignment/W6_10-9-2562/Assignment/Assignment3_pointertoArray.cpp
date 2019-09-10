#include<iostream>

using namespace std;

int main(){
    int i[5]={1,2,3,4,5};
    int *p = i;

    cout << i[2] << " " << *(p+2) << " " << *(i+2) << " " << p[2];
    return 0;
}