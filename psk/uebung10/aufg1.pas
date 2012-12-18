program kartei;
type
   kraftstoffart	= (Gas, Diesel, Benzin, Elektro, Hybrid);
   gebrauchtwagenrecord	= record
			     marke	    : string;
			     modell	    : string;
			     unfall	    : boolean;
			     kraftstoff	    : kraftstoffart;
			     erstzulassung  : integer;
			     kilometerstand : longint;
			     preis	    : longint;
			     plz	    : longint;
			  end;		    
   
   tNodePtr		= ^tNode;
   tNode		= record
			      gebrauchtwagen : gebrauchtwagenrecord;
			      nodePtr	     : tNodePtr;
			  end;

var
   head	  : tNodePtr;
   pos	  : tNodePtr;
   option : char;


procedure initLinkedList;
begin
   head := nil;
   pos := head;
end; { initLinkedList }


function endpos:boolean;
begin
   if(pos^.nodePtr = nil) then
   begin
      endpos := true;
   end else
   begin
      endpos := false;
   end;
end; { endpos }


procedure reset;
begin
   pos := head;
end; { reset }


procedure advance;
begin
   if(endpos = true) then
   begin
      writeln('Sie sind am Ende der Liste angekommen, es geht nicht weiter.');
   end else
   begin
      pos := pos^.nodePtr;
   end;
end; { advance }


function empty:boolean;
begin
   if(head = nil) then
   begin
      empty := true;
   end else
   begin
      empty := false;
   end;
end; { empty }


procedure addGebrauchtwagen(gebrauchtwagen :gebrauchtwagenrecord);
var
   node	   : tNode;
   tmpNode : tNode;
   done	   : boolean;
   
begin
   done := false;
   node.gebrauchtwagen := gebrauchtwagen;
   new(node.nodePtr);
   if (empty) then {falls die Liste noch leer ist einfach einfuegen}
   begin
      new(head);
      head^ := node;
      done := true;
   end;
   if not done then {falls die Liste nicht leer ist}
   begin
      {an die entsprechende Stelle vorruecken und einfuegen}
      reset;
      while (gebrauchtwagen.erstzulassung
	     < pos^.nodePtr^.gebrauchtwagen.erstzulassung)
	 do
      begin
	 if(not endpos) then advance;
      end;
      while((pos^.nodePtr^.gebrauchtwagen.erstzulassung
	    = gebrauchtwagen.erstzulassung)
	    and
	    (gebrauchtwagen.kilometerstand >
	    pos^.nodePtr^.gebrauchtwagen.kilometerstand)) do
      begin
	 if(not endpos) then advance;
      end;
      {Sonderfall: wir muessen VOR dem head einfuegen}
      if((pos = head) and
	 ((gebrauchtwagen.erstzulassung > pos^.gebrauchtwagen.erstzulassung) or
	 ((pos^.gebrauchtwagen.erstzulassung = gebrauchtwagen.erstzulassung)
	    and
	    (gebrauchtwagen.kilometerstand <
	    pos^.gebrauchtwagen.kilometerstand))))then
      begin
	 tmpNode := head^;
	 node.nodePtr^ := tmpNode;
	 head^ := node;
      end else
      {hinter dem aktuellen Element (pos) einfuegen}
      begin
	 tmpNode := pos^.nodePtr^;
	 pos^.nodePtr^ := node;
	 node.nodePtr^ := tmpNode;
      end;
   end;
end; { addGebrauchtwagen }


procedure deleteCar(auto : gebrauchtwagenrecord);
begin
   if(not(empty)) then
   begin
      reset;
      while (not(endpos)) do
      begin
	 {Sonderfall: head ist zu loeschen}
	 if((head^.gebrauchtwagen.marke = auto.marke) and
	    (head^.gebrauchtwagen.modell = auto.modell) and
	    (head^.gebrauchtwagen.plz = auto.plz)) then
	 begin
	    if(head^.nodePtr^.nodePtr = nil) then
	    begin
	       {Sonderfall: bei einelementiger Liste}
	       write('erstes IF');
	       head := nil;
	       pos := head;
	       break;
	    end else
	    begin
	       writeln('zweites IF');
	       head := pos^.nodePtr;
	       reset;
	       continue;
	    end;
	    {ein Element aus dem Rest der Liste entfernen}
	 end else if((pos^.nodePtr^.gebrauchtwagen.marke = auto.marke) and
		     (pos^.nodePtr^.gebrauchtwagen.modell = auto.modell) and
		     (pos^.nodePtr^.gebrauchtwagen.plz = auto.plz)) then
	    
	 begin
	    pos^.nodePtr := pos^.nodePtr^.nodePtr;
	    continue;
	 end;
	 advance;
      end;
   end;
end; { deleteCar }

function carToDelete:gebrauchtwagenrecord;
var
   gebrauchtwagen : gebrauchtwagenrecord;
   
begin
   writeln('Zu loeschendes Auto');

   writeln('======================');

   write('Marke: ');
   readln(gebrauchtwagen.marke);

   write('Modell: ');
   readln(gebrauchtwagen.modell);
   
   gebrauchtwagen.unfall := false;
   gebrauchtwagen.kraftstoff := gas;
   gebrauchtwagen.erstzulassung := 0;
   gebrauchtwagen.kilometerstand := 0;
   gebrauchtwagen.preis := 0;

   repeat
      write('PLZ des Wohnorts des Verkäufers: ');
      readln(gebrauchtwagen.plz);
   until ((gebrauchtwagen.plz >= 0)
          and (gebrauchtwagen.plz <= 99999));
   {return}
   carToDelete := gebrauchtwagen;
end; { carToDelete }


function gebrauchtwagenHinzufuegen:gebrauchtwagenrecord;
var
   gebrauchtwagen : gebrauchtwagenrecord;
   wronginput	  : boolean;
   key		  : char;

begin
   writeln('Neuer Gebrauchtwagen-Eintrag');

   writeln('======================');

   write('Marke: ');
   readln(gebrauchtwagen.marke);

   write('Modell: ');
   readln(gebrauchtwagen.modell);
   
   repeat
      write('Unfallwagen? (j)a, (n)ein: ');
      readln(key);
      wronginput := false;
      Case key of
        'j' : gebrauchtwagen.unfall := true;
        'n' : gebrauchtwagen.unfall := false;
      else
        wronginput := true;
      end;
   until (not(wronginput));

   repeat
      write('Kraftstoffart (g)as, (d)iesel, (b)enzin, (e)lektro, (h)ybrid: ');
      readln(key);
      wronginput := false;
      Case key of
         'g' : gebrauchtwagen.kraftstoff := Gas;
         'd' : gebrauchtwagen.kraftstoff := Diesel;
         'b' : gebrauchtwagen.kraftstoff := Benzin;
         'e' : gebrauchtwagen.kraftstoff := Elektro;
         'h' : gebrauchtwagen.kraftstoff := Hybrid;
      else
         wronginput := true;
      end;
   until (not(wronginput));

   writeln('Kraftstoffart ', gebrauchtwagen.kraftstoff);

   repeat
      write('Jahr der Erstzulassung(ab 1980): ');
      readln(gebrauchtwagen.erstzulassung);
   until ((gebrauchtwagen.erstzulassung >= 1980) 
          and (gebrauchtwagen.erstzulassung <= 2011));

   repeat
      write('Kilometerstand: ');
      readln(gebrauchtwagen.kilometerstand);
   until (gebrauchtwagen.kilometerstand >= 0);

   repeat
      write('Preis: ');
      readln(gebrauchtwagen.preis);
   until (gebrauchtwagen.preis >= 0);

   repeat
      write('PLZ des Wohnorts des Verkäufers: ');
      readln(gebrauchtwagen.plz);
   until ((gebrauchtwagen.plz >= 0)
          and (gebrauchtwagen.plz <= 99999));
   gebrauchtwagenHinzufuegen := gebrauchtwagen;
end; { gebrauchtwagenHinzufuegen }


procedure ausgabeAll;  
begin
   if (not(empty)) then
   begin
      reset;
      while (not(endpos)) do
      begin
	 writeln();
	 writeln('Gebrauchtwagen-Eintrag');
	 writeln('======================');
	 write(pos^.gebrauchtwagen.marke);
	 write(' - ');
	 writeln(pos^.gebrauchtwagen.modell);
	 if(pos^.gebrauchtwagen.unfall) then
	 begin
	    writeln('Unfallwagen.');
	 end;
	 
	 write(pos^.gebrauchtwagen.kraftstoff, '-Fahrzeug Baujahr ');
	 writeln(pos^.gebrauchtwagen.erstzulassung);
	 write(pos^.gebrauchtwagen.kilometerstand, ' km gelaufen für ');
	 write(pos^.gebrauchtwagen.preis);
	 writeln(' EUR aus PLZ ', pos^.gebrauchtwagen.plz);
	 advance;
      end;
   end;
end; { ausgabeAll }


procedure ausgabeMarke(marke : string);
begin
   if(not(empty)) then
   begin
      reset;
      while(not(endpos)) do
      begin
	 if(pos^.gebrauchtwagen.marke = marke) then
	 begin
	    writeln();
	    writeln('Gebrauchtwagen-Eintrag');
	    writeln('======================');
	    write(pos^.gebrauchtwagen.marke);
	    write(' - ');
	    writeln(pos^.gebrauchtwagen.modell);
	    if(pos^.gebrauchtwagen.unfall) then
	    begin
	       writeln('Unfallwagen.');
	    end;
	    
	    write(pos^.gebrauchtwagen.kraftstoff, '-Fahrzeug Baujahr ');
	    writeln(pos^.gebrauchtwagen.erstzulassung);
	    write(pos^.gebrauchtwagen.kilometerstand, ' km gelaufen für ');
	    write(pos^.gebrauchtwagen.preis);
	    writeln(' EUR aus PLZ ', pos^.gebrauchtwagen.plz);	 
	 end;
	 advance;
      end;
   end;
end; { ausgabeMarke }


procedure menue;
begin
   writeln('');
   writeln('============= HAUPTMENUE =============');
   writeln('Bitte wählen Sie eine der folgenden Optionen:');
   writeln('(1) Neuen Wagen eintragen.');
   writeln('(2) Alle Wagen ausgeben.');
   writeln('(3) Alle Wagen einer bestimmten Marke ausgeben.');
   writeln('(4) Wagen loeschen.');
   writeln('(5) Programm beenden');
end; { menue }


function readMarke:string;
var
   marke : string;
begin
   writeln('Bitte geben Sie die Marke an, nach der Sie suchen moechten: ');
   readln(marke);
   readMarke:=marke;
end; { readMarke }


{***** MAIN ******}
begin
   initLinkedList;
   repeat
      menue;   
      readln(option);
      Case option of
	'1' : addGebrauchtwagen(gebrauchtwagenHinzufuegen);
	'2' : ausgabeAll;
	'3' : ausgabeMarke(readMarke);
	'4' : deleteCar(carToDelete);
      end;
   until (option = '5');
end.
