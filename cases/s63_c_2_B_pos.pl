% Text
% In 2017, Alice was paid $33200. Alice is a head of household for 2017.

% Question
% Under section 63(c)(2)(B), Alice's basic standard deduction in 2017 is equal to $4400. Entailment

% Facts
person(alice_s63_c_2_B_pos).
person(bob_s63_c_2_B_pos).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(4400).

payment_(alice_is_paid_s63_c_2_B_pos).
patient_(alice_is_paid_s63_c_2_B_pos,alice_s63_c_2_B_pos).
start_(alice_is_paid_s63_c_2_B_pos,"2017-12-31").
amount_(alice_is_paid_s63_c_2_B_pos,33200).
s2_b(alice_s63_c_2_B_pos,alice_s63_c_2_B_pos,2017).

% Test
:- s63_c_2_B(alice_s63_c_2_B_pos,2017,4400).
:- halt.
