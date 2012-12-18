links(A,B,[A|[B|_]]).
links(A,B,[_|R]):-links(A,B,R).

mysortiert([X]).
mysortiert([ [_, _, _, A] |[ [_, _, _, B] |Rest]]):- A =< B, mysortiert([[_, _, _, B]|Rest]).

query :-
X = [_, _, _, _, _],

(member([bt, bankräuber, _, 1850], X); member([bt, bankräuber, _, 1851], X)),
member([_, mörder, _, 1848], X),
links([pf,_,_,_], [as,_,_,_], X),
member([_, _, saloon, 1851], X),
(member([_, eisenbahnräuber, bahnsteig, J], X), J \== 1849),
member([dc, _, hotelzimmer, _], X),

member([_, W1, scheune, _], X), W1 \= geldfälscher,
member([_, geldfälscher, W2, _], X), W2 \= scheune,

not(member([as, geldfälscher, _, _], X)), not(member([as, hochstapler, _, _], X)),

member([sf, _, _, _], X),

write(X).