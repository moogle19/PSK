% Aufgabe 1

mypraefix([], _).
mypraefix([H|T], [H|U]) :- mypraefix(T, U).
	
	
% Aufgabe 2

mycount(_, [], 0).
mycount(H, [H|T], N) :-	mycount(H, T, M), N is M + 1.
mycount(X, [H|T], N) :-	mycount(X, T, N), H \= X.


% Aufgabe 3

nachbar(_, _, []).
nachbar(H, X, [H|T]) :- T = [Y|Z], Y = X.
nachbar(H, X, [X|T]) :- T = [Y|Z], Y = H.
nachbar(H, X, [H|T]) :- T = [Y|Z], Y \= X, nachbar(H, X, T).
nachbar(H, X, [U|T]) :- nachbar(H, X, T), H \= U, T \= [].


% Aufgabe 4

karte(A, B, C, D, E, F) :-
	neben(A, B), neben(A, C), neben(A, E), neben(A, D),
	neben(B, E), neben(B, C), neben(B, D),
	neben(C, D), neben(C, F),
	neben(D, F),
	neben(E, B).
	
farbe(rot).
farbe(gelb).
farbe(gruen).
farbe(blau).

neben(X, Y) :- farbe(X), farbe(Y), X \= Y.

% 95 Moeglichkeiten
