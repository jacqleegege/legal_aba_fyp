% Text
% Alice has a son, Bob, who satisfies section 152(c)(1) for the year 2015.

% Question
% Under section 152(a), Bob is a dependent of Alice for the year 2014. Contradiction

% Facts
person(alice_s152_a_neg).
person(bob_s152_a_neg).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2014).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

s152_c_1(bob_s152_a_neg,alice_s152_a_neg,2015).

% Test
:- \+ s152_a(bob_s152_a_neg,alice_s152_a_neg,2014,d2014_01_01,d2015_12_31).
:- halt.
