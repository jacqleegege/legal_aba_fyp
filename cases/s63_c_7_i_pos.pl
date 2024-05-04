% Text
% In 2019, Alice was paid $33200. Alice is a head of household for 2019.

% Question
% Under section 63(c)(7)(i), Alice's basic standard deduction in 2019 is equal to $18000. Entailment

% Facts
person(alice).
finance(33200).

year(2019).
date("2019-12-31").
date_split("2019-12-31",2019,12,31).
date("2019-01-01").
date_split("2019-01-01",2019,1,1).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2019-12-31").
amount_(alice_is_paid,33200).
s2_b(alice,alice,2019).

% Test
:- s63_c_7_i(2019,18000).
:- halt.
