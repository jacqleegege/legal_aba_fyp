% Text
% In 2016, Alice's income was $567192. Alice is not married.

% Question
% Section 68(b)(1)(D) applies to Alice in 2016. Contradiction

% Facts
person(alice).
person(bob).
finance(567192).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2016-12-31").
amount_(alice_is_paid,567192).
s2_a(alice,bob,2016).

% Test
:- \+ s68_b_1_D(alice,150000,2016).
:- halt.
