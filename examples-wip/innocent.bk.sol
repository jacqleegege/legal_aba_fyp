innocent(A) :- defendant(A), not_guilty(A).
liar(A) :- A=alex.
witness_con(A,B) :- A=mary, B=alex.
witness_con(A,B) :- A=david, B=carol.
witness_con(A,B) :- A=john, B=carol.
away(A) :- A=bob.
defendant(A) :- A=mary.
defendant(A) :- A=david.
defendant(A) :- A=john.
person(A) :- A=alex.
person(A) :- A=bob.
person(A) :- A=carol.
person(A) :- A=mary.
person(A) :- A=david.
person(A) :- A=john.
innocent(A) :- away(A).
guilty(A) :- alpha_5(B,A), person(B), witness_con(A,B).
c_alpha_5(A,B) :- defendant(B), liar(A).

% utility rules
assumption(not_guilty(A)).
contrary(not_guilty(A),guilty(A)) :- assumption(not_guilty(A)).
domain(not_guilty(A)) :- defendant(A).
assumption(alpha_5(A,B)).
contrary(alpha_5(A,B),c_alpha_5(A,B)) :- assumption(alpha_5(A,B)).
domain(alpha_5(A,B)) :- person(A), witness_con(B,A).
