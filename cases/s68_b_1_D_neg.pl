% Text
% In 2016, Alice's income was $567192. Alice is not married.

% Question
% Section 68(b)(1)(D) applies to Alice in 2016. Contradiction

% Facts
person(alice_s68_b_1_D_neg).
person(bob_s68_b_1_D_neg).
finance(567192).
finance(150000).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_b_1_D_neg).
agent_(alice_is_paid_s68_b_1_D_neg,alice_s68_b_1_D_neg).
start_(alice_is_paid_s68_b_1_D_neg,"2016-12-31").
amount_(alice_is_paid_s68_b_1_D_neg,567192).
s2_a(alice_s68_b_1_D_neg,bob_s68_b_1_D_neg,2016).

% Test
:- \+ s68_b_1_D(alice_s68_b_1_D_neg,150000,2016).
:- halt.
