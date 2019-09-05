#include<iostream>
#include<windows.h>
#include<conio.h>

using namespace std;

void setwindow(int, int);
void draw_ship(int, int);
void gotoxy(int, int);

int main() {

	setwindow(1280,720);

	char key = ' ';

	int x = 38, y = 20;
	draw_ship(x, y);
	while (key != 'x') {
		if (_kbhit()) {
			key = _getch();
			if (key == 'a') {
				draw_ship(--x, y);
			}
			if (key == 'd') {
				draw_ship(++x, y);
			}
			if (key == 'w') {	
				draw_ship(x, --y);
			}
			if (key == 's') {	
				draw_ship(x, ++y);
			}
			fflush(stdin);
		}
	}

	return 0;
}
void setwindow(int width, int length) {
	HWND console = GetConsoleWindow();
	RECT r;
	GetWindowRect(console, &r); 

	MoveWindow(console, r.left, r.top, width, length, TRUE);
}
void draw_ship(int x, int y) {
	system("cls");
	gotoxy(x, y);
	cout << "/-A-\\";
}
void gotoxy(int x, int y) {
	COORD c = { x,y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);
}