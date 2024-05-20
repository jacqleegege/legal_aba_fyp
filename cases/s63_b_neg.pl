% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under section 63(c)(1) of $2000 for the year 2017, and no deduction under section 151. Alice takes the standard deduction.

% Question
% Under section 63(b), Alice's taxable income in 2017 is equal to $31400. Contradiction

% Facts
person(alice_s63_b_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).
finance(31400).
finance(2000).
finance(0).

payment_(alice_is_paid_s63_b_neg).
patient_(alice_is_paid_s63_b_neg,alice_s63_b_neg).
start_(alice_is_paid_s63_b_neg,d2017_12_31).
amount_(alice_is_paid_s63_b_neg,33200).
s63_c_1(alice_s63_b_neg,2017,2000).
s151(alice_s63_b_neg,0,alice_s63_b_neg,0,2017).

% Test
:- \+ s63_b(alice_s63_b_neg,2017,31400,33200).
:- halt.
