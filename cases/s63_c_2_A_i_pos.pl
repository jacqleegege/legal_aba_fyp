% Text
% In 2017, Alice was paid $33200 in remuneration. Alice and Bob have been married since Feb 3rd, 2017, and they file a joint return for 2017.

% Question
% Section 63(c)(2)(A)(i) applies to Alice in 2017. Entailment

% Facts
person(alice_s63_c_2_A_i_pos).
person(bob_s63_c_2_A_i_pos).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_2_A_i_pos).
patient_(alice_is_paid_s63_c_2_A_i_pos,alice_s63_c_2_A_i_pos).
start_(alice_is_paid_s63_c_2_A_i_pos,d2017_12_31).
amount_(alice_is_paid_s63_c_2_A_i_pos,33200).
marriage_(alice_and_bob_s63_c_2_A_i_pos).
agent_(alice_and_bob_s63_c_2_A_i_pos,alice_s63_c_2_A_i_pos).
agent_(alice_and_bob_s63_c_2_A_i_pos,bob_s63_c_2_A_i_pos).
start_(alice_and_bob_s63_c_2_A_i_pos,d2017_02_03).
joint_return_(alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos).
agent_(alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos,alice_s63_c_2_A_i_pos).
agent_(alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos,bob_s63_c_2_A_i_pos).
start_(alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos,d2017_01_01).
end_(alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos,d2017_12_31).

% Test
:- s63_c_2_A_i(alice_s63_c_2_A_i_pos,alice_and_bob_file_a_joint_return_s63_c_2_A_i_pos,2017).
:- halt.
