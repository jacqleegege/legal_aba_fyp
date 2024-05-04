% Text
% In 2017, Alice was paid $33200. Alice is a surviving spouse for 2017.

% Question
% Section 63(c)(2)(A)(ii) applies to Alice in 2017. Entailment

% Facts
person(alice).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s2_a(alice,_,2017).

% Test
:- s63_c_2_A_ii(alice,2017).
:- halt.
