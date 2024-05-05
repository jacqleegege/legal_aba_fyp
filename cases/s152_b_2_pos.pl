% Text
% Alice and Bob got married on Jan 1st, 2015. They file a joint return for the year 2015.

% Question
% Section 152(b)(2) applies to Alice for the year 2015. Entailment

% Facts
person(alice_s152_b_2_pos).
person(bob_s152_b_2_pos).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

marriage_(alice_and_bob_s152_b_2_pos).
agent_(alice_and_bob_s152_b_2_pos,alice_s152_b_2_pos).
agent_(alice_and_bob_s152_b_2_pos,bob_s152_b_2_pos).
start_(alice_and_bob_s152_b_2_pos,"2015-01-01").
joint_return_(alice_and_bob_joint_return_s152_b_2_pos).
agent_(alice_and_bob_joint_return_s152_b_2_pos,alice_s152_b_2_pos).
agent_(alice_and_bob_joint_return_s152_b_2_pos,bob_s152_b_2_pos).
start_(alice_and_bob_joint_return_s152_b_2_pos,"2015-01-01").
end_(alice_and_bob_joint_return_s152_b_2_pos,"2015-12-31").

% Test
:- s152_b_2(alice_s152_b_2_pos,alice_and_bob_joint_return_s152_b_2_pos,bob_s152_b_2_pos,2015).
:- halt.
