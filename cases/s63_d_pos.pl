% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under $1200 for the year 2017 for donating cash to charity.

% Question
% Alice's deduction for 2017 falls under section 63(d). Entailment

% Facts
person(alice_s63_d_pos).
finance(33200).
finance(1200).

year(2017).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

payment_(alice_is_paid_s63_d_pos).
patient_(alice_is_paid_s63_d_pos,alice_s63_d_pos).
start_(alice_is_paid_s63_d_pos,d2017_12_31).
amount_(alice_is_paid_s63_d_pos,33200).
deduction_(deduction_alice_2017_s63_d_pos).
agent_(deduction_alice_2017_s63_d_pos,alice_s63_d_pos).
start_(deduction_alice_2017_s63_d_pos,d2017_12_31).
amount_(deduction_alice_2017_s63_d_pos,1200).

% Test
:- s63_d(alice_s63_d_pos,1200,1200,2017).
:- halt.
