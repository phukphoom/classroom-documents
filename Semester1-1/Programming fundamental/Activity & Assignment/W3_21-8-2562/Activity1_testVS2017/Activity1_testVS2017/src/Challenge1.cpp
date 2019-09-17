#include<iostream>

using namespace std;

int main_1() {
	int n;
	cin >> n;

	int i, j;
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			if ((i + j) % 2 == 0) {
				cout << "*";
			}
			else {
				cout << "_";
			}
		}
		cout << endl;
	}

	system("pause");
	return 0;
}