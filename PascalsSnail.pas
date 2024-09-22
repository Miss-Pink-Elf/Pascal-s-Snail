program PascalsSnail;
uses
   GraphABC;
const
   a = 100;
   b = 200;
   n = 150;
   w = 720;
   h = 640;
   x0 = w div 2;
   y0 = h div 2;
   CoorArrow1 = 20;
   CoorArrow2 = 7;
   indent1 = 1;
   indent10 = 10; 
var
   x, y, i: integer;
   t: real;
   
procedure GraphPoints(a, b, t: real; var x: integer; var y: integer);
begin
   x := round(a*cos(t)*cos(t) + b*cos(t));
   y := round(a*cos(t)*sin(t) + b*sin(t));
end;   
   
begin
   SetConsoleIO;
   Writeln('Параметрическое построение улитки Паскаля');
   SetWindowWidth(w);
   SetWindowHeight(h);
   Line(x0, 0, x0, 2*y0); //ось OX
   Line(0, y0, 2*x0, y0); //ось OY
   TextOut(x0 + indent1, y0 + indent1, 0);
   TextOut(w - indent10, y0 + indent1, 'x');
   Line(w, y0, w - CoorArrow1, y0 - CoorArrow2);
   Line(w, y0, w - CoorArrow1, y0 + CoorArrow2);
   TextOut(x0 + indent10, indent1, 'y');
   Line(x0, 0, x0 - CoorArrow2, CoorArrow1);
   Line(x0, 0, x0 + CoorArrow2, CoorArrow1);
   
   x := 0; 
   y := 0;
   t := 2*pi/n;
   GraphPoints(a, b, t, x, y);
   
   MoveTo(x + x0, y + y0);
   for i := 1 to n do begin 
      GraphPoints(a, b, t, x, y);
      t := t + 2*pi/n;
      Lineto(x + x0, y + y0);
   end;
   
   GraphPoints(a, b, t, x, y);
   Lineto(x0 + x, y0 + y);
   Writeln(' ');
end.