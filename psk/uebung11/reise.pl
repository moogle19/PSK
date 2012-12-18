<<<<<<< local
<<<<<<< local
verbindung(rheine, osnabrück, 6.55, 7.32, 712).
verbindung(osnabrück, minden, 7.34, 8.15, 712).
verbindung(minden, hannover, 8.22, 9, 712).
verbindung(münster, osnabrück, 6.42, 7.15, 522).
verbindung(osnabrück, bremen, 7.18, 8.25, 522).
verbindung(rheine, papenburg, 7.2, 8, 876).
verbindung(papenburg, bremen, 8.03, 8.23, 876).
verbindung(bremen, hannover, 8.24, 9.04, 120).
verbindung(münster, herford, 6.58, 8.12, 338).
verbindung(herford, hannover, 8.15, 8.55, 338).
verbindung(herford, hannover, 8.15, 8.55, 338).


früher(X, Y) :- X =< Y.
direktverbindung(X, Y, Z) :- verbindung(X, Y, A, _, _), früher(Z, A).
zwischenreise(X, Y, Z) :- verbindung(X, A, B, C, D), früher(Z, B), reise(A, Y, C).
reise(X, Y, Z) :- direktverbindung(X, Y, Z); zwischenreise(X, Y, Z).
=======
direktverbindung(X, Y, Z) :- verbindung(X, Y, A, _, C), passt(Z, A).
zwischenreise(X, Y, Z)    :- verbindung(X, A, B, C, D), passt(Z, B),
=======
direktverbindung(X, Y, Z) :- verbindung(X, Y, A, _, _), passt(Z, A).
zwischenreise(X, Y, Z)    :- verbindung(X, A, B, C, _), passt(Z, B),
>>>>>>> other
                             reise(A, Y, C).
reise(X, Y, Z)            :- direktverbindung(X, Y, Z);
                             zwischenreise(X, Y, Z).
passt(X, Y)              :- X =< Y.
>>>>>>> other
