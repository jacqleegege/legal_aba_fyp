% Text
% Alice and Bob have been married since 2 Feb 2015. Bob has no income for 2015. Alice and Bob file their taxes jointly for 2015.

% Question
% Alice can receive an exemption for Bob under section 151(b) for the year 2015. Contradiction

% Facts
person(alice_s151_b_neg).
person(bob_s151_b_neg).
finance(2000).

year(2015).
date("2015-02-02").
date_split("2015-02-02", 2015, 2, 2).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

marriage_(alice_and_bob_s151_b_neg).
agent_(alice_and_bob_s151_b_neg,alice_s151_b_neg).
agent_(alice_and_bob_s151_b_neg,bob_s151_b_neg).
start_(alice_and_bob_s151_b_neg,"2015-02-02").
joint_return_(alice_and_bob_joint_return_s151_b_neg).
agent_(alice_and_bob_joint_return_s151_b_neg,alice_s151_b_neg).
agent_(alice_and_bob_joint_return_s151_b_neg,bob_s151_b_neg).
start_(alice_and_bob_joint_return_s151_b_neg,"2015-01-01").
end_(alice_and_bob_joint_return_s151_b_neg,"2015-12-31").

% Test
:- \+ s151_b(alice_s151_b_neg,bob_s151_b_neg,2000,2015).
:- halt.
