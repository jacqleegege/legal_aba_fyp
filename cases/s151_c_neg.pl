% Text
% Alice and Bob have been married since 2 Feb 2015. Charlie counts as Alice's dependent under section 152(c)(1) for 2015.

% Question
% Alice can claim an exemption with Bob as the dependent for 2015 under section 151(c). Contradiction

% Facts
person(alice).
person(bob).
person(charlie).

year(2015).
date("2015-02-02").
date_split("2015-02-02", 2015, 2, 2).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2015-02-02").
s152_c_1(charlie,alice,2015).

% Test
:- \+ s151_c(alice,bob,2000,2015).
:- halt.
