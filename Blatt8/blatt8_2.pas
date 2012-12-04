program blatt8;

type
    arten = (EFH, MFH, RH, REH, DHH, ETW);
    merkmale = (GaesteWC, Garage, Terrasse, Garten, Balkon, Kamin, Wintergarten, Einbaukueche, Parkett);
    vermakel=RECORD
        vname: PACKED ARRAY[1..20] OF CHAR;
        plz: 10000..99999;
        art: arten;
        zimmer: integer;
        baujahr: 1000..2012;
        kaufpreis: integer;
        ausstattung: SET OF merkmale;
    END;
var
    obj1: vermakel;
    z: merkmale;
begin
    obj1.vname := 'Horst';
    obj1.plz := 49080;
    obj1.art := EFH;
    obj1.zimmer := 100;
    obj1.baujahr := 1998;
    obj1.kaufpreis := 100;
    obj1.ausstattung := [GaesteWC] + [Garten..Kamin];
    
    write(obj1.vname,' ', obj1.plz,' ', obj1.art,' ', obj1.zimmer,' ', obj1.baujahr,' ', obj1.kaufpreis, ' ');
    for z in obj1.ausstattung do
        write(z, ' ');
        
    writeln();
end.