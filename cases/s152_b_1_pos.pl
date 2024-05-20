% Text
% Alice has a son, Bob, who satisfies section 152(c)(1) for the year 2015. Bob has a son, Charlie, who satisfies section 152(c)(1) for the year 2015.

% Question
% Section 152(b)(1) applies to Bob for the year 2015. Entailment

% Facts
person(alice_s152_b_1_pos).
person(bob_s152_b_1_pos).
person(charlie_s152_b_1_pos).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

s152_c_1(bob_s152_b_1_pos,alice_s152_b_1_pos,2015).
s152_c_1(charlie_s152_b_1_pos,bob_s152_b_1_pos,2015).

% Test
:- s152_b_1(bob_s152_b_1_pos,charlie_s152_b_1_pos,2015).
:- halt.
