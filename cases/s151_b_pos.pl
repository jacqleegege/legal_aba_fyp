% Text
% Alice and Bob have been married since 2 Feb 2015. Bob has no income for 2015.
%
% Question
% Alice can receive an exemption for Bob under section 151(b) for the year 2015. Entailment

% Facts

person(alice).
person(bob).

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

% Test
:- s151_b(alice,bob,2,000,2015).
:- halt.
