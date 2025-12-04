% Las preguntas
malestar(X):-nl, write(X), write(' tiene malestar? [s/n]: '), read(R), R=s.
fiebre(X):-nl, write(X), write(' tiene fiebre? [s/n]: '), read(R), R=s.
dolor_art_mus(X):-nl,write(X), write(' tiene dolor muscular o en articulaciones?[s/n]: '), read(R), R=s.
rash(X):-nl, write(X), write(' tiene rash? [s/n]: '), read(R),R=s.
dolor_cabeza(X):-nl, write(X), write(' tiene dolor de cabeza? [s/n]: '), read(R), R=s.
nauseas(X):-nl, write(X), write(' tiene nauseas? [s/n]: '), read(R), R=s.
fatiga(X):-nl, write(X), write(' tiene fatiga? [s/n]: '), read(R), R=s.

% Las Reglas
dengue(X):- malestar(X), fiebre(X), dolor_art_mus(X), rash(X).
chikungunya(X):- fiebre(X), dolor_art_mus(X), dolor_cabeza(X), nauseas(X), fatiga(X), rash(X).

% Tratamiento para chikungunya
tratamiento_chikungunya:-
    nl,
    write('=== TRATAMIENTO RECOMENDADO PARA CHIKUNGUNYA ==='), nl, nl,
    write('El tratamiento es sintomático y en el 98% de los casos'), nl,
    write('con manejo ambulatorio.'), nl, nl,
    write('Recomendaciones:'), nl,
    write('1. Guardar reposo en cama, de preferencia usando mosquitero.'), nl,
    write('2. Para el manejo del dolor y control de fiebre:'), nl,
    write('   - Acetaminofén o Paracetamol'), nl,
    write('3. Consumo abundante de líquidos.'), nl,
    write('4. Evitar la aspirina y antiinflamatorios no esteroideos.'), nl,
    write('5. Acudir a control médico si los síntomas persisten.'), nl.

    % Tratamiento para dengue
tratamiento_dengue:-
    nl,
    write('=== TRATAMIENTO RECOMENDADO PARA DENGUE ==='), nl, nl,
    write('1. Tome abundantes líquidos para prevenir la deshidratación,'), nl,
    write('   de preferencia sales de rehidratación oral.'), nl,
    write('2. Use Paracetamol para controlar la fiebre y aliviar el dolor.'), nl,
    write('3. NO SE AUTOMEDIQUE. No use aspirina,'), nl,
    write('   debido a que su efecto puede provocar hemorragias.'), nl,
    write('4. No use antibióticos porque el dengue es producido'), nl,
    write('   por un virus y los antibióticos solo atacan bacterias.'), nl.

% El diagnostico
diagnostico(X):-
    nl, write('Se investiga CHIKUNGUNYA'),
    chikungunya(X),
    nl, write(X),
    write(' tiene sospecha de CHIKUNGUNYA.'), nl,
    tratamiento_chikungunya,
    !.

diagnostico(X):-
    nl, write('Se investiga DENGUE'),
    dengue(X),
    nl, write(X),
    write(' tiene sospecha de DENGUE.'), nl,
    tratamiento_dengue.

diagnostico(_):-
    nl,
    write(' NO SE LOGRO UN DIAGNOSTICO.').
