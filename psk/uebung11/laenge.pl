laenge([], 0).
laenge([_|Rest], Lang) :- laenge(Rest, RLang), Lang is RLang + 1.
