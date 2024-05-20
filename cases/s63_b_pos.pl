% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under section 63(c)(1) of $2000 for the year 2017, and no deduction under section 151. Alice decides not to itemize her deductions.

% Question
% Under section 63(b), Alice's taxable income in 2017 is equal to $31200. Entailment

% Facts
person(alice_s63_b_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).
finance(31200).
finance(2000).
finance(0).

payment_(alice_is_paid_s63_b_pos).
patient_(alice_is_paid_s63_b_pos,alice_s63_b_pos).
start_(alice_is_paid_s63_b_pos,d2017_12_31).
amount_(alice_is_paid_s63_b_pos,33200).
s63_c_1(alice_s63_b_pos,2017,2000).
s151(alice_s63_b_pos,0,alice_s63_b_pos,0,2017).

% Test
:- s63_b(alice_s63_b_pos,2017,31200,33200).
:- halt.
