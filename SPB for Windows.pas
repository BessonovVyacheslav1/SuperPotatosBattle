uses crt;
var
  q,c:char;
  con, get, enemylife, life:boolean;
  x,y, w, e, r,x1,y1:byte;
  x0,y0,textx,texty:byte;
  patron,bomb:byte;
  ax,ay:byte;
  inx,iny,outx,outy:byte;
  hp:byte;
  enemyx,enemyy,enemyhp, enemyx0, enemyy0, enemyw, enemypatron, enemybomb, enemyx1, enemyy1 :byte;
 
  
procedure popup(z:string);
begin
  r:=1;
  gotoxy(10,10);textcolor(r);textbackground(15-r); write('╔════════════════════════════╗');
  gotoxy(10,11);textcolor(r);textbackground(15-r); write('║ ☺ Popup.exe                ║');
  gotoxy(10,12);textcolor(r);textbackground(15-r); write('╟────────────────────────────╢');
  gotoxy(10,13);textcolor(r);textbackground(15-r); write('║',z                  ,' >   ║');
  gotoxy(10,14);textcolor(r);textbackground(15-r); write('║                    Enter...║');
  gotoxy(10,15);textcolor(r);textbackground(15-r); write('╚════════════════════════════╝');
  gotoxy(36,13);
  textcolor(15);textbackground(0);
end;

procedure cleaner(x,y:byte);// по идее должен очищать 3х3 символов вокруг игрока
begin
  gotoxy(x-3, y-2); write('        ');
  gotoxy(x-3, y-1); write('        ');
  gotoxy(x-3, y+0); write('        ');
  gotoxy(x-3, y+1); write('        ');
  gotoxy(x-3, y-2); write('        ');
end;

procedure menu(x,y:byte);
begin
  gotoxy(1,30);
  textcolor(RED);
  write('[e] - выстрел    [r] - бомбы   HP        ');textcolor(BLUE);write('[o] - выстрел   [p] - бомбы    HP             ');textcolor(WHITE);write('[Space] - пауза   [Esc] - выход');
  
  gotoxy(15,30); write(patron);
  gotoxy(30,30); write(bomb);
  gotoxy(34,30); write(hp);
  gotoxy(56,30); write(enemypatron);
  gotoxy(70,30); write(enemybomb);
  gotoxy(75,30); write(enemyhp);
  gotoxy(x,y);
end;

procedure veapon(x,y,w:byte);
begin
  if(w=1)then
  begin
    gotoxy(x,y-1);write('↑');
  end
  else if(w=2)then
  begin
    gotoxy(x+1,y);write('→')
    end
    else if(w=3)then
  begin
     gotoxy(x,y+1);write('↓');   
  end
  else if(w=4)then
  begin
    gotoxy(x-1,y);write('←')
    end;
    gotoxy(x,y);
end;

procedure boom(x,y,w:byte);
begin
  var i:byte;i:=0;
  if(bomb=0)or(bomb>100)then
  begin
    gotoxy(x-2,y);
    write('No bomb');
    system.Console.Beep(1000,100);
  end
  else
  begin
  r:=1;
  x1:=x;y1:=y;
  
  if(w=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then break;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(x,y-r);write('!');
    delay(e);//clrscr;
    if(enemyx=x)and(enemyy=y-i)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
    
  end;
  y:=2;
  end
  
  
  else if(w=2)then
  begin
  r:=x;
  while(TRUE)do
  begin
    if(r=118)then break;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('=');
    delay(e);//clrscr;
    if(enemyx=x+i)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  x:=117;
  end
  
  
  else if(w=3)then
  begin
  r:=y;
  while(TRUE)do
  begin
    if(r-1=30)then break;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(x,r);write('!');
    delay(e);//clrscr;
    if(enemyx=x)and(enemyy=y+i)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  y:=29;
  end
  
  
  else if(w=4)then
  begin
    r:=x;
  while(TRUE)do
  begin
    if(r=1)then break;
    r:=r-1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('=');
    delay(e);//clrscr;
    if(enemyx=x-i)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  x:=3;
  end;
 write('X');
 delay(e);
 clrscr;
 gotoxy(x-1,y-1);write('\ | /');
 gotoxy(x-2,y); write('-BOOM!-');
 gotoxy(x-1,y+1);write('/ | \');
 system.Console.Beep(400,10);
 gotoxy(x1,y1);textcolor(RED);write(q);textcolor(WHITE);; bomb:=bomb-1;
 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);
 end;// цикл просмотра кол-ва бомб
end;

procedure enemyboom(enemyx,enemyy,enemyw:byte);
begin
  var i:byte;i:=0;
  if(enemybomb=0)or(enemybomb>100)then
  begin
    gotoxy(enemyx-2,enemyy);
    write('No bomb');
    system.Console.Beep(1000,100);
  end
  else
  begin
  r:=1;
  enemyx1:=enemyx;enemyy1:=enemyy;
  
  if(enemyw=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=enemyy)then break;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,enemyy-r);write('!');
    delay(e);//clrscr;
    if(enemyx=x)and(enemyy-i=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('●');
      break;
    end;
    
  end;
  enemyy:=2;
  end
  
  
  else if(enemyw=2)then
  begin
  r:=enemyx;
  while(TRUE)do
  begin
    if(r=118)then break;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('=');
    delay(e);//clrscr;
    if(enemyx+i=x)and(enemyy=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('●');
      break;
    end;
  end;
  enemyx:=117;
  end
  
  
  else if(enemyw=3)then
  begin
  r:=enemyy;
  while(TRUE)do
  begin
    if(r-1=30)then break;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,r);write('!');
    delay(e);//clrscr;
    if(enemyx=x)and(enemyy+i=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('●');
      break;
    end;
  end;
  enemyy:=29;
  end
  
  
  else if(enemyw=4)then
  begin
    r:=enemyx;
  while(TRUE)do
  begin
    if(r=1)then break;
    r:=r-1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('=');
    delay(e);//clrscr;
    if(enemyx-i=x)and(enemyy=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('●');
      break;
    end;
  end;
  enemyx:=3;
  end;
 write('X');
 delay(e);
 clrscr;
 gotoxy(enemyx-1,enemyy-1);write('\ | /');
 gotoxy(enemyx-2,enemyy); write('-BOOM!-');
 gotoxy(enemyx-1,enemyy+1);write('/ | \');
 system.Console.Beep(400,10);
 gotoxy(enemyx1,enemyy1);textcolor(BLUE);write(q);textcolor(WHITE);; enemybomb:=enemybomb-1;
 gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);
 end;// цикл просмотра кол-ва бомб
end;

procedure shoot(x,y,w:byte);
begin
  var i:byte; i:=0;
  if(patron=0)or(patron>100)then
  begin
    gotoxy(x-2,y);
    write('No ammo');
    system.Console.Beep(1000,100);
  end
  else
  begin
  r:=1;
  if(w=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then break;
    r:=r+1;i:=i+1;
    //gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);gotoxy(x,y-r);write('|');
    if(enemyx=x)and(enemyy<y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
    //delay(e);//clrscr;
  end;
  clrscr;
  gotoxy(x,1);write('Х');
  end

  else if(w=2)then
  begin
  r:=x;
  while(TRUE)do
  begin
    if(r>118)then break;
    r:=r+1;i:=i+1;
    //gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('-');
    //delay(e);//clrscr;
    if(enemyx>x)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  clrscr;
  gotoxy(118,y);write('Х')
  end
  
  
  else if(w=3)then
  begin
  r:=y;
  while(TRUE)do
  begin
    if(r-1=30)then break;
    r:=r+1;i:=i+1;
    //gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(x,r);write('|');
    //delay(e);//clrscr;
    if(enemyx=x)and(enemyy>y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  clrscr;
  gotoxy(x,30);write('Х');
  end
  
  
  else if(w=4)then
  begin
    r:=x;
  while(TRUE)do
  begin
    if(r<2)then break;
    r:=r-1;i:=i+1;
    //gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('-');
    //delay(e);//clrscr;
    if(enemyx<x)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('●');
      break
    end;
  end;
  clrscr;
  gotoxy(1,y);write('Х');
  
  end;
    
 system.Console.Beep(400,100);
 gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;
 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);
 patron:=patron-1;
 end;//цикл кол-ва патронов
end;

procedure enemyshoot(enemyx,enemyy,enemyw:byte);
begin
  var i:byte; i:=0;
  if(enemypatron>100)or(enemypatron=0)then
  begin
    gotoxy(enemyx-2,enemyy);
    write('No ammo');
    system.Console.Beep(1000,100);
  end
  else
  begin
  r:=1;
  if(enemyw=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then break;
    r:=r+1;i:=i+1;
    //gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,enemyy-r);write('|');
    if(enemyx=x)and(enemyy>y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('●');
      break;
    end;
    //delay(e);//clrscr;
  end;
  clrscr;
  gotoxy(enemyx,1);write('Х');
  end
  
  
  else if(enemyw=2)then
  begin
  r:=enemyx;
  while(TRUE)do
  begin
    if(r>118)then break;
    r:=r+1;i:=i+1;
    //gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('-');
    //delay(e);//clrscr;
    if(enemyx<x)and(enemyy=y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('●');
      break;
    end;
  end;
  clrscr;
  gotoxy(118,enemyy);write('Х')
  end
  
  
  else if(enemyw=3)then
  begin
  r:=enemyy;
  while(TRUE)do
  begin
    if(r-1=30)then break;
    r:=r+1;i:=i+1;
    //gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,r);write('|');
    //delay(e);//clrscr;
    if(enemyx=x)and(enemyy<y)then
    begin
      hp:=hp-1;
      gotoxy(enemyx,enemyy);write('●');
      break;
    end;
  end;
  clrscr;
  gotoxy(enemyx,30);write('Х');
  end
  
  
  else if(enemyw=4)then
  begin
    r:=enemyx;
  while(TRUE)do
  begin
    if(r<2)then break;
    r:=r-1;i:=i+1;
    //gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('-');
    //delay(e);//clrscr;
    if(enemyx>x)and(enemyy=y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('●');
      break
    end;
  end;
  clrscr;
  gotoxy(1,enemyy);write('Х');
  
  end;
    
 system.Console.Beep(400,100);
 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;
 gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);
 enemypatron:=enemypatron-1;
 end;//цикл кол-ва патронов
end;

procedure intro();
begin
  writeln();writeln();writeln();writeln();writeln();
  writeln('                                           -=  Super Potatos Battle 1.0  =-');
  writeln('                                         Сделал Бессонов Вячеслав в 2022 году');
  writeln('                              -----------------------------------------------------');
  write('                                                           ');textcolor(RED);write('1й игрок');textcolor(BLUE);writeln('    2й игрок');textcolor(WHITE);
  writeln('                              Управление                   wasd        ijkl');
  writeln('                              Стрелять                     у           o');
  writeln('                              Бомбы                        r           p');
  writeln('                              -----------------------------------------------------');
  writeln('                              ');
  writeln('                              Посмотреть это сообщение     Пробел');
  writeln('                              ');
  writeln('                              Выход                        esc');
  writeln();
  write('                              ');textcolor(LIGHTGREEN);write('☼');textcolor(WHITE);writeln(' - бонус');
  writeln();writeln('                              Включи английскую раскладку');
  writeln('                                                                                             Нажми [Enter]...');
  readln();
  clrscr;
end;

procedure snake;
begin
  if(get)then
    begin
    ax:=Random(5,115);
    ay:=Random(5,25);
    
    get:=FALSE;
    end;
    if((x=ax)and(y=ay))then
    begin
      var loot,bufferbomb,bufferpatron:integer;
      loot:=Random(1,5);
      
      bufferpatron:=patron; patron:=bufferpatron+Random(1,4);
      bufferbomb:=bomb;
      if(loot<3)then
        bomb:=bomb+1
      else if(loot=4)then
        bomb:=bomb+0
        else if(loot=5)then
        bomb:=bomb+0;
      get:=TRUE;
      textx:=ax-6;texty:=ay-2;
      gotoxy(textx,texty);write('+',patron-bufferpatron,' патронов и +', bomb-bufferbomb,' бомб   ');
      
      system.Console.Beep(1000,10);
    end
    else if(enemyx=ax)and(enemyy=ay) then
    begin
      var loot,bufferbomb,bufferpatron:integer;
      loot:=Random(1,5);
      bufferpatron:=enemypatron; enemypatron:=bufferpatron+Random(1,4);
      bufferbomb:=bomb;
      if(loot<3)then
        enemybomb:=enemybomb+1
      else if(loot=4)then
        enemybomb:=enemybomb+0
        else if(loot=5)then
        enemybomb:=enemybomb+0;
      get:=TRUE;
      textx:=ax-6;texty:=ay-2;
      gotoxy(textx,texty);write('+',enemypatron-bufferpatron,' патронов и +', enemybomb-bufferbomb,' бомб   ');
      system.Console.Beep(1000,10);
    end;
    gotoxy(ax,ay); textcolor(LIGHTGREEN);write('☼');textcolor(WHITE);
end;

procedure user;
begin
  if(life)then
  begin
    life:=FALSE;
    x:=Random(3,117);
    y:=Random(3,27);
    gotoxy(x,y); textcolor(RED);write('☻');textcolor(WHITE);
    hp:=10;
    end;
end;

procedure enemy;
begin
  if(enemylife)then
  begin
    enemyx:=Random(3,117);
    enemyy:=Random(3,27);
    gotoxy(enemyx,enemyy); textcolor(BLUE); write('☻'); textcolor(WHITE);
    enemyhp:=10;
    enemylife:=FALSE;
    end;
end;

procedure portal;
begin
  //Портал
    inx:=Random(5,115);
    iny:=Random(5,115);
    outx:=Random(5,115);
    outy:=Random(5,115);
    gotoxy(inx,iny);write('■  in');
    gotoxy(outx,outy);write('□  out');
    if(x=10)and(y=10)then
    begin
      x:=101;
      y:=25;
    end;
end;

procedure console;
begin
  if(con)then // режим Билла Гейтса
    begin
      gotoxy(1,1);
      textcolor(RED);writeln('Player 1: x=',x,' y=',y,' w=',w,' hp=',hp, ' dead=',life,'   ');
      textcolor(BLUE);writeln('Player 2: x=',enemyx,' y=',enemyy,' w=',enemyw, ' hp=',enemyhp,' dead=',enemylife,'   ');
      textcolor(WHITE);
   end;
end;

procedure cell;
begin
  if(y>27)then
      y:=27;
      if(y<3)then
      y:=3;
      if(x<4)then
      x:=4;
      if(x>118)then
      x:=118;
end;

procedure enemycell;
begin
  if(enemyy>27)then
      enemyy:=27;
      if(enemyy<3)then
      enemyy:=3;
      if(enemyx<4)then
      enemyx:=4;
      if(enemyx>118)then
      enemyx:=118;
end;

procedure drop;
begin
  if(x>120)or(y>30)or(enemyx>120)or(enemyy>30)then
  begin
    con:=TRUE;
    popup('Произошла ошибка игрок вне поля');
  end;
end;

procedure gimn;
begin
  var d:integer;
  d:=300;
  system.Console.Beep(392,2*d);
  system.Console.Beep(523,4*d);
  system.Console.Beep(392,3*d);
  system.Console.Beep(392,d);
  system.Console.Beep(494,4*d);
  system.Console.Beep(330,2*d);
  system.Console.Beep(330,2*d);
  system.Console.Beep(440,4*d);
  system.Console.Beep(392,3*d);
  system.Console.Beep(349,d);
  system.Console.Beep(392,4*d);
  system.Console.Beep(262,2*d);
  system.Console.Beep(262,2*d);
  system.Console.Beep(294,4*d);
  system.Console.Beep(294,2*d);
  system.Console.Beep(330,2*d);
  system.Console.Beep(349,4*d);
  system.Console.Beep(349,2*d);
  system.Console.Beep(392,2*d);
  system.Console.Beep(440,4*d);
  system.Console.Beep(493,2*d);
  system.Console.Beep(523,2*d);
  system.Console.Beep(587,3*d);
  //
  system.Console.Beep(392,2*d);
  system.Console.Beep(659,4*d);
  system.Console.Beep(587,3*d);
  system.Console.Beep(523,1*d);
  system.Console.Beep(587,4*d);
  system.Console.Beep(494,2*d);
  system.Console.Beep(392,2*d);
  system.Console.Beep(523,4*d);
  system.Console.Beep(493,3*d);
  system.Console.Beep(440,1*d);
  system.Console.Beep(494,4*d);
  system.Console.Beep(330,2*d);
  system.Console.Beep(330,2*d);
  system.Console.Beep(440,4*d);
  system.Console.Beep(392,2*d);
  system.Console.Beep(349,2*d);
  system.Console.Beep(392,4*d);
  system.Console.Beep(262,2*d);
  system.Console.Beep(262,2*d);
  system.Console.Beep(523,4*d);
  system.Console.Beep(494,3*d);
  system.Console.Beep(440,1*d);
  system.Console.Beep(392,8*d);
end;
begin
  
  setwindowtitle('Битва супер картошек');
  e:=1;
  q:='☺';
  patron:=3; enemypatron:=3;
  bomb:=1; enemybomb:=1;
  textx:=120;texty:=120;
  //gotoxy(x,y); writeln(q);
  Hidecursor();
  hp:=10; enemyhp:=10;
  w:=1; enemyw:=1;
  intro();
  setwindowsize(120,30);
  get:=TRUE;
  enemylife:=TRUE; life:=TRUE;
  repeat 
  begin
    enemy;user;
    
    //Проверка жизни
    if(enemyhp=0)or(enemyhp>100)then
      begin
      enemylife:=TRUE;
      //win(TRUE);
      end;
    if(hp=0)or(hp>100)then
      begin
      life:=TRUE;
      //win(FALSE);
      end;
    //portal;
    snake;    
    console;    
    menu(x,y);drop;
    if keypressed then
    begin
      c:=readkey;
      case c of
        'h':con:=TRUE;
        //'n':begin x0:=x; y0:=y; cleaner(x0,y0); textcolor(r);textbackground(15-r);popup('Введи задержку (был 10)');textcolor(15);textbackground(0); readln(e); if(e>1000)then popup('Слишком много      ') else continue;end;
        //'m':begin x0:=x; y0:=y; cleaner(x0,y0); popup('Введи символ для перса  '); readln(q); end;
        #32:begin gotoxy(1,1); clrscr; intro(); end;
        'z':gimn;
        
        'w':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x,y-1);w:=1; textcolor(RED);write(q);textcolor(WHITE);; y:=y-1; end;
        'a':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x-1,y);w:=4; textcolor(RED);write(q);textcolor(WHITE);; x:=x-1; end;
        's':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x,y+1);w:=3; textcolor(RED);write(q);textcolor(WHITE);; y:=y+1; end;
        'd':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x+1,y);w:=2; textcolor(RED);write(q);textcolor(WHITE);; x:=x+1; end;
        'e':begin shoot(x,y,w); end;
        'r':boom(x,y,w);
        
        'i':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx,enemyy-1);enemyw:=1; textcolor(BLUE);write(q);textcolor(WHITE);; enemyy:=enemyy-1; end;
        'j':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx-1,enemyy);enemyw:=4; textcolor(BLUE);write(q);textcolor(WHITE);; enemyx:=enemyx-1; end;
        'k':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx,enemyy+1);enemyw:=3; textcolor(BLUE);write(q);textcolor(WHITE);; enemyy:=enemyy+1; end;
        'l':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx+1,enemyy);enemyw:=2; textcolor(BLUE);write(q);textcolor(WHITE);; enemyx:=enemyx+1; end;
        'o':begin enemyshoot(enemyx,enemyy,enemyw); end;
        'p':enemyboom(enemyx,enemyy,enemyw);
      end;
      
      veapon(enemyx,enemyy,enemyw);
      veapon(x,y,w);
      cell; enemycell;
      if((y=29)and(y=1)and(x=2)and(x=119))then
      break;
      end;
      
    end
    until c=#27;
    
end.