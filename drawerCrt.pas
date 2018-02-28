program draw;
uses Crt;
var x, y, color: integer; // Координаты, цвет пикселя, фона
    i, debug: integer; // Инкемент, дебаг
procedure setbackground(color: integer);
var i, j: integer;
begin
    textbackground(color); // Задаём цвет фона
    for i:=2 to 79 do
        for j:=2 to 24 do begin
            gotoxy(i, j);
            write(' ');
        end;
end;
begin
    x:=1;
    y:=1;
    textbackground(15); // Делаем белый фон
    clrscr; // Заливаем белым
    // Цикл рисования
    while x<>0 do begin
        // Отрисовываем интрерфейс
        for i:=0 to 15 do begin
            if i<10 then
                gotoxy(2+i, 24);
            if i>=10 then begin
                debug:=i*2;
                gotoxy(2+debug-10, 24);
            end;
            textbackground(i);
            textcolor(15-i);
            write(i);
        end;
        // Рисуем рамки
        for i:=1 to 80 do begin
            textcolor(0);
            gotoxy(i, 1); // Верхняя рамка
            write('█');
            gotoxy(i, 25); // Нижняя рамка
            write('█');
        end;
        for i:=2 to 24 do begin
            gotoxy(1, i); // Верхняя рамка
            write('█');
            gotoxy(80, i); // Нижняя рамка
            write('█');
        end;
        
        
        gotoxy(1, 25); // Перемещаемся вниз экрана
        textbackground(0);
        textcolor(15);
        write('> ');
        read(x, y, color); // Принимаем комманды пользователя
        if ((x>78) and (x<>100)) or (y>23) then
            write('Ошибка! Выберите другие координаты!')
        else begin
            if x>=100 then begin // Если x>=100 меняем фон
               setbackground(color);
            end;
            if x<100 then begin // Если x<100 рисуем в указанной точке
                gotoxy(x+1, y+1);
                textcolor(color);
                write('█');
            end;
        end;
    end;
end.