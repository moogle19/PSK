% verhaftet(J, O, N, T) :- .

% 1. Den Bankräuber Bill Tenheven verhaftete Silverman entweder 1850 oder 1851.
verhaftet(J, _, bt, bankraub) :- J = 1850.
verhaftet(J, _, bt, bankraub) :- J = 1851.

% 2. 1848 legte der Sheriff einem Mörder das blutige Handwerk.
verhaftet(1848, _, N, mord).

% 3. Andrew Smith wurde ein Jahr nach Pablo Fuentes aufgegriffen.
verhaftet(J, _, as, _) :- verhaftet(X, _, pf, _), J = X + 1.

% 4. Den im Jahr 1851 verhafteten Gangster stellte John Silverman in einem Saloon.
verhaftet(1851, saloon, N, _).

% 5. Der Geldfälscher wurde nicht in einer Scheune festgenommen.
verhaftet(_, O, N, geldfälschung) :- not(O = scheune).

% 6. Bei Andrew Smith handelt es sich weder um den Geldfälscher noch um den Hochstapler.
verhaftet(_, _, as, T) :- not(T = geldfälschung), not(T = hochstapelei).

% 7. Sam Fisher wurde irgendwann nach 1848 dingfest gemacht. Ihn stellte der Gesetzeshüter nicht in einem Bordell.
verhaftet(J, O, sf, _) :- J > 1848, not(O = bordell).

% 8. Der auf dem Bahnsteig verhaftete Eisenbahnräuber ging dem Sheriff nicht 1849 ins Netz.
verhaftet(J, bahnsteig, N, eisenbahnraub) :- not(J = 1849).

% 9. Dean Clayton wurde in einem Hotelzimmer überrascht und vom Sheriff nach wildem Schusswechsel gestellt.
verhaftet(_, hotelzimmer, dc, _).
