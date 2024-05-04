% Text
% Alice has a son, Bob, who satisfies section 152(c)(1) for the year 2015. Bob has a son, Charlie, who satisfies section 152(c)(1) for the year 2015.

% Question
% Section 152(b)(1) applies to Alice for the year 2015. Contradiction

% Facts
person(alice).
person(bob).
person(charlie).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

s152_c_1(bob,alice,2015).
s152_c_1(charlie,bob,2015).

% Test
:- \+ s152_b_1(alice,bob,2015).
:- halt.
