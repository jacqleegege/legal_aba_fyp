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
contrary(not_guilty(A),guilty(A)) :- assumption(not_guilty(A)).
innocent(A) :- liar(B), witness_con(A,B).
innocent(A) :- away(A).

