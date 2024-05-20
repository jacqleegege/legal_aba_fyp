% Text
% Alice and Bob have been married since 2 Feb 2015. Charlie counts as Alice's dependent under section 152(c)(1) for 2015.

% Question
% Alice can claim an exemption with Bob as the dependent for 2015 under section 151(c). Contradiction

% Facts
person(alice_s151_c_neg).
person(bob_s151_c_neg).
person(charlie_s151_c_neg).

finance(2000).

year(2015).
date(d2015_02_02).
date_split(d2015_02_02, 2015, 2, 2).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

marriage_(alice_and_bob_s151_c_neg).
agent_(alice_and_bob_s151_c_neg,alice_s151_c_neg).
agent_(alice_and_bob_s151_c_neg,bob_s151_c_neg).
start_(alice_and_bob_s151_c_neg,d2015_02_02).
s152_c_1(charlie_s151_c_neg,alice_s151_c_neg,2015).

% Test
:- \+ s151_c(alice_s151_c_neg,bob_s151_c_neg,2000,2015).
:- halt.
