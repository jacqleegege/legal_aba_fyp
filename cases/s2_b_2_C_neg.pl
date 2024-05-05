% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice was a nonresident alien. Alice died on July 9th, 2014.

% Question
% Section 2(b)(2)(C) applies to Bob in 2014. Contradiction

% Facts
person(alice_s2_b_2_C_neg).
person(bob_s2_b_2_C_neg).

year(1992).
date("1992-02-03").
date_split("1992-02-03",1992,2,3).
date("1992-01-01").
date_split("1992-01-01",1992,1,1).
date("1992-12-31").
date_split("1992-12-31",1992,12,31).

year(2014).
date("2014-07-09").
date_split("2014-07-09",2014,7,9).
date("2014-01-01").
date_split("2014-01-01",2014,1,1).
date("2014-12-31").
date_split("2014-12-31",2014,12,31).

year(2014).

marriage_(alice_and_bob_s2_b_2_C_neg).
agent_(alice_and_bob_s2_b_2_C_neg,alice_s2_b_2_C_neg).
agent_(alice_and_bob_s2_b_2_C_neg,bob_s2_b_2_C_neg).
start_(alice_and_bob_s2_b_2_C_neg,"1992-02-03").
death_(alice_dies_s2_b_2_C_neg).
agent_(alice_dies_s2_b_2_C_neg,alice_s2_b_2_C_neg).
start_(alice_dies_s2_b_2_C_neg,"2014-07-09").
end_(alice_dies_s2_b_2_C_neg,"2014-07-09").
nonresident_alien_(alice_is_a_nra_s2_b_2_C_neg).
agent_(alice_is_a_nra_s2_b_2_C_neg,alice_s2_b_2_C_neg).

% Test
:- \+ s2_b_2_C(bob_s2_b_2_C_neg,alice_and_bob_s2_b_2_C_neg,alice_s2_b_2_C_neg,2014).
:- halt.
