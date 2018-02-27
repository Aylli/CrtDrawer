program draw;
uses Crt;
var x, y, color: integer; // Координаты, цвет пикселя, фона
    i, debug: integer; // Инкемент, дебаг
procedure setbackground(color: integer);
begin
    textbackground(color); // Задаём цвет фона
    clrscr; // Заливаем белым
end;
begin
    x:=1;
    y:=1;
    setbackground(15); // Делаем белый фон
    // Цикл рисования
    while x<>0 do begin
        // Отрисовываем интрерфейс
        for i:=0 to 15 do begin
            if i<10 then
                gotoxy(1+i, 24);
            if i>=10 then begin
                debug:=i*2;
                gotoxy(1+debug-10, 24);
            end;
            textbackground(i);
            textcolor(15-i);
            write(i);
        end;
        gotoxy(1, 25);
        write('> ');
        read(x, y, color);
        if x>=100 then begin
           setbackground(color);
        end;
        if x<100 then begin
            gotoxy(x, y);
            textcolor(color);
            write('█');
        end;
    end;
end.