% Text
% Alice has a son, Bob. From September 1st, 2015 to November 3rd, 2019, Alice and Bob lived in the same home. Bob married Charlie on October 23rd, 2018. Bob and Charlie filed a joint return for the year 2019.

% Question
% Section 152(c)(1)(E) applies to Bob for the year 2019. Contradiction

% Facts
person(alice_s152_c_1_E_neg).
person(bob_s152_c_1_E_neg).
person(charlie_s152_c_1_E_neg).

year(2015).
date(d2015_09_01).
date_split(d2015_09_01, 2015, 9, 1).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2018).
date(d2018_10_23).
date_split(d2018_10_23, 2018, 10, 23).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

year(2019).
date(d2019_11_03).
date_split(d2019_11_03, 2019, 11, 3).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

son_(bob_is_son_s152_c_1_E_neg).
agent_(bob_is_son_s152_c_1_E_neg,bob_s152_c_1_E_neg).
patient_(bob_is_son_s152_c_1_E_neg,alice_s152_c_1_E_neg).
residence_(alice_and_bob_s152_c_1_E_neg).
agent_(alice_and_bob_s152_c_1_E_neg,alice_s152_c_1_E_neg).
agent_(alice_and_bob_s152_c_1_E_neg,bob_s152_c_1_E_neg).
patient_(alice_and_bob_s152_c_1_E_neg,home_s152_c_1_E_neg).
start_(alice_and_bob_s152_c_1_E_neg,d2015_09_01).
end_(alice_and_bob_s152_c_1_E_neg,d2019_11_03).
marriage_(bob_and_charlie_s152_c_1_E_neg).
agent_(bob_and_charlie_s152_c_1_E_neg,bob_s152_c_1_E_neg).
agent_(bob_and_charlie_s152_c_1_E_neg,charlie_s152_c_1_E_neg).
start_(bob_and_charlie_s152_c_1_E_neg,d2018_10_23).
joint_return_(bob_and_charlie_joint_return_s152_c_1_E_neg).
agent_(bob_and_charlie_joint_return_s152_c_1_E_neg,bob_s152_c_1_E_neg).
agent_(bob_and_charlie_joint_return_s152_c_1_E_neg,charlie_s152_c_1_E_neg).
start_(bob_and_charlie_joint_return_s152_c_1_E_neg,d2019_01_01).
end_(bob_and_charlie_joint_return_s152_c_1_E_neg,d2019_12_31).

% Test
:- \+ s152_c_1_E(bob_s152_c_1_E_neg,charlie_s152_c_1_E_neg,2019).
:- halt.
