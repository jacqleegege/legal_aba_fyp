% Text
% In 2017, Alice was paid $33200 in remuneration. Alice and Bob have been married since Feb 3rd, 2017. Alice and Bob file separate returns in 2017.

% Question
% Section 63(c)(2)(A)(i) applies to Alice in 2017. Contradiction

% Facts
person(alice_s63_c_2_A_i_neg).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_2_A_i_neg).
patient_(alice_is_paid_s63_c_2_A_i_neg,alice_s63_c_2_A_i_neg).
start_(alice_is_paid_s63_c_2_A_i_neg,d2017_12_31).
amount_(alice_is_paid_s63_c_2_A_i_neg,33200).
marriage_(alice_and_bob_s63_c_2_A_i_neg).
agent_(alice_and_bob_s63_c_2_A_i_neg,alice_s63_c_2_A_i_neg).
agent_(alice_and_bob_s63_c_2_A_i_neg,bob_s63_c_2_A_i_neg).
start_(alice_and_bob_s63_c_2_A_i_neg,d2017_02_03).
joint_return_(random_joint_return).

% Test
:- \+ s63_c_2_A_i(alice_s63_c_2_A_i_neg,random_joint_return,2017).
:- halt.
