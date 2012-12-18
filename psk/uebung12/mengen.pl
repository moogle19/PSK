menge([]).
menge([H|R]) :- menge(R), not(member(H,R)).

gleich(M1,M2) :- menge(M1), menge(M2), permutation(M1,M2).

sublist([],_).
sublist([H|R],L) :- member(H,L), subset(R,L).

teilmenge(M1,M2):- menge(M1), menge(M2), sublist(M1,M2).

differenzmenge(D,[],D).
differenzmenge(M1,[H|R], D) :- delete(M1,H,L),!,differenzmenge(L,R,D).

differenz(M1,M2,D) :- menge(M1), menge(M2), menge(D), teilmenge(D,M1), 
                      differenzmenge(M1,M2,D). 

