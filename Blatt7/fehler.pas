program aufg5; //identifier missing (syntax)

const min=4; {point has to be removed because i is integer (compile)}

      max = 10; {min and max have to be switched (no real error (runtime))}

var   wahr:boolean; {boolean not bool (lexical)}

      i,j,temp:integer; {j was not declared (semantic)}

      c:char; 

begin 

c:='*'; 

for i:=min to max do 

        begin 

        temp:= i; 
        wahr:= true; {wahr must be initialized (semantic)}

        write(i ,' = '); 

        for j:=2 to i do {:= (syntax)}

                begin 

                    while (temp mod j = 0) and (temp <> 1)=wahr do {!= in pascal <> (lexical)}

                        begin 

                            write( j,' ',c,' '); {apostrophes need to be removed (no error) but wrong output}

                        temp:= temp div j; 

                        end; 

                end;

        writeln(1) 

        end;
        
end. {point instead of semicolon (lexical)}