% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob were legally separated under a decree of divorce on September 16th, 2017.

% Question
% Section 7703(a)(2) applies to Alice for the year 2012. Contradiction

% Facts
person(alice_s7703_a_2_neg).
person(bob_s7703_a_2_neg).

year(2012).
date(d2012_01_01).
date_split(d2012_01_01, 2012, 1, 1).
date(d2012_04_05).
date_split(d2012_04_05, 2012, 4, 5).
date(d2012_12_31).
date_split(d2012_12_31, 2012, 12, 31).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_09_16).
date_split(d2017_09_16, 2017, 9, 16).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

marriage_(alice_and_bob_s7703_a_2_neg).
agent_(alice_and_bob_s7703_a_2_neg,alice_s7703_a_2_neg).
agent_(alice_and_bob_s7703_a_2_neg,bob_s7703_a_2_neg).
start_(alice_and_bob_s7703_a_2_neg,d2012_04_05).
legal_separation_(alice_and_bob_divorce_s7703_a_2_neg).
patient_(alice_and_bob_divorce_s7703_a_2_neg,alice_and_bob_s7703_a_2_neg).
agent_(alice_and_bob_divorce_s7703_a_2_neg,"decree of divorce").
start_(alice_and_bob_divorce_s7703_a_2_neg,d2017_09_16).

% Test
:- \+ s7703_a_2(alice_s7703_a_2_neg,bob_s7703_a_2_neg,alice_and_bob_s7703_a_2_neg,alice_and_bob_divorce_s7703_a_2_neg,2012).
:- halt.
