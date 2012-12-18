program aufg1;
type
    typeA = record
        m : integer;
    end;
    typeB = record
        m : integer;
    end;
var
    A : typeA;
    B : typeB;
    C : typeA;
begin
    B.m := 6;
    A := B; {Fehler: keine strukturelle Typgleichheit }
    C.m := -2; {kein Fehler: namentliche Typengleichheit}
end.
