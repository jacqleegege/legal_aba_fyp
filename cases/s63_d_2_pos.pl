% Text
% In 2017, Alice was paid $33200 in remuneration. She is allowed a deduction for herself under section 151 of $2000 for the year 2017.

% Question
% Alice's deduction for 2017 falls under section 63(d)(2). Entailment

% Facts
person(alice_s63_d_2_pos).
finance(33200).
finance(2000).

year(2017).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

payment_(alice_is_paid_s63_d_2_pos).
patient_(alice_is_paid_s63_d_2_pos,alice_s63_d_2_pos).
start_(alice_is_paid_s63_d_2_pos,d2017_12_31).
amount_(alice_is_paid_s63_d_2_pos,33200).
s151(alice_s63_d_2_pos,2000,alice_s63_d_2_pos,0,2017).

% Test
:- s63_d_2(alice_s63_d_2_pos,2000,2017).
:- halt.
