% Text
% In 2014, Alice's income was $310192. Alice is a surviving spouse for the year 2014. Alice is allowed itemized deductions of $600 under section 63.

% Question
% Section 68(f) applies to Alice for the year 2014. Contradiction

% Facts
person(alice).
person(bob).
finance(310192).

year(2014).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2014-12-31").
amount_(alice_is_paid,310192).
s2_a(alice,bob,2014).

% Test
:- \+ s68_f(2014).
:- halt.
