% Text
% In 2019, Alice was paid $33200. Alice is a head of household for 2019.

% Question
% Under section 63(c)(7)(i), Alice's basic standard deduction in 2019 is equal to $4400. Contradiction

% Facts
person(alice_s63_c_7_i_neg).
finance(33200).
finance(4400).

year(2019).
date(d2019_12_31).
date_split(d2019_12_31,2019,12,31).
date(d2019_01_01).
date_split(d2019_01_01,2019,1,1).

payment_(alice_is_paid_s63_c_7_i_neg).
patient_(alice_is_paid_s63_c_7_i_neg,alice_s63_c_7_i_neg).
start_(alice_is_paid_s63_c_7_i_neg,d2019_12_31).
amount_(alice_is_paid_s63_c_7_i_neg,33200).
s2_b(alice_s63_c_7_i_neg,alice_s63_c_7_i_neg,2019).

% Test
:- \+ s63_c_7_i(2019,4400).
:- halt.
