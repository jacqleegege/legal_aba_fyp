% Text
% In 2016, Alice's income was $567192. Alice is a head of household for the year 2016.

% Question
% Under section 68(b)(1)(B), Alice's applicable amount for 2016 is equal to $275000. Entailment

% Facts
person(alice_s68_b_1_B_pos).
finance(567192).
finance(275000).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

income_(alice_is_paid_s68_b_1_B_pos).
agent_(alice_is_paid_s68_b_1_B_pos,alice_s68_b_1_B_pos).
start_(alice_is_paid_s68_b_1_B_pos,d2016_12_31).
amount_(alice_is_paid_s68_b_1_B_pos,567192).
s2_b(alice_s68_b_1_B_pos,alice_s68_b_1_B_pos,2016).

% Test
:- s68_b_1_B(alice_s68_b_1_B_pos,275000,2016).
:- halt.
