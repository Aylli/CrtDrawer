program draw;
uses Crt;
var x, y, color: integer; // Координаты, цвет пикселя, фона
    i, j, debug: integer; // Инкемент, дебаг
    picture: array[1..80, 1..25] of integer; // Картинка
    
// Функции
procedure SetBackground(color: integer); // Установка фона
var i, j: integer;
begin
    textbackground(color); // Задаём цвет фона
    for i:=2 to 79 do
        for j:=2 to 24 do begin
            gotoxy(i, j);
            write(' ');
        end;
end;
procedure DrawPicture(); // Отрисовка картинки
var i, j: integer;
begin
    for i:=1 to 80 do
        for j:=1 to 25 do begin
            if picture[i][j]<>16 then begin
                gotoxy(i, j);
                textcolor(picture[i][j]);
                write('█');
            end;
        end;
end;
begin
    // Обнуляем переменные
    for i:=1 to 80 do
        for j:=1 to 25 do begin
            picture[i][j]:=16;
        end;
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
        // Алгоритм программы
        gotoxy(1, 25); // Перемещаемся вниз экрана
        textbackground(0);
        textcolor(15);
        write('> ');
        read(x, y, color); // Принимаем комманды пользователя
        if ((x>78) and (x<>100)) or (y>23) then
            write('Ошибка! Выберите другие координаты!')
        else begin
            if x>=100 then begin // Если x>=100 меняем фон
               SetBackground(color);
            end;
            if x<100 then begin // Если x<100 рисуем в указанной точке
                picture[x+1][y+1]:=color;
            end;
        end;
        DrawPicture();
    end;
end.