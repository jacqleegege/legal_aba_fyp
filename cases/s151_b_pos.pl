% Text
% Alice and Bob have been married since 2 Feb 2015. Bob has no income for 2015.
%
% Question
% Alice can receive an exemption for Bob under section 151(b) for the year 2015. Entailment

% Facts

person(alice_s151_b_pos).
person(bob_s151_b_pos).
person(2000).

year(2015).
date(d2015_02_02).
date_split(d2015_02_02, 2015, 2, 2).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

marriage_(alice_and_bob_s151_b_pos).
agent_(alice_and_bob_s151_b_pos,alice_s151_b_pos).
agent_(alice_and_bob_s151_b_pos,bob_s151_b_pos).
start_(alice_and_bob_s151_b_pos,d2015_02_02).

% Test
:- s151_b(alice_s151_b_pos,bob_s151_b_pos,2000,2015).
:- halt.
