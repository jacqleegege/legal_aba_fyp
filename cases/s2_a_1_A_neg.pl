% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice died on July 9th, 2014.

% Question
% Section 2(a)(1)(A) applies to Bob in 2014. Contradiction

% Facts
person(alice_s2_a_1_A_neg).
person(bob_s2_a_1_A_neg).
year(2014).
year(1992).
date("1992-02-03").
date_split("1992-02-03",1992,2,3).
date("1992-01-01").
date_split("1992-01-01",1992,1,1).
date("1992-12-31").
date_split("1992-12-31",1992,12,31).
date("2014-07-09").
date_split("2014-07-09",2014,7,9).
date("2014-01-01").
date_split("2014-01-01",2014,1,1).
date("2014-12-31").
date_split("2014-12-31",2014,12,31).

marriage_(alice_and_bob_s2_a_1_A_neg).
agent_(alice_and_bob_s2_a_1_A_neg,alice_s2_a_1_A_neg).
agent_(alice_and_bob_s2_a_1_A_neg,bob_s2_a_1_A_neg).
start_(alice_and_bob_s2_a_1_A_neg,"1992-02-03").
death_(alice_dies_s2_a_1_A_neg).
agent_(alice_dies_s2_a_1_A_neg,alice_s2_a_1_A_neg).
start_(alice_dies_s2_a_1_A_neg,"2014-07-09").

% Test
:- \+ s2_a_1_A(bob_s2_a_1_A_neg,alice_s2_a_1_A_neg,alice_and_bob_s2_a_1_A_neg,2014,2014).
:- halt.
