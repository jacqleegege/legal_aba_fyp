% Text
% Alice has a son, Bob, who satisfies section 152(c)(1) for the year 2015.

% Question
% Under section 152(a), Bob is a dependent of Alice for the year 2014. Contradiction

% Facts
person(alice_s152_a_neg).
person(bob_s152_a_neg).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2014).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

s152_c_1(bob_s152_a_neg,alice_s152_a_neg,2015).

% Test
:- \+ s152_a(bob_s152_a_neg,alice_s152_a_neg,2014,"2014-01-01","2015-12-31").
:- halt.
