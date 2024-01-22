% BK
innocent(X) :- defendant(X), not_guilty(X).

liar(alex).

witness_con(mary,alex).
witness_con(david,carol).
witness_con(john,carol).

away(bob).

defendant(mary).
defendant(david).
defendant(john).

person(alex).
person(bob).
person(carol).
person(mary).
person(david).
person(john).

% assumption: not_guilty (ranges over defendant)
%assumption(not_guilty(X)) :- X=mary.
%assumption(not_guilty(X)) :- X=david.
%assumption(not_guilty(X)) :- X=john.
assumption(not_guilty(X)) :- domain(not_guilty(X)).
% contrary of not_guilty
contrary(not_guilty(X),guilty(X)) :- assumption(not_guilty(X)).

% definition of domain predicate
domain(X) :- person(X).
domain(not_guilty(X)) :- defendant(X).
domain(guilty(X)) :- domain(not_guilty(X)).
domain(innocent(X)) :- person(X).

% aba_asp('./examples/innocent.bk.pl',[innocent(mary),innocent(bob)],[innocent(david),innocent(john)]).