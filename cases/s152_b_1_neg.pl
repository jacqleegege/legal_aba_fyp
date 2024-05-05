% Text
% Alice has a son, Bob, who satisfies section 152(c)(1) for the year 2015. Bob has a son, Charlie, who satisfies section 152(c)(1) for the year 2015.

% Question
% Section 152(b)(1) applies to Alice for the year 2015. Contradiction

% Facts
person(alice_s152_b_1_neg).
person(bob_s152_b_1_neg).
person(charlie_s152_b_1_neg).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

s152_c_1(bob_s152_b_1_neg,alice_s152_b_1_neg,2015).
s152_c_1(charlie_s152_b_1_neg,bob_s152_b_1_neg,2015).

% Test
:- \+ s152_b_1(alice_s152_b_1_neg,bob_s152_b_1_neg,2015).
:- halt.
