#include<iostream>
#include<windows.h>
#include<conio.h>
#include<time.h>
#include<iomanip>

using namespace std;

//----------------------------------------------- Function prototype -------------------------------------
void draw_ship(int, int);
void erase_ship(int,int);
bool draw_bullet(bool, int, int, int*);
void erase_bullet(int, int);	
bool over_frame(int, int);
void make_star(int, int, int*);

void setframe(void);
void setscoreframe(void);
void endgame(void);

void gotoxy(int, int);
void showcursor(bool);
void setcolor(int, int);
char cursor(int, int);
//----------------------------------------------- Function prototype -------------------------------------

int score = 0;
int window_height = 20;
int window_width = 80;

int main() {
	showcursor(false);
	setframe();
	srand(time(NULL));

	int ship_x;
	int ship_y;

	const int maxbullet = 5;
	bool bullet_shoot[maxbullet] = {false};
	int bullet_x[maxbullet] = {0};
	int bullet_y[maxbullet] = {0};
	int numbullet = 0;

	int maxstar = 20;
	int numstar = 0;

	
	int ship_startx = 38;
	int ship_starty = 20;

	ship_x = ship_startx;
	ship_y = ship_starty;
	draw_ship(ship_x, ship_y);

	char key = ' ';
	while (key != 'x') {
		setscoreframe();
		//----------------------------------------------- debug bullet console ----------------------------
		setcolor(7,0);
		gotoxy(0, 23);
		cout << "Bullet Status : ";
		for (int i = 0; i < maxbullet; i++) {
			cout << bullet_shoot[i] << " ";
		}
		//----------------------------------------------- debug bullet console ----------------------------
		while (numstar < maxstar) {
			make_star(rand() % 61 + 10, rand() % 4 + 2, &numstar);
		}
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
			/*if (key == 'w') {	
				if (!over_frame(ship_x, ship_y - 1)) {
					ship_y--;
				}
			}
			if (key == 's') {	
				if (!over_frame(ship_x, ship_y+1)) {
					ship_y++;
				}
			}*/
			if (key == ' ') {
				bullet_shoot[numbullet] = true;
				bullet_x[numbullet] = ship_x+2;
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
				bullet_shoot[i] = draw_bullet(bullet_shoot[i], bullet_x[i], bullet_y[i], &numstar);
				bullet_y[i]--;
			}
		}
		//----------------------------------------------- drawing block -----------------------------------
		Sleep(50);
		//----------------------------------------------- erasing block -----------------------------------
		erase_ship(ship_x, ship_y);
		for (int i = 0; i < maxbullet; i++) {
			erase_bullet(bullet_x[i], bullet_y[i] + 1);
		}
		//----------------------------------------------- erasing block -----------------------------------
	}

	endgame();

	return 0;
}

//----------------------------------------------- Function ----------------------------------------------
void draw_ship(int x, int y) {
	gotoxy(x, y);
	setcolor(10, 12);							// foreground 2::lightgreen , backgound 4::lightred
	cout << "<-A->";
}
void erase_ship(int x, int y) {
	gotoxy(x, y);
	setcolor(0, 0);
	cout << "     ";
}
bool draw_bullet(bool bullet_shoot, int x, int y,int *numstar) {
	if (!over_frame(window_width/2, y)) {  // <<--- Set x in range 0 to window_width-5 [Because func(draw_bullet) use func(over_frame) to check only y position]
		if (cursor(x, y) != '*') {
			if (bullet_shoot) {
				gotoxy(x, y);
				setcolor(7, 0);
				cout << "i";
				return true;
			}
		}
		else {								// star crash by shooting
			score = score + 100;			// updating score
			
			*numstar = *numstar - 1;
			Beep(rand()%4000+500,50);
			return false;
		}
	}
	else {
		return false;
	}
}
void erase_bullet(int x,int y) {
	if (y!=0) {
		gotoxy(x, y);
		setcolor(0, 0);
		cout << " ";
	}
}
bool over_frame(int x, int y) {
	if (x >= 0 && x <= window_width-5 && y >= 1 && y <= window_height) {
		return false;
	}
	else {
		return true;
	}
}
void make_star(int x ,int y, int *numstar) {
	gotoxy(x, y);
	if (cursor(x,y)!='*') {
		setcolor(7, 0);
		cout << "*";
		*numstar = *numstar + 1;
	}
}

void setframe() {
	int i;
	for (i = 0; i < window_width; i++) {
		gotoxy(i, 0);
		setcolor(0, 8);
		cout << " ";
	}
	for (i = 0; i < window_width; i++) {
		gotoxy(i, 21);
		setcolor(0, 8);
		cout << " ";
	}
}
void setscoreframe() {
	gotoxy(window_width - 17, 0);
	setcolor(0, 15);
	cout << " Score : ";
	cout << setfill('0') << setw(7) << score << "  ";
}
void endgame() {
	system("cls");
	
	gotoxy(window_width / 2 - 10, window_height / 2);
	setcolor(7, 0);
	cout << "Your Score : ";
	cout << setfill('0') << setw(7) << score << "  ";
	
	_getch();
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
char cursor(int x, int y) {
	HANDLE hStd = GetStdHandle(STD_OUTPUT_HANDLE);
	char buf[2];
	COORD c = { x,y };
	DWORD num_read;
	if (!ReadConsoleOutputCharacter(hStd, (LPTSTR)buf, 1, c, (LPDWORD)&num_read)) {
		return '\0';
	}
	else {
		return buf[0];
	}
}
//----------------------------------------------- Function ----------------------------------------------