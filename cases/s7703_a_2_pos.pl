% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob were legally separated under a decree of divorce on September 16th, 2017.

% Question
% Section 7703(a)(2) applies to Alice for the year 2018. Entailment

% Facts
person(alice).
person(bob).

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

marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2012-04-05").
legal_separation_(alice_and_bob_divorce).
patient_(alice_and_bob_divorce,alice_and_bob).
agent_(alice_and_bob_divorce,"decree of divorce").
start_(alice_and_bob_divorce,"2017-09-16").

% Test
:- s7703_a_2(alice,bob,alice_and_bob,alice_and_bob_divorce,2018).
:- halt.