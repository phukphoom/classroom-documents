#include<iostream>
#include<cmath>

using namespace std;

int main() {
	int n;
	cin >> n;

	if (n % 2 == 0) {
		system("pause");
		return 0;
	}

	int i, j,k,l; 
	for (i = 0; i < n/2+1; i++) {
		if (i % 2 == 0) { // Even Row
			for (j = 0; j < i; j++) {
				if (j % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			for (k = 0; k < n - (2*i); k++) {
				cout << "*";
			}
			for (l = 0; l < i; l++) {
				if (l % 2 == 0) {
					cout << " ";
				}
				else {
					cout << "*";
				}
			}
		}
		else { // Odd Row
			for (j = 0; j < i; j++) {
				if (j % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			for (k = 0; k < n - (2 * i); k++) {
				cout << " ";
			}
			for (l = 0; l < i; l++) {
				if (l % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
		}

		cout << endl;
	}
	for (i = n/2; i >= 0; i--) {
		if (i % 2 == 0) { // Even Row
			for (j = 0; j < i; j++) {
				if (j % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			for (k = 0; k <= n - (2 * i); k++) {
				cout << " ";
			}
			for (l = 0; l < i; l++) {
				if (l % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
		}
		else { // Odd Row
			for (j = 0; j < i; j++) {
				if (j % 2 == 0) {
					cout << "*";
				}
				else {
					cout << " ";
				}
			}
			for (k = 0; k <= n - (2 * i); k++) {
				cout << "*";
			}
			for (l = 0; l < i; l++) {
				if (l % 2 == 0) {
					cout << " ";
				}
				else {
					cout << "*";
				}
			}
		}

		cout << endl;
	}


	system("pause");
	return 0;
}