% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice died on July 9th, 2014. Bob married Charlie on September 14th, 2015.

% Question
% Section 2(a)(2)(A) applies to Bob in 2014. Contradiction

% Facts
person(alice_s2_a_2_A_neg).
person(bob_s2_a_2_A_neg).
person(charlie_s2_a_2_A_neg).

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

year(2015).
date("2015-09-14").
date_split("2015-09-14",2015,9,14).
date("2015-01-01").
date_split("2015-01-01",2015,1,1).
date("2015-12-31").
date_split("2015-12-31",2015,12,31).

marriage_(alice_and_bob_s2_a_2_A_neg).
agent_(alice_and_bob_s2_a_2_A_neg,alice_s2_a_2_A_neg).
agent_(alice_and_bob_s2_a_2_A_neg,bob_s2_a_2_A_neg).
start_(alice_and_bob_s2_a_2_A_neg,"1992-02-03").
death_(alice_dies_s2_a_2_A_neg).
agent_(alice_dies_s2_a_2_A_neg,alice_s2_a_2_A_neg).
start_(alice_dies_s2_a_2_A_neg,"2014-07-09").
end_(alice_dies_s2_a_2_A_neg,"2014-07-09").
marriage_(alice_and_charlie_s2_a_2_A_neg).
agent_(alice_and_charlie_s2_a_2_A_neg,charlie_s2_a_2_A_neg).
agent_(alice_and_charlie_s2_a_2_A_neg,bob_s2_a_2_A_neg).
start_(alice_and_charlie_s2_a_2_A_neg,"2015-09-14").

% Test
:- \+ s2_a_2_A(bob_s2_a_2_A_neg,alice_and_charlie_s2_a_2_A_neg,alice_and_bob_s2_a_2_A_neg,"2015-09-14",2014).
:- halt.
