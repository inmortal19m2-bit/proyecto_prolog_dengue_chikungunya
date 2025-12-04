% --- Diagnóstico ---

probable_enfermedad(Sintomas, dengue) :-
    member(fiebre, Sintomas),
    (member(dolor_cabeza, Sintomas) ; member(dolor_retroocular, Sintomas)),
    (member(erupcion, Sintomas) ; member(dolor_muscular, Sintomas) ; member(nauseas, Sintomas)),
    \+ member(dolor_articulaciones_severo, Sintomas).

probable_enfermedad(Sintomas, chikungunya) :-
    member(fiebre, Sintomas),
    member(dolor_articulaciones_severo, Sintomas).

probable_enfermedad(Sintomas, dengue_o_chik) :-
    probable_enfermedad(Sintomas, dengue),
    probable_enfermedad(Sintomas, chikungunya).

% --- Tratamientos ---

tratamiento(dengue, [
  "No existe tratamiento antiviral específico.",
  "Tomar acetaminofén (paracetamol) para la fiebre. NO usar ibuprofeno ni aspirina.",
  "Beber abundante agua o suero.",
  "Acudir al médico si hay dolor abdominal fuerte, vómitos persistentes, sangrado o somnolencia."
]).

tratamiento(chikungunya, [
  "No existe tratamiento antiviral específico.",
  "Reposo y buena hidratación.",
  "A diferencia del dengue, se pueden usar antiinflamatorios para el dolor articular SI NO SE SOSPECHA dengue.",
  "Consultar a un profesional si el dolor articular persiste."
]).

tratamiento(dengue_o_chik, [
  "Los síntomas coinciden con Dengue y Chikunguña.",
  "Acudir a un centro médico para evaluar y realizar pruebas.",
  "Usar solo acetaminofén hasta descartar dengue.",
  "Mantener hidratación y vigilancia de signos de alarma."
]).

tratamiento(desconocido, [
  "Los síntomas no son suficientes para determinar una enfermedad.",
  "Se recomienda consultar a un profesional de salud."
]).

% --- Predicado principal ---

diagnosticar(Sintomas, Enfermedad, Tratamiento) :-
    ( probable_enfermedad(Sintomas, Enfermedad)
    -> true
    ;  Enfermedad = desconocido
    ),
    tratamiento(Enfermedad, Tratamiento).

% --- Modo interactivo ---

iniciar :-
    writeln('=== PREDICTOR DE DENGUE Y CHIKUNGUÑA (DEMO EDUCATIVA) ==='),
    writeln('Ingrese los síntomas como una lista, por ejemplo:'),
    writeln('[fiebre, dolor_articulaciones_severo, erupcion].'), nl,
    write('Síntomas: '),
    read(Sintomas),
    diagnosticar(Sintomas, E, T),
    nl,
    format('Posible enfermedad: ~w~n', [E]),
    writeln('Recomendaciones educativas:'),
    forall(member(Line, T), (write('- '), writeln(Line))),
    nl,
    writeln('ADVERTENCIA: Este programa no sustituye evaluación médica.').

