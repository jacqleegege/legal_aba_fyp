% Text
% Alice and Bob got married on April 5th, 2012. Bob died September 16th, 2017.

% Question
% Section 7703(a)(1) applies to Alice for the year 2018. Contradiction

% Facts
person(alice_s7703_a_1_neg).
person(bob_s7703_a_1_neg).

year(2012).
date("2012-01-01").
date_split("2012-01-01", 2012, 1, 1).
date("2012-04-05").
date_split("2012-04-05", 2012, 4, 5).
date("2012-12-31").
date_split("2012-12-31", 2012, 12, 31).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-09-16").
date_split("2017-09-16", 2017, 9, 16).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

marriage_(alice_and_bob_s7703_a_1_neg).
agent_(alice_and_bob_s7703_a_1_neg,alice_s7703_a_1_neg).
agent_(alice_and_bob_s7703_a_1_neg,bob_s7703_a_1_neg).
start_(alice_and_bob_s7703_a_1_neg,"2012-04-05").
death_(bob_dies_s7703_a_1_neg).
agent_(bob_dies_s7703_a_1_neg,bob_s7703_a_1_neg).
start_(bob_dies_s7703_a_1_neg,"2017-09-16").

% Test
:- \+ s7703_a_1(alice_s7703_a_1_neg,bob_s7703_a_1_neg,alice_and_bob_s7703_a_1_neg,"2017-09-16",2018).
:- halt.
