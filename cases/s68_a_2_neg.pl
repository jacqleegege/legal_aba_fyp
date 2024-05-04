% Text
% In 2016, Alice's income was $295192. Alice is a surviving spouse for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(2) prescribes a reduction of Alice's itemized deductions for the year 2016 by $47000. Contradiction

% Facts
person(alice).
person(dead_spouse).
finance(295192).
finance(60000).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).


income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2016-12-31").
amount_(alice_is_paid,295192).
s63_d(alice,60000,60000,2016).
s2_a(alice,dead_spouse,2016).

% Test
:- \+ s68_a_2(alice,60000,47000,2016).
:- halt.
