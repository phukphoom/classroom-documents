#include<iostream>

using namespace std;

int main_2() {
	int n;
	cin >> n;

	if (n % 2 == 0) {
		system("pause");
		return 0;
	}

	int i, j;
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			if (i == 0 || i == n-1 || j == 0 || j==n-1 || i==j || i+j==n-1) {
				cout << "*";
			}
			else {
				cout << " ";
			}
		}
		cout << endl;
	}

	system("pause");
	return 0;
}