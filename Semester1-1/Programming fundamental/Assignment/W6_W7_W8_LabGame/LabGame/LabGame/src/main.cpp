#include<iostream>
#include<windows.h>
#include<conio.h>

using namespace std;

//----------------------------------------------- Function prototype -------------------------------------
void draw_ship(int, int);
void erase_ship(int,int);
bool draw_bullet(bool, int, int);
void erase_bullet(int, int);	
bool over_frame(int, int);

void gotoxy(int, int);
void showcursor(bool);
void setcolor(int, int);
//----------------------------------------------- Function prototype -------------------------------------

int main() {
	showcursor(false);

	int ship_x;
	int ship_y;

	const int maxbullet = 5;
	bool bullet_shoot[maxbullet] = {false};
	int bullet_x[maxbullet] = {0};
	int bullet_y[maxbullet] = {0};
	int numbullet = 0;
	
	int ship_startx = 38;
	int ship_starty = 20;

	ship_x = ship_startx;
	ship_y = ship_starty;
	draw_ship(ship_x, ship_y);

	char key = ' ';
	while (key != 'x') {
		//----------------------------------------------- debug bullet console ----------------------------
		setcolor(0,7);
		gotoxy(0, 22);
		cout << "Bullet Status : " << bullet_shoot[0] << "-" << bullet_shoot[1] << "-";
		cout << bullet_shoot[2] << "-" << bullet_shoot[3] << "-" << bullet_shoot[4];
		//----------------------------------------------- debug bullet console ----------------------------
		//----------------------------------------------- input block -------------------------------------
		if (_kbhit()) {
			key = _getch();
			if (key == 'a') {
				if (!over_frame(ship_x-1, ship_y)) {
					ship_x--;
				}
			}
			if (key == 'd') {
				if (!over_frame(ship_x+1, ship_y)) {
					ship_x++;
				}
			}
			if (key == 'w') {	
				if (!over_frame(ship_x, ship_y - 1)) {
					ship_y--;
				}
			}
			if (key == 's') {	
				if (!over_frame(ship_x, ship_y+1)) {
					ship_y++;
				}
			}
			if (key == ' ') {
				bullet_shoot[numbullet] = true;
				bullet_x[numbullet] = ship_x;
				bullet_y[numbullet] = ship_y-1;
				
				numbullet++;
				if (numbullet >= maxbullet && bullet_shoot[0]==false) {
					numbullet = 0;
				}
			}
			fflush(stdin);
		}
		//----------------------------------------------- input block -------------------------------------
		//----------------------------------------------- drawing block -----------------------------------
		draw_ship(ship_x, ship_y);
		for (int i = 0; i < maxbullet; i++) {
			if (bullet_shoot[i] == true) {
				bullet_shoot[i] = draw_bullet(bullet_shoot[i], bullet_x[i], bullet_y[i]);
				bullet_y[i]--;
			}
		}
		//----------------------------------------------- drawing block -----------------------------------
		Sleep(100);
		//----------------------------------------------- erasing block -----------------------------------
		erase_ship(ship_x, ship_y);
		for (int i = 0; i < maxbullet; i++) {
			erase_bullet(bullet_x[i], bullet_y[i] + 1);
		}
		//----------------------------------------------- erasing block -----------------------------------
	}

	return 0;
}

//----------------------------------------------- Function ----------------------------------------------
void draw_ship(int x, int y) {
	gotoxy(x, y);
	setcolor(2, 4);							// foreground 2::green , backgound 4::red
	cout << "<-A->";
}
void erase_ship(int x, int y) {
	gotoxy(x, y);
	setcolor(0, 0);
	cout << "     ";
}
bool draw_bullet(bool bullet_shoot, int x, int y) {
	if (!over_frame(x, y)) {
		if (bullet_shoot) {
			gotoxy(x + 2, y);
			setcolor(7, 0);
			cout << "i";
		}
		return true;
	}
	else {
		return false;
	}
}
void erase_bullet(int x,int y) {
	gotoxy(x+2, y);
	setcolor(0, 0);
	cout << " ";
}
bool over_frame(int x, int y) {
	if (x >= 0 && x <= 75 && y >= 0 && y <= 20) {
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
void showcursor(bool visible) {
	HANDLE console = GetStdHandle(STD_OUTPUT_HANDLE);
	CONSOLE_CURSOR_INFO lpCursor;
	lpCursor.bVisible = visible;
	lpCursor.dwSize = 20;
	SetConsoleCursorInfo(console, &lpCursor);
}
void setcolor(int fg, int bg) {
	HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(hConsole, bg * 16 + fg);
}
//----------------------------------------------- Function ----------------------------------------------