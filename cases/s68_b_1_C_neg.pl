% Text
% In 2016, Alice's income was $567192. Alice is a head of household for the year 2016.

% Question
% Section 68(b)(1)(C) applies to Alice in 2016. Contradiction

% Facts
person(alice_s68_b_1_C_neg).
finance(567192).
finance(250000).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

income_(alice_is_paid_s68_b_1_C_neg).
agent_(alice_is_paid_s68_b_1_C_neg,alice_s68_b_1_C_neg).
start_(alice_is_paid_s68_b_1_C_neg,d2016_12_31).
amount_(alice_is_paid_s68_b_1_C_neg,567192).
s2_b(alice_s68_b_1_C_neg,alice_s68_b_1_C_neg,2016).

% Test
:- \+ s68_b_1_C(alice_s68_b_1_C_neg,250000,2016).
:- halt.
