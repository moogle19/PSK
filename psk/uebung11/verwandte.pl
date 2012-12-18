w(elfriede).
w(else).
w(anna).
w(ute).
w(eva).
w(susanne).
w(ellen).
w(susi).
w(gabi).
w(heike).
w(anne).

m(otto).
m(anton).
m(gustav).
m(bernhard).
m(heinz).
m(walter).
m(frank).
m(bernd).
m(holger).
m(oliver).
m(klaus).
m(torben).

vater(frank, torben).
vater(otto, anton).
vater(otto, else).
vater(otto, bernhard).
vater(gustav, heinz).
vater(gustav, walter).
vater(bernhard, susanne).
vater(bernhard, ellen).
vater(heinz, bernd).
vater(heinz, susi).
vater(walter, gabi).
vater(walter, holger).
vater(walter, oliver).
vater(frank, klaus).
vater(frank, anne).
vater(frank, torben).

mutter(elfriede, anton).
mutter(elfriede, else).
mutter(elfriede, bernhard).
mutter(else, heinz).
mutter(else, walter).
mutter(anna, susanne).
mutter(anna, ellen).
mutter(ute, bernd).
mutter(ute, susi).
mutter(eva, gabi).
mutter(eva, holger).
mutter(eva, oliver).
mutter(susanne, heike).
mutter(ellen, klaus).
mutter(ellen, anne).
mutter(ellen, torben).

grossvater(X, Y)  :- vater(X, Z), vater(Z, Y); 
                     vater(X, Z), mutter(Z, Y).
grossmutter(X, Y) :- mutter(X, Z), vater(Z, Y); 
                     mutter(X, Z), mutter(Z, Y).
schwester(X, Y)   :- w(X), mutter(Z, X), mutter(Z, Y), not(X = Y).
bruder(X, Y)      :- m(X), mutter(Z, X), mutter(Z, Y), not(X = Y).
tante(X, Y)       :- w(X), mutter(Z, Y), schwester(X,Z); 
                     w(X), vater(Z, Y), schwester(X,Z).
onkel(X, Y)       :- m(X), mutter(Z, Y), bruder(X, Z);
                     m(X), vater(Z, Y), bruder(X, Z).
cousine(X, Y)     :- w(X), tante(Z, Y), mutter(Z, X); 
                     w(X), onkel(Z, Y), vater(Z, X).
cousin(X, Y)      :- m(X), tante(Z, Y), mutter(Z, X); 
                     m(X), onkel(Z, Y), vater(Z, X).
