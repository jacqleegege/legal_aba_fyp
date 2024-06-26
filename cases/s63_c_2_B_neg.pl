% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017, and they file a joint return for 2017.

% Question
% Under section 63(c)(2)(B), Alice's basic standard deduction in 2017 is equal to $4400. Contradiction

% Facts
person(alice_s63_c_2_B_neg).
person(bob_s63_c_2_B_neg).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).
finance(4400).

payment_(alice_is_paid_s63_c_2_B_neg).
patient_(alice_is_paid_s63_c_2_B_neg,alice_s63_c_2_B_neg).
start_(alice_is_paid_s63_c_2_B_neg,d2017_12_31).
amount_(alice_is_paid_s63_c_2_B_neg,33200).
marriage_(alice_and_bob_s63_c_2_B_neg).
agent_(alice_and_bob_s63_c_2_B_neg,alice_s63_c_2_B_neg).
agent_(alice_and_bob_s63_c_2_B_neg,bob_s63_c_2_B_neg).
start_(alice_and_bob_s63_c_2_B_neg,d2017_02_03).
joint_return_(alice_and_bob_file_a_joint_return_s63_c_2_B_neg).
agent_(alice_and_bob_file_a_joint_return_s63_c_2_B_neg,alice_s63_c_2_B_neg).
agent_(alice_and_bob_file_a_joint_return_s63_c_2_B_neg,bob_s63_c_2_B_neg).
start_(alice_and_bob_file_a_joint_return_s63_c_2_B_neg,d2017_01_01).
end_(alice_and_bob_file_a_joint_return_s63_c_2_B_neg,d2017_12_31).

% Test
:- \+ s63_c_2_B(alice_s63_c_2_B_neg,2017,4400).
:- halt.
