% 1. Den Bankräuber Bill Tenheven verhaftete Silverman entweder 1850 oder 1851.
rule1(X) :- member([bt, bankräuber, _, 1850], X);
            member([bt, bankräuber, _, 1851], X).

% 2. 1848 legte der Sheriff einem Mörder das blutige Handwerk.
rule2(X) :- member([_, mörder, _, 1848], X).

% 3. Andrew Smith wurde ein Jahr nach Pablo Fuentes aufgegriffen.
rule3(X) :- links([pf, _, _, _], [as, _, _, _], X).
%rule3(X) :- (member([pf, _, _, O], X), member([as, _, _, O+1], X)).

% 4. Den im Jahr 1851 verhafteten Gangster stellte John Silverman in einem Saloon.
rule4(X) :- member([_, _, saloon, 1851], X).

% 5. Der Geldfälscher wurde nicht in einer Scheune festgenommen.
rule5(X) :- not(member([_, geldfälscher, scheune, _], X)).

% 6. Bei Andrew Smith handelt es sich weder um den Geldfälscher noch um den Hochstapler.
rule6(X) :- not(member([as, geldfälscher, _, _], X)), not(member([as, hochstapler, _, _], X)).

% 7.1 Sam Fisher wurde irgendwann nach 1848 dingfest gemacht.
rule7(X) :- member([sf, _, _, B], X), B > 1848,
% 7.2 Ihn stellte der Gesetzeshüter nicht in einem Bordell.
            not(member([sf, _, bordell, _], X)).

% 8. Der auf dem Bahnsteig verhaftete Eisenbahnräuber ging dem Sheriff nicht 1849 ins Netz.
rule8(X) :- member([_, eisenbahnräuber, bahnsteig, J], X), J \== 1849.

% 9. Dean Clayton wurde in einem Hotelzimmer überrascht und vom Sheriff nach wildem Schusswechsel gestellt.
rule9(X) :- (member([dc, _, hotelzimmer, _], X)).

% Name, Tat, Ort, Jahr

links(A,B,[A|[B|_]]).
links(A,B,[_|R]):-links(A,B,R).

mysortiert([X]).
mysortiert([ [_, _, _, A] |[ [_, _, _, B] |Rest]]):- A =< B, mysortiert([[_, _, _, B]|Rest]).

query :- (X=[_, _, _, _]), rule1(X), rule2(X), rule3(X), rule4(X), rule5(X),
         rule6(X), rule7(X), rule8(X), rule9(X),
         %mysortiert(X),
         write(X).
