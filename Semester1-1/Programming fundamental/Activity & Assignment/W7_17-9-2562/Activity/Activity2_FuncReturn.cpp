#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

float area (int ,int ,int ,int ,int ,int);

int main(){
    int x1,x2,x3;
    int y1,y2,y3;

    cin >> x1 >> y1 >> x2 >> y2 >> x3 >> y3;
    printf("%.2f",area(x1,y1,x2,y2,x3,y3));

    return 0;
}

float area (int x1 ,int y1 ,int x2 ,int y2 ,int x3 ,int y3){

    float a = sqrt(pow(x1-x2,2)+pow(y1-y2,2));
    float b = sqrt(pow(x2-x3,2)+pow(y2-y3,2));
    float c = sqrt(pow(x3-x1,2)+pow(y3-y1,2));

    float s = (a+b+c)/2;
    return sqrt(s*(s-a)*(s-b)*(s-c));
}