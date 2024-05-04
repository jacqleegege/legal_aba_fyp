% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice and Bob were legally separated under a decree of separate maintenance on July 9th, 2014.

% Question
% Section 2(b)(2)(A) applies to Alice and Bob in 2010. Contradiction

% Facts
person(alice).
person(bob).

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

year(2010).

marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"1992-02-03").
legal_separation_(alice_and_bob_divorce).
agent_(alice_and_bob_divorce,"decree of separate maintenance").
patient_(alice_and_bob_divorce,alice_and_bob).
start_(alice_and_bob_divorce,"2014-07-09").

% Test
:- \+ s2_b_2_A(alice,bob,alice_and_bob_divorce,alice_and_bob,2010).
:- halt.
