% Declare that has_symptom/1 is dynamic so that we can add/remove symptoms during runtime
:- dynamic has_symptom/1.

% Defining the rules for different medical conditions based on symptoms

% Condition: Cold
diagnose(cold) :- 
    has_symptom(fever),
    has_symptom(cough),
    has_symptom(sore_throat),
    has_symptom(runny_nose),
    write('Diagnosis: You may have a cold.'), nl.

% Condition: Flu
diagnose(flu) :-
    has_symptom(fever),
    has_symptom(cough),
    has_symptom(sore_throat),
    has_symptom(body_ache),
    has_symptom(fatigue),
    write('Diagnosis: You may have the flu.'), nl.

% Condition: Covid-19
diagnose(covid_19) :-
    has_symptom(fever),
    has_symptom(cough),
    has_symptom(shortness_of_breath),
    has_symptom(loss_of_taste_or_smell),
    write('Diagnosis: You may have COVID-19.'), nl.

% Condition: Allergy
diagnose(allergy) :-
    has_symptom(sneezing),
    has_symptom(runny_nose),
    has_symptom(itchy_eyes),
    has_symptom(cough),
    write('Diagnosis: You may have allergies.'), nl.

% Condition: Migraine
diagnose(migraine) :-
    has_symptom(severe_headache),
    has_symptom(nausea),
    has_symptom(sensitivity_to_light),
    write('Diagnosis: You may have a migraine.'), nl.

% No diagnosis
diagnose(unknown) :-
    write('Diagnosis: Your symptoms do not match any known conditions in this system.'), nl.

% Ask about symptoms
ask_symptoms :-
    write('Answer the following questions with "yes." or "no."'), nl,
    ask(fever),
    ask(cough),
    ask(sore_throat),
    ask(runny_nose),
    ask(body_ache),
    ask(fatigue),
    ask(shortness_of_breath),
    ask(loss_of_taste_or_smell),
    ask(sneezing),
    ask(itchy_eyes),
    ask(severe_headache),
    ask(nausea),
    ask(sensitivity_to_light).

% Asking the user about specific symptoms
ask(Symptom) :-
    format('Do you have ~w? ', [Symptom]),
    read(Reply),
    ((Reply == yes) -> assert(has_symptom(Symptom)); assert(not(has_symptom(Symptom)))).


% Main predicate to start the diagnosis
start :-
    ask_symptoms,
    (diagnose(cold) ; diagnose(flu) ; diagnose(covid_19) ; diagnose(allergy) ; diagnose(migraine) ; diagnose(unknown)).
    
