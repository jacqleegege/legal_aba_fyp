% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice was a nonresident alien. Alice died on July 9th, 2014.

% Question
% Section 2(b)(2)(C) applies to Bob in 2014. Contradiction

% Facts
person(alice_s2_b_2_C_neg).
person(bob_s2_b_2_C_neg).

year(1992).
date(d1992_02_03).
date_split(d1992_02_03,1992,2,3).
date(d1992_01_01).
date_split(d1992_01_01,1992,1,1).
date(d1992_12_31).
date_split(d1992_12_31,1992,12,31).

year(2014).
date(d2014_07_09).
date_split(d2014_07_09,2014,7,9).
date(d2014_01_01).
date_split(d2014_01_01,2014,1,1).
date(d2014_12_31).
date_split(d2014_12_31,2014,12,31).

year(2014).

marriage_(alice_and_bob_s2_b_2_C_neg).
agent_(alice_and_bob_s2_b_2_C_neg,alice_s2_b_2_C_neg).
agent_(alice_and_bob_s2_b_2_C_neg,bob_s2_b_2_C_neg).
start_(alice_and_bob_s2_b_2_C_neg,d1992_02_03).
death_(alice_dies_s2_b_2_C_neg).
agent_(alice_dies_s2_b_2_C_neg,alice_s2_b_2_C_neg).
start_(alice_dies_s2_b_2_C_neg,d2014_07_09).
end_(alice_dies_s2_b_2_C_neg,d2014_07_09).
nonresident_alien_(alice_is_a_nra_s2_b_2_C_neg).
agent_(alice_is_a_nra_s2_b_2_C_neg,alice_s2_b_2_C_neg).

% Test
:- \+ s2_b_2_C(bob_s2_b_2_C_neg,alice_and_bob_s2_b_2_C_neg,alice_s2_b_2_C_neg,2014).
:- halt.
