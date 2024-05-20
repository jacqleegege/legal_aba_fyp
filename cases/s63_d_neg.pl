% Text
% In 2017, Alice was paid $33200. She is allowed a deduction of $2000 for herself for the year 2017 under section 151(b).

% Question
% Alice's deduction for 2017 falls under section 63(d). Contradiction

% Facts
person(alice_s63_d_neg).
finance(33200).
finance(2000).

year(2017).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

payment_(alice_is_paid_s63_d_neg).
patient_(alice_is_paid_s63_d_neg,alice_s63_d_neg).
start_(alice_is_paid_s63_d_neg,d2017_12_31).
amount_(alice_is_paid_s63_d_neg,33200).
s151_b(alice_s63_d_neg,2000,2017).

% Test
:- \+ s63_d(alice_s63_d_neg,2000,2000,2017).
:- halt.
