#include<iostream>
#include<windows.h>
#include<conio.h>

using namespace std;

void draw_ship(int, int);
void erase_ship(int,int);
bool over_frame(int, int);
void gotoxy(int, int);

int main() {

	char key = ' ';

	int x = 75, y = 20;
	draw_ship(x, y);
	while (key != 'x') {
		if (_kbhit()) {
			key = _getch();
			erase_ship(x, y);
			if (key == 'a') {
				if (!over_frame(x-1, y)) {
					draw_ship(--x, y);
				}
				else {
					draw_ship(x, y);
				}
			}
			if (key == 'd') {
				if (!over_frame(x+1, y)) {
					draw_ship(++x, y);
				}
				else {
					draw_ship(x, y);
				}
			}
			if (key == 'w') {	
				if (!over_frame(x, y-1)) {
					draw_ship(x, --y);
				}
				else {
					draw_ship(x, y);
				}
			}
			if (key == 's') {	
				if (!over_frame(x, y+1)) {
					draw_ship(x, ++y);
				}
				else {
					draw_ship(x, y);
				}
			}
			fflush(stdin);
		}
		Sleep(50);
	}

	return 0;
}

void draw_ship(int x, int y) {
	gotoxy(x, y);
	cout << "/-A-\\";
}
void erase_ship(int x, int y) {
	gotoxy(x, y);
	cout << "     ";
}
bool over_frame(int x, int y) {
	if (x>=0&&x<=75 && y>=0&&y<=20) {
		return false;
	}
	else {
		return true;
	}
}
void gotoxy(int x, int y) {
	COORD c = { x,y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), c);
}