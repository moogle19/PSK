{Aufgabe 9.2}
{Kevin Seidel & Valentin Bruder}

program kartei;


type 
    objektarten = (EFH, MFH, RH, REH, DHH, ETW);
    merkmale = (GaesteWC, Garage, Carport, Terrasse, Garten, Balkon, Kamin, Wintergarten, Einbaukueche, Parkett);
    merkmalliste =  SET OF merkmale;

    immobilienrecord = record
        verkaeufer : string;
	    plz : longint;
	    objektart : objektarten;
	    zimmer : integer;
	    ausstattung : merkmalliste;
	    bj : integer;
	    preis : longint;
		vhb : boolean;
    end;
		
var
	objekte : array[1..100] of immobilienrecord;
	i : integer;
	option : char;

{1 - Immobilie hinzufuegen }	
function immobilieHinzufuegen:immobilienrecord;
	var
	   immobilie  : immobilienrecord;
	   wronginput : boolean;
	   artIn	  : char;
	   merkmalIn  : string;
	   merkmalAll : merkmalliste;
       s : merkmale;
		
	begin
	   merkmalAll := [GaesteWC, Garage, Carport, Terrasse, Garten, Balkon, Kamin, Wintergarten, Einbaukueche, Parkett];

	   writeln('___Eintrag___');

	   write('Verkaeufer: ');
	   readln(immobilie.verkaeufer);

	   repeat
		  write('PLZ des Lageortes: ');
		  readln(immobilie.plz);
	   until ((immobilie.plz >= 1001) and (immobilie.plz <= 90012));
	   
	   repeat
		  write('Art des Objekts (1: EFH, 2: MFH, 3: RH, 4: REH, 5: DHH, 6: ETW): ');
		  readln(artIn);
		  wronginput := false;
		  Case artIn of
			 '1' : immobilie.objektart := EFH;
			 '2' : immobilie.objektart := MFH;
			 '3' : immobilie.objektart := RH;
			 '4' : immobilie.objektart := REH;
			 '5' : immobilie.objektart := DHH;
			 '6' : immobilie.objektart := ETW;
		  else
			 wronginput := true;
		  end;
	   until (not(wronginput));
	   writeln('Objektart ', immobilie.objektart);

	   repeat
		  write('Zimmeranzahl: ');
		  readln(immobilie.zimmer);
	   until (immobilie.zimmer > 0);
		
	   immobilie.ausstattung := [];
	   repeat
		  write('Merkmale des Objekts (0: GaesteWC, 1: Garage, 2: Carport, 3: Terrasse, 4: Garten, 5: Balkon, 6: Kamin, 7: Wintergarten, 8: Einbaukueche, 9: Parkett): ');
		  readln(merkmalIn);
		  wronginput := false;
		  Case merkmalIn of
			 '0' : immobilie.ausstattung := immobilie.ausstattung + [GaesteWC];
			 '1' : immobilie.ausstattung := immobilie.ausstattung + [Garage];
			 '2' : immobilie.ausstattung := immobilie.ausstattung + [Carport];
			 '3' : immobilie.ausstattung := immobilie.ausstattung + [Terrasse];
			 '4' : immobilie.ausstattung := immobilie.ausstattung + [Garten];
			 '5' : immobilie.ausstattung := immobilie.ausstattung + [Balkon];
			 '6' : immobilie.ausstattung := immobilie.ausstattung + [Kamin];
			 '7' : immobilie.ausstattung := immobilie.ausstattung + [Wintergarten];
			 '8' : immobilie.ausstattung := immobilie.ausstattung + [Einbaukueche];
			 '9' : immobilie.ausstattung := immobilie.ausstattung + [Parkett];
		  else
			wronginput := true;
		  end;
	   until (wronginput);
	   
	   write('Ausstattung ');
       for s := GaesteWC to Parkett do
           if s in immobilie.ausstattung then
           begin
               write(s, ', ');
           end;
	   
		  
		   writeln();
	   
	   repeat
		  write('Baujahr: ');
		  readln(immobilie.bj);
	   until ((immobilie.bj >= 1400) 
			  and (immobilie.bj <= 2012));

	   repeat
		  write('Kaufpreis: ');
		  readln(immobilie.preis);
	   until (immobilie.preis >= 0);
	   
	   repeat
		  write('Preis verhandelbar? (j/n): ');
		  readln(artIn);
		  wronginput := false;
		  case artIn of
			'j' : immobilie.vhb := true;
			'n' : immobilie.vhb := false;
		  else
			wronginput := true;
		  end;    
	   until (not(wronginput)); 

	   immobilieHinzufuegen := immobilie;
end;


{Augabe der Immobiliendaten}
procedure ausgabe(j : integer);
	var
		k : integer;
        s : merkmale;
	begin
		writeln('');
		writeln(j,'. Immobilie');
		writeln('Verkaeufer: ', objekte[j].verkaeufer); 
		if (objekte[j].plz < 10000) then
			begin
				writeln(objekte[j].objektart, ' mit ', objekte[j].zimmer, ' Zimmern in 0', objekte[j].plz);
			end
		else begin
			writeln(objekte[j].objektart, ' mit ', objekte[j].zimmer, ' Zimmern in ', objekte[j].plz);	
		end;
		writeln('Baujahr: ', objekte[j].bj);
		if (objekte[j].vhb) then
			begin
				writeln('Preis: ', objekte[j].preis, ' Euro - Verhandelbar');
			end
		else begin
			writeln('Preis: ', objekte[j].preis, ' Euro - nicht Verhandelbar');	
		end;
		write('Ausstattung: ');
        	
            
    
        for s := GaesteWC to Parkett do
            if s in objekte[j].ausstattung then
            begin
                write(s, ', ');
            end;
        writeln();
	    
end;

{2 - Ausgabe aller Immobilien}
procedure ausgabeAll;
	var
		j : integer;
	begin
	    for j := 1 to i-1 do
			ausgabe(j);
end;
		

{3 - Ausgabe aller Immobilien in bestimmter Lage}
procedure ausgabeLage;
	var
		j : integer;
		range : integer;
		plz : longint;
	begin
		repeat
		  write('PLZ des gewuenschten Lageortes: ');
		  readln(plz);
	    until ((plz >= 1001) and (plz <= 90012));
		
		range := plz mod 100;
	    for j := 1 to i-1 do
			if ((objekte[j].plz >= (plz-range)) and (objekte[j].plz <= (plz + 99 - range))) then
				begin
					ausgabe(j);
			end;
end;

{ Menu }
procedure menu;
	begin
	   writeln('');
	   writeln('Menu');
	   writeln('(1) Neue Immobilie eintragen');
	   writeln('(2) Alle Immobilien ausgeben');
	   writeln('(3) Immobilien in bestimmter Lage anzeigen');   
	   writeln('(4) Programm beenden');
end;


function readPLZ:longint;
	var
	   plz : longint;
	begin
	   repeat
		  write('Bitte geben Sie die Lage (PLZ) an, in der sie suchen moechten: ');
		  readln(plz);
	   until ((plz >= 1001) and (plz <= 90012));
end;


{main}
begin
    i := 1;
    repeat
		menu;   
		readln(option);
		Case option of
			'1' :
				begin
					if(i <= 100) then
						begin
							objekte[i] := immobilieHinzufuegen;
							i := i + 1;
						end 
					else begin
						write('Sie koennen keine neuen Immobilien mehr eintragen.');
					end;
				end;
			'2' : ausgabeAll;
			'3' : ausgabeLage;
      end;
   until (option = '4');
end.


	
	
	




