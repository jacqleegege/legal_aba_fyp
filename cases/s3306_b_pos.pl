% Text
% Over the year 2018, Alice has paid $2325 in cash to Bob for walking her dog.

% Question
% Section 3306(b) applies to the money paid by Alice to Bob for the year 2018. Entailment

% Facts
person(alice).
person(bob).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

finance(2325).
medium("cash").

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2018-01-01").
end_(alice_employer,"2018-12-31").
purpose_(alice_employer,"walking her dog").
payment_(alice_pays).
agent_(alice_pays,alice).
patient_(alice_pays,bob).
start_(alice_pays,"2018-01-01").
end_(alice_pays,"2018-12-31").
purpose_(alice_pays,alice_employer).
amount_(alice_pays,2325).
means_(alice_pays,"cash").

% Test
:- s3306_b(2325,alice_pays,alice_employer,alice,bob,alice,bob,"cash").
:- halt.
