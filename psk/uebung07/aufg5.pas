program aufg3();
const
    min=20; max=10;
    grad1=7.5e; grad2=+2.5e+2;
    minuspi=-pi;
    pi=3.14;
    ja=false;
var
    min:Integer;
    zeichen:char;
    wahr:bool;
    faktor, sin:real;
begin
    for i=min to max do
    begin
        wahr := ja; sin := 10;
        while wahr do
            factor := sin DIV pi;
            if (factor > min) then wahr := false;
                              else sin := sqr(sin);
    end;
    writeln('faktor ist ',factor);
    writeln(pi);writeln(minuspi);
end;
