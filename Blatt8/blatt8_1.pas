program blatt8;

type
    arten = (EFH, MFH, RH, REH, DHH, ETW);
    vermakel=RECORD
        vname: PACKED ARRAY[1..20] OF CHAR;
        plz: 10000..99999;
        art: arten;
        zimmer: integer;
        baujahr: 1000..2012;
        kaufpreis: integer;
    END;
var
    obj1: vermakel;
begin
    obj1.vname := 'Horst';
    obj1.plz := 49080;
    obj1.art := EFH;
    obj1.zimmer := 100;
    obj1.baujahr := 1998;
    obj1.kaufpreis := 100;
    
    writeln(obj1.vname,' ', obj1.plz,' ', obj1.art,' ', obj1.zimmer,' ', obj1.baujahr,' ', obj1.kaufpreis);
    
end.