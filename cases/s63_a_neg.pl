% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under section 63(c) of $2000 and deductions of $4000 under section 151 for the year 2017.

% Question
% Under section 63(a), Alice's taxable income in 2017 is equal to $31200. Contradiction

% Facts
person(alice_s63_a_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(31200).
finance(33200).
finance(2000).
finance(4000).
finance(6000).

payment_(alice_is_paid_s63_a_neg).
patient_(alice_is_paid_s63_a_neg,alice_s63_a_neg).
start_(alice_is_paid_s63_a_neg,d2017_12_31).
amount_(alice_is_paid_s63_a_neg,33200).
s63_c(alice_s63_a_neg,2017,2000).
s151(alice_s63_a_neg,4000,alice_s63_a_neg,0,2017).

% Test
:- \+ s63_a(alice_s63_a_neg,2017,31200,33200,6000).
:- halt.
