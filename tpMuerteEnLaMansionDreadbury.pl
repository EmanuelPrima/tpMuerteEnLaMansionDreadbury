% viveEnMansion(Alguien)
viveEnMansion(agatha).
viveEnMansion(mayordomo).
viveEnMansion(charles).

% odiaA(Odiador, Odiado)
odiaA(agatha, Alguien) :-
    viveEnMansion(Alguien),
    Alguien \= mayordomo.

odiaA(charles, Alguien) :-
    viveEnMansion(Alguien),
    not(odiaA(agatha, Alguien)).

odiaA(mayordomo, Alguien) :-
    odiaA(agatha, Alguien).

% esMasRicoQue(UnaPersona, OtraPersona)
esMasRicoQue(Alguien, agatha) :-
    viveEnMansion(Alguien),
    not(odiaA(Alguien, mayordomo)),    
    Alguien \= agatha.

mataA(Asesino, Victima) :-
    viveEnMansion(Asesino),
    odiaA(Asesino, Victima),
    not(esMasRicoQue(Asesino, Victima)).

/*
|-------- Punto 1 --------|
- El programa debe resolver el problema de quién mató a la tía Agatha.
?- mataA(Asesino, agatha).
Asesino = agatha ;
false.

|-------- Punto 2 --------|
- Si existe alguien que odie a milhouse.
?- odiaA(_, milhouse).
false.

- A quién odia charles.
?- odiaA(charles, Odiado).
Odiado = mayordomo ;
false.

- El nombre de quien odia a tía Ágatha.
?- odiaA(Odiador, agatha).
Odiador = agatha ;
Odiador = mayordomo.

- Todos los odiadores y sus odiados.
?- odiaA(Odiador, Odiado).
Odiador = Odiado, Odiado = agatha ;
Odiador = agatha,
Odiado = charles ;
Odiador = charles,
Odiado = mayordomo ;
Odiador = mayordomo,
Odiado = agatha ;
Odiador = mayordomo,
Odiado = charles.

- Si es cierto que el mayordomo odia a alguien.
?- odiaA(mayordomo, _).
true .
*/