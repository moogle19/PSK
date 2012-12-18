:- discontiguous([wann/2, wannnicht/2, ist/2, istnicht/2, wo/2, wonicht/2]).

% 1.
ist(bt, bankräuber).
wann(bt, 1850). % vlt noch negation des alternativfalls
wann(bt, 1851). % vlt noch negation des alternativfalls

% 2.
wann(mörder, 1848).

% 3.
wann(pf, _X). % überflüssig?
wann(as, X) :- wann(pf, X - 1).

% 4.
wann(gangster, 1851).
wo(gangster, saloon).

% 5.
wonicht(X, scheune) :- ist(X, geldwäscher).

% 6.
istnicht(as, geldfälscher).
istnicht(as, hochstapler).

% 7.
wann(sf, X) :- X > 1848.
wonicht(sf, bordell).

% 8.
wo(eisenbahnräuber, bahnsteig).
wannnicht(eisenbahnräuber, 1849).

% 9.
wo(dc, hotelzimmer).

verhaftung(X, Y, Z) :- wann(Z, X).
