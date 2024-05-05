% Text
% In 2016, Alice's income was $567192. Alice is not married, is not a surviving spouse, and is not a head of household in 2016.

% Question
% Section 68(b)(1)(C) applies to Alice in 2016 with the applicable amount equal to $250000. Entailment

% Facts
person(alice_s68_b_1_C_pos).
finance(567192).
finance(250000).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_b_1_C_pos).
agent_(alice_is_paid_s68_b_1_C_pos,alice_s68_b_1_C_pos).
start_(alice_is_paid_s68_b_1_C_pos,"2016-12-31").
amount_(alice_is_paid_s68_b_1_C_pos,567192).

% Test
:- s68_b_1_C(alice_s68_b_1_C_pos,250000,2016).
:- halt.
