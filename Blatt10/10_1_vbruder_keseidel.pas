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

	tNodePtr = ^tNode;
    tNode = record
        immobilie : immobilienrecord;
        nodePtr        : tNodePtr;
    end;
						  
var
	objekte : array[1..100] of immobilienrecord;
	i : integer;
	option : char;
	head :tNodePtr;
	pos : tNodePtr;

{linked list procedures/functions}
procedure initLinkedList;
	begin
		head := nil;
		pos := head;
end;

function endpos:boolean;
	begin
		if(pos^.nodePtr = nil) then
			begin
				endpos := true;
			end
		else
			begin
				endpos := false;
		end;
end;

procedure resetList;
	begin
		pos := head;
end;

procedure advanceList;
	begin
	    if(endpos = true) then
		    begin
			    writeln('End of list.');
		    end
		else
	        begin
				pos := pos^.nodePtr;
	    end;
end;

function empty:boolean;
	begin
		if(head = nil) then
			begin
				empty := true;
			end
		else
			begin
				empty := false;
	    end;
end;

procedure addToList(immobilie : immobilienrecord);
	var
	   node    : tNode;
	   tmpNode : tNode;
	   done    : boolean;   
begin
	done := false;
    node.immobilie := immobilie;
    new(node.nodePtr);
    if (empty) then
	begin
		new(head);
		head^ := node;
		done := true;
	end;
    if not done then 
	begin
		resetList;
		while (immobilie.plz < pos^.nodePtr^.immobilie.plz) do
		begin
			if(not endpos) then advanceList;
		end;
		
		while((pos^.nodePtr^.immobilie.plz = immobilie.plz) and (immobilie.preis > pos^.nodePtr^.immobilie.preis)) do
		begin
			if(not endpos) then advanceList;
		end;
		{insert before head}
        if((pos = head) and ((immobilie.plz > pos^.immobilie.plz) or ((pos^.immobilie.plz = immobilie.plz) and (immobilie.preis < pos^.immobilie.preis))))then
		begin
			tmpNode := head^;
			node.nodePtr^ := tmpNode;
			head^ := node;
		end else
		{insert behind currend element}
		begin
			tmpNode := pos^.nodePtr^;
			pos^.nodePtr^ := node;
			node.nodePtr^ := tmpNode;
		end;
	end;
end;

procedure delFromList(objekt : immobilienrecord);
begin
    if (not(empty)) then
    begin
        resetList;
        while (not(endpos)) do
        begin
            {delete head}
            if((head^.immobilie.verkaeufer = objekt.verkaeufer) and
               (head^.immobilie.objektart = objekt.objektart) and
               (head^.immobilie.plz = objekt.plz)) then
            begin
				{only one element in list}
                if(head^.nodePtr^.nodePtr = nil) then
                begin
                    head := nil;
					pos := head;
					break;
				end else
				begin
					head := pos^.nodePtr;
					advanceList;
					continue;
				end;
			end else if((pos^.nodePtr^.immobilie.verkaeufer = objekt.verkaeufer) and
						(pos^.nodePtr^.immobilie.objektart = objekt.objektart) and
						(pos^.nodePtr^.immobilie.plz = objekt.plz)) then           
			begin
				pos^.nodePtr := pos^.nodePtr^.nodePtr;
				continue;
			end;
			advanceList;
		end;
	end;
end;

{4 - Immobilie entfernen}
function immobilieEntfernen:immobilienrecord;
	var
		immobilie : immobilienrecord;
		wronginput : boolean;
		artIn : char;
begin
	writeln('Zu loeschende Immobilie');
	write('Verkaeufer: ');
	readln(immobilie.verkaeufer);

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
   
	immobilie.vhb := false;
//	immobilie.merkmalliste := nil;
	immobilie.zimmer := 0;
	immobilie.bj := 2000;
	immobilie.preis := 0;   

	repeat
        write('PLZ der Immobilie: ');
        readln(immobilie.plz);
	until ((immobilie.plz >= 1001) and (immobilie.plz <= 90012));
    immobilieEntfernen := immobilie;
end;

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


{2 - Ausgabe aller Immobilien}
procedure ausgabeAll;
	var
		s : merkmale;
begin
	if (not(empty)) then
	begin
		resetList;
		while (not(endpos)) do
		begin
	        writeln();
            write('Verkaeufer: ');
            writeln(pos^.immobilie.verkaeufer);
            if (pos^.immobilie.plz < 10000) then
				begin
					writeln(pos^.immobilie.objektart, ' mit ', pos^.immobilie.zimmer, ' Zimmern in 0', pos^.immobilie.plz);
				end
			else begin
				writeln(pos^.immobilie.objektart, ' mit ', pos^.immobilie.zimmer, ' Zimmern in ', pos^.immobilie.plz);	
			end;
			writeln('Baujahr: ', pos^.immobilie.bj);
			if (pos^.immobilie.vhb) then
				begin
					writeln('Preis: ', pos^.immobilie.preis, ' Euro - Verhandelbar');
				end
			else begin
				writeln('Preis: ', pos^.immobilie.preis, ' Euro - nicht Verhandelbar');	
			end;
			write('Ausstattung: '); 
			for s := GaesteWC to Parkett do
				if s in pos^.immobilie.ausstattung then
				begin
					write(s, ', ');
				end;
			writeln();
			advanceList;
		end;
	end;
end;
		

{3 - Ausgabe aller Immobilien in bestimmter Lage}
procedure ausgabeLage(plz : longint);
	var
		range : integer;
		s : merkmale;
begin
   if(not(empty)) then
   begin
      resetList;
	  range := plz mod 100;
      while(not(endpos)) do
      begin
         if ((pos^.immobilie.plz >= (plz-range)) and (pos^.immobilie.plz <= (plz + 99 - range))) then
         begin
            writeln();
            write('Verkaeufer: ');
            writeln(pos^.immobilie.verkaeufer);
            if (pos^.immobilie.plz < 10000) then
				begin
					writeln(pos^.immobilie.objektart, ' mit ', pos^.immobilie.zimmer, ' Zimmern in 0', pos^.immobilie.plz);
				end
			else begin
				writeln(pos^.immobilie.objektart, ' mit ', pos^.immobilie.zimmer, ' Zimmern in ', pos^.immobilie.plz);	
			end;
			writeln('Baujahr: ', pos^.immobilie.bj);
			if (pos^.immobilie.vhb) then
				begin
					writeln('Preis: ', pos^.immobilie.preis, ' Euro - Verhandelbar');
				end
			else begin
				writeln('Preis: ', pos^.immobilie.preis, ' Euro - nicht Verhandelbar');	
			end;
			write('Ausstattung: '); 
			for s := GaesteWC to Parkett do
				if s in pos^.immobilie.ausstattung then
				begin
					write(s, ', ');
				end;
			writeln();			
         end;
         advanceList;
      end;
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
	   writeln('(4) Immobilie loeschen');
	   writeln('(5) Programm beenden');
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
			'1' : addToList(immobilieHinzufuegen);
			'2' : ausgabeAll;
			'3' : ausgabeLage(readPLZ);
			'4' : delFromList(immobilieEntfernen);
      end;
   until (option = '5');
end.


	
	
	



