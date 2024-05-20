% Text
% Alice is entitled to an exemption for herself under section 151(b) for the year 2015. No other taxpayer is entitled to a deduction for Alice in 2015.

% Question
% Alice's exemption amount under section 151(d)(1) is equal to $2000. Entailment

% Facts
person(alice_s151_d_1_pos).
finance(2000).


year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

s151_b_applies(alice_s151_d_1_pos,2015).

% Test
:- s151_d_1(2000).
:- halt.
