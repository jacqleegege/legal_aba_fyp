% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice died on July 9th, 2014. Bob married Charlie on September 14th, 2015.

% Question
% Section 2(a)(2)(A) applies to Bob in 2015. Entailment

% Facts
person(alice_s2_a_2_A_pos).
person(bob_s2_a_2_A_pos).
person(charlie_s2_a_2_A_pos).

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

year(2015).
date(d2015_09_14).
date_split(d2015_09_14,2015,9,14).
date(d2015_01_01).
date_split(d2015_01_01,2015,1,1).
date(d2015_12_31).
date_split(d2015_12_31,2015,12,31).

marriage_(alice_and_bob_s2_a_2_A_pos).
agent_(alice_and_bob_s2_a_2_A_pos,alice_s2_a_2_A_pos).
agent_(alice_and_bob_s2_a_2_A_pos,bob_s2_a_2_A_pos).
start_(alice_and_bob_s2_a_2_A_pos,d1992_02_03).
death_(alice_dies_s2_a_2_A_pos).
agent_(alice_dies_s2_a_2_A_pos,alice_s2_a_2_A_pos).
start_(alice_dies_s2_a_2_A_pos,d2014_07_09).
end_(alice_dies_s2_a_2_A_pos,d2014_07_09).
marriage_(bob_and_charlie_s2_a_2_A_pos).
agent_(bob_and_charlie_s2_a_2_A_pos,charlie_s2_a_2_A_pos).
agent_(bob_and_charlie_s2_a_2_A_pos,bob_s2_a_2_A_pos).
start_(bob_and_charlie_s2_a_2_A_pos,d2015_09_14).

% Test
:- s2_a_2_A(bob_s2_a_2_A_pos,bob_and_charlie_s2_a_2_A_pos,alice_and_bob_s2_a_2_A_pos,d2015_09_14,2015).
:- halt.
