program aufg3;
const
    min = 10;
    max = 20;
    pi = 3.14;
    minuspi = -pi;
var
    wahr:boolean;
    factor:real;
    sin:real;
    i:integer;
begin
    for i := min to max do
    begin
        write('i=', i);            
        write('   ');            
        wahr := true;
        sin  := 10;
        while wahr do
        begin
            write('while ');            
            factor := sin / pi;
	    if (factor > i) then wahr := false
                            else  sin := sqr(sin);
        end;
        writeln('');
    end;
    writeln('Der Faktor ist ', factor);
    writeln(pi);
    writeln(minuspi);
end.
