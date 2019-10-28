/************** Home State ******************************/
void show_clock(){
  print_char( 2, 1, clock.hour / 10 + '0');             //print hour
  print_char( 6, 1, clock.hour % 10 + '0');
  
  print_char(12, 1, clock.minute / 10 + '0');           //print minute
  print_char(17, 1, clock.minute % 10 + '0');
  
  print_char(23, 1, clock.second / 10 + '0');           //print second
  print_char(27, 1, clock.second % 10 + '0');

  if(clock.second % 2 != 0){                            //print ':' with brink
    print_char( 9, 1, ' ');
    print_char( 20, 1, ' ');  
  }
  else{
    print_char( 9, 1, ':');
    print_char( 20, 1, ':');
  }
}
