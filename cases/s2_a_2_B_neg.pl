% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice died on July 9th, 2014. Alice was a nonresident alien since March 4th, 1990.

% Question
% Section 2(a)(2)(B) applies to Bob in 2014. Contradiction

% Facts
person(alice_s2_a_2_B_neg).
person(bob_s2_a_2_B_neg).

year(1990).
date("1990-03-04").
date_split("1990-03-04",1990,3,4).
date("1990-01-01").
date_split("1990-01-01",1990,1,1).
date("1990-12-31").
date_split("1990-12-31",1990,12,31).

year(1992).
date("1992-02-03").
date_split("1992-02-03",1992,2,3).
date("1992-01-01").
date_split("1992-01-01",1992,1,1).
date("1992-12-31").
date_split("1992-12-31",1992,12,31).

marriage_(alice_and_bob_s2_a_2_B_neg).
agent_(alice_and_bob_s2_a_2_B_neg,alice_s2_a_2_B_neg).
agent_(alice_and_bob_s2_a_2_B_neg,bob_s2_a_2_B_neg).
start_(alice_and_bob_s2_a_2_B_neg,"1992-02-03").
death_(alice_dies_s2_a_2_B_neg).
agent_(alice_dies_s2_a_2_B_neg,alice_s2_a_2_B_neg).
start_(alice_dies_s2_a_2_B_neg,"2014-07-09").
end_(alice_dies_s2_a_2_B_neg,"2014-07-09").
nonresident_alien_(alice_is_nra_s2_a_2_B_neg).
agent_(alice_is_nra_s2_a_2_B_neg,alice_s2_a_2_B_neg).
start_(alice_is_nra_s2_a_2_B_neg,"1990-03-04").

% Test
:- \+ s2_a_2_B(bob_s2_a_2_B_neg,alice_s2_a_2_B_neg,2014).
:- halt.
