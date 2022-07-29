uses crt;
var
  q,c:char;
  con, get, enemylife, life:boolean;
  x,y, w, e, r,x1,y1,i:byte;
  x0,y0,textx,texty:byte;
  patron,bomb:byte;
  ax,ay:byte;
  inx,iny,outx,outy:byte;
  hp:byte;
  loot,bufferbomb,bufferpatron:integer;
  enemyx,enemyy,enemyhp, enemyx0, enemyy0, enemyw, enemypatron, enemybomb, enemyx1, enemyy1 :byte;
 
  
procedure popup(z:string);
begin
  r:=1;
  gotoxy(10,10);textcolor(r);textbackground(15-r); write('------------------------------');
  gotoxy(10,11);textcolor(r);textbackground(15-r); write('| Popup.exe                |');
  gotoxy(10,12);textcolor(r);textbackground(15-r); write('|----------------------------|');
  gotoxy(10,13);textcolor(r);textbackground(15-r); write('|',z                  ,' >   |');
  gotoxy(10,14);textcolor(r);textbackground(15-r); write('|                    Enter...|');
  gotoxy(10,15);textcolor(r);textbackground(15-r); write('|----------------------------|');
  gotoxy(36,13);
  textcolor(15);textbackground(0);
end;

procedure cleaner(x,y:byte);
begin
  gotoxy(x-3, y-2); write('        ');
  gotoxy(x-3, y-1); write('        ');
  gotoxy(x-3, y+0); write('        ');
  gotoxy(x-3, y+1); write('        ');
  gotoxy(x-3, y-2); write('        ');
end;

procedure menu(x,y:byte);
begin
  gotoxy(1,25);
  textcolor(RED);
  write('[e]-shoot  [r]-bomb  HP  ');
  textcolor(BLUE);
  write('[o]-shoot  [p]-bomb  HP ');
  textcolor(WHITE);
  write('[Space]-pause [Esc]-exit');
  
   gotoxy(10,25); write(patron);
  gotoxy(20,25); write(bomb);
  gotoxy(24,25); write(hp);
  gotoxy(35,25); write(enemypatron);
  gotoxy(45,25); write(enemybomb);
  gotoxy(49,25); write(enemyhp);
  gotoxy(x,y);
end;

procedure veapon(x,y,w:byte);
begin
  if(w=1)then
  begin
    gotoxy(x,y-1);write('|');
  end
  else if(w=2)then
  begin
    gotoxy(x+1,y);write('-')
    end
    else if(w=3)then
  begin
     gotoxy(x,y+1);write('|');   
  end
  else if(w=4)then
  begin
    gotoxy(x-1,y);write('-')
    end;
    gotoxy(x,y);
end;

procedure boom(x,y,w:byte);
begin
  i:=0;
  if(bomb=0)or(bomb>100)then
  begin
    gotoxy(x-2,y);
    write('No bomb');
    end
  else
  begin
  r:=1;
  x1:=x;y1:=y;
  
  if(w=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then exit;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(x,y-r);write('!');
    delay(e);
    if(enemyx=x)and(enemyy=y-i)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
    
  end;
  y:=2;
  end
  
  
  else if(w=2)then
  begin
  r:=x;
  while(TRUE)do
  begin
    if(r=78)then exit;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('=');
    delay(e);
    if(enemyx=x+i)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
  end;
  x:=117;
  end
  
  
  else if(w=3)then
  begin
  r:=y;
  while(TRUE)do
  begin
    if(r-1=25)then exit;
    r:=r+1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(x,r);write('!');
    delay(e);
    if(enemyx=x)and(enemyy=y+i)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
  end;
  y:=29;
  end
  
  
  else if(w=4)then
  begin
    r:=x;
  while(TRUE)do
  begin
    if(r=1)then exit;
    r:=r-1;i:=i+1;
    gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;gotoxy(r,y);write('=');
    delay(e);
    if(enemyx=x-i)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-5;
      gotoxy(enemyx,enemyy);write('x');
      exit;
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
 gotoxy(x1,y1);textcolor(RED);write(q);textcolor(WHITE);; bomb:=bomb-1;
 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);
 end;
end;

procedure enemyboom(enemyx,enemyy,enemyw:byte);
begin
  i:=0;
  if(enemybomb=0)or(enemybomb>100)then
  begin
    gotoxy(enemyx-2,enemyy);
    write('No bomb');
    end
  else
  begin
  r:=1;
  enemyx1:=enemyx;enemyy1:=enemyy;
  
  if(enemyw=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=enemyy)then exit;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,enemyy-r);write('!');
    delay(e);
    if(enemyx=x)and(enemyy-i=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('x');
      exit;
    end;
    
  end;
  enemyy:=2;
  end
  
  
  else if(enemyw=2)then
  begin
  r:=enemyx;
  while(TRUE)do
  begin
    if(r=78)then exit;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('=');
    delay(e);
    if(enemyx+i=x)and(enemyy=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('x');
      exit;
    end;
  end;
  enemyx:=117;
  end
  
  
  else if(enemyw=3)then
  begin
  r:=enemyy;
  while(TRUE)do
  begin
    if(r-1=25)then exit;
    r:=r+1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(enemyx,r);write('!');
    delay(e);
    if(enemyx=x)and(enemyy+i=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('x');
      exit;
    end;
  end;
  enemyy:=29;
  end
  
  
  else if(enemyw=4)then
  begin
    r:=enemyx;
  while(TRUE)do
  begin
    if(r=1)then exit;
    r:=r-1;i:=i+1;
    gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;gotoxy(r,enemyy);write('=');
    delay(e);
    if(enemyx-i=x)and(enemyy=y)then
    begin
      hp:=hp-5;
      gotoxy(x,y);write('x');
      exit;
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
 gotoxy(enemyx1,enemyy1);textcolor(BLUE);write(q);textcolor(WHITE);; enemybomb:=enemybomb-1;
 gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);
 end;
end;

procedure shoot(x,y,w:byte);
begin
  i:=0;
  if(patron=0)or(patron>100)then
  begin
    gotoxy(x-2,y);
    write('No ammo');
  end
  else
  begin
  r:=1;
  if(w=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then exit;
    r:=r+1;i:=i+1;
    if(enemyx=x)and(enemyy<y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;

  end;
  clrscr;
  gotoxy(x,1);write('Х');
  end

  else if(w=2)then
  begin
  r:=x;
  while(TRUE)do
  begin
    if(r>78)then exit;
    r:=r+1;i:=i+1;

    if(enemyx>x)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
  end;
  clrscr;
  gotoxy(78,y);write('Х')
  end
  
  
  else if(w=3)then
  begin
  r:=y;
  while(TRUE)do
  begin
    if(r-1=25)then exit;
    r:=r+1;i:=i+1;

    if(enemyx=x)and(enemyy>y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
  end;
  clrscr;
  gotoxy(x,25);write('Х');
  end
  
  
  else if(w=4)then
  begin
    r:=x;
  while(TRUE)do
  begin
    if(r<2)then exit;
    r:=r-1;i:=i+1;

    if(enemyx<x)and(enemyy=y)then
    begin
      enemyhp:=enemyhp-1;
      gotoxy(enemyx,enemyy);write('x');
      exit
    end;
  end;
  clrscr;
  gotoxy(1,y);write('Х');
  
  end;
    
  gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);;
 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);
 patron:=patron-1;
 end;
 end;

procedure enemyshoot(enemyx,enemyy,enemyw:byte);
begin
  i:=0;
  if(enemypatron>100)or(enemypatron=0)then
  begin
    gotoxy(enemyx-2,enemyy);
    write('No ammo');

  end
  else
  begin
  r:=1;
  if(enemyw=1)then
  begin
  while(TRUE)do
  begin
    if(r+2=y)then exit;
    r:=r+1;i:=i+1;

    if(enemyx=x)and(enemyy>y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('x');
      exit;
    end;
      end;
  clrscr;
  gotoxy(enemyx,1);write('Х');
  end
  
  
  else if(enemyw=2)then
  begin
  r:=enemyx;
  while(TRUE)do
  begin
    if(r>78)then exit;
    r:=r+1;i:=i+1;
        if(enemyx<x)and(enemyy=y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('x');
      exit;
    end;
  end;
  clrscr;
  gotoxy(78,enemyy);write('Х')
  end
  
  
  else if(enemyw=3)then
  begin
  r:=enemyy;
  while(TRUE)do
  begin
    if(r-1=25)then exit;
    r:=r+1;i:=i+1;

    if(enemyx=x)and(enemyy<y)then
    begin
      hp:=hp-1;
      gotoxy(enemyx,enemyy);write('x');
      exit;
    end;
  end;
  clrscr;
  gotoxy(enemyx,25);write('Х');
  end
  
  
  else if(enemyw=4)then
  begin
    r:=enemyx;
  while(TRUE)do
  begin
    if(r<2)then exit;
    r:=r-1;i:=i+1;

    if(enemyx>x)and(enemyy=y)then
    begin
      hp:=hp-1;
      gotoxy(x,y);write('x');
      exit
    end;
  end;
  clrscr;
  gotoxy(1,enemyy);write('Х');
  
  end;
    

 gotoxy(enemyx,enemyy);textcolor(BLUE);write(q);textcolor(WHITE);;
 gotoxy(x,y);textcolor(RED);write(q);textcolor(WHITE);
 enemypatron:=enemypatron-1;
 end;
 end;

procedure intro;
begin
  writeln;writeln;writeln;writeln;writeln;
  writeln(' -=  Super Potatos Battle 1.0 DOS edition =-');
  writeln('Created by Bessonov Vyacheslav. 2022');
  writeln('-------------------------------------');
  write('              ');textcolor(RED);write('1st Player');
  textcolor(BLUE);writeln('   2nd Player');textcolor(WHITE);
  writeln('Move          wasd        ijkl');
  writeln('Shoot         e           o');
  writeln('Bombs         r           p');
  writeln('-------------------------------------');
  writeln(' ');
  writeln('Pause           Space');
  writeln('Exit            esc');
  writeln;
  write('       ');textcolor(LIGHTGREEN);write('b');textcolor(WHITE);writeln(' - bonus');
  writeln;writeln('');
  writeln('Press [Enter]...');
  readln;
  clrscr;
end;

procedure snake;
begin
  if(get)then
    begin
    ax:=Random(76)+2;
    ay:=Random(21)+2;
    gotoxy(textx,texty);write('');
    get:=FALSE;
    end;
    if((x=ax)and(y=ay))then
    begin
      
      loot:=Random(5)+1;
      
      bufferpatron:=patron; patron:=bufferpatron+Random(4)+1;
      bufferbomb:=bomb;
      if(loot<3)then
        bomb:=bomb+1
      else if(loot=4)then
        bomb:=bomb+0
        else if(loot=5)then
        bomb:=bomb+0;
      get:=TRUE;
      textx:=ax-6;texty:=ay-2;
      gotoxy(textx,texty);write('+',patron-bufferpatron,' patrons and +', bomb-bufferbomb,' bombs   ');


      end
    else if(enemyx=ax)and(enemyy=ay) then
    begin

      loot:=Random(5)+1;
      bufferpatron:=enemypatron; enemypatron:=bufferpatron+Random(4)+1;
      bufferbomb:=bomb;
      if(loot<3)then
        enemybomb:=enemybomb+1
      else if(loot=4)then
        enemybomb:=enemybomb+0
        else if(loot=5)then
        enemybomb:=enemybomb+0;
      get:=TRUE;
      textx:=ax-6;texty:=ay-2;
      gotoxy(textx,texty);write('+',enemypatron-bufferpatron);
	  write(' patrons and +', enemybomb-bufferbomb,' bombs   ');
      end;
    gotoxy(ax,ay); textcolor(LIGHTGREEN);write('b');textcolor(WHITE);
end;

procedure user;
begin
  if(life)then
  begin
    life:=FALSE;
    x:=Random(74)+3;
    y:=Random(19)+3;
    gotoxy(x,y); textcolor(RED);write('o');textcolor(WHITE);
    hp:=10;
    end;
end;

procedure enemy;
begin
  if(enemylife)then
  begin
    enemyx:=Random(74)+3;
    enemyy:=Random(19)+3;
    gotoxy(enemyx,enemyy); textcolor(BLUE); write('o'); textcolor(WHITE);
    enemyhp:=10;
    enemylife:=FALSE;
    end;
end;

procedure console;
begin
  if(con)then    begin
      gotoxy(1,1);
      textcolor(RED);writeln('x=',x,' y=',y,' w=',w,' hp=',hp, ' dead=',life,'  ');
      textcolor(BLUE);writeln('x=',enemyx,' y=',enemyy,' w=',enemyw, ' hp=',enemyhp,' dead=',enemylife,'  ');
      textcolor(WHITE);
   end;
end;

procedure cell;
begin
  if(y>19)then
      y:=19;
      if(y<3)then
      y:=3;
      if(x<4)then
      x:=4;
      if(x>78)then
      x:=78;
end;

procedure enemycell;
begin
  if(enemyy>19)then
      enemyy:=19;
      if(enemyy<3)then
      enemyy:=3;
      if(enemyx<4)then
      enemyx:=4;
      if(enemyx>78)then
      enemyx:=78;
end;

procedure drop;
begin
  if(x>80)or(y>25)or(enemyx>80)or(enemyy>25)then
  begin
    con:=TRUE;
    popup('Error: player out game space');
  end;
end;


begin
  e:=1;
  q:='o';
  patron:=3; enemypatron:=3;
  bomb:=1; enemybomb:=1;
  textx:=80;texty:=80;


  hp:=10; enemyhp:=10;
  w:=1; enemyw:=1;
  intro;
  get:=TRUE;
  enemylife:=TRUE; life:=TRUE;
  repeat 
  begin
    enemy;user;
    
     if(enemyhp=0)or(enemyhp>100)then
      begin
      enemylife:=TRUE;
      end;
    if(hp=0)or(hp>100)then
      begin
      life:=TRUE;

      end;

    snake;    
    console;    
    menu(x,y);drop;
    if keypressed then
    begin
      c:=readkey;
      case c of
        'h':con:=TRUE;
        
        #32:begin gotoxy(1,1); clrscr; intro; end;

        
        'w':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x,y-1);w:=1; textcolor(RED);write(q);textcolor(WHITE);; y:=y-1; end;
        'a':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x-1,y);w:=4; textcolor(RED);write(q);textcolor(WHITE);; x:=x-1; end;
        's':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x,y+1);w:=3; textcolor(RED);write(q);textcolor(WHITE);; y:=y+1; end;
        'd':begin x0:=x; y0:=y; cleaner(x0,y0); gotoxy(x+1,y);w:=2; textcolor(RED);write(q);textcolor(WHITE);; x:=x+1; end;
        'e':begin shoot(x,y,w); end;
        'r':boom(x,y,w);
        
        'i':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx,enemyy-1);enemyw:=1;
        textcolor(BLUE);write(q);textcolor(WHITE);; enemyy:=enemyy-1; end;
        'j':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx-1,enemyy);enemyw:=4;
        textcolor(BLUE);write(q);textcolor(WHITE);; enemyx:=enemyx-1; end;
        'k':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx,enemyy+1);enemyw:=3;
         textcolor(BLUE);write(q);textcolor(WHITE);; enemyy:=enemyy+1; end;
        'l':begin enemyx0:=enemyx; enemyy0:=enemyy; cleaner(enemyx0,enemyy0); gotoxy(enemyx+1,enemyy);enemyw:=2;
        textcolor(BLUE);write(q);textcolor(WHITE);; enemyx:=enemyx+1; end;
        'o':begin enemyshoot(enemyx,enemyy,enemyw); end;
        'p':enemyboom(enemyx,enemyy,enemyw);
      end;
      
      veapon(enemyx,enemyy,enemyw);
      veapon(x,y,w);
      cell; enemycell;
      end;
      
    end
    until c=#27;
    
end.