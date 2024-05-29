% Text
% Alice has a son, Bob. From September 1st, 2015 to November 3rd, 2019, Alice and Bob lived in the same home.

% Question
% Section 152(c)(1)(B) applies to Bob with Alice as the taxpayer for the year 2015. Contradiction

% Facts
person(alice_s152_c_1_B_neg).
person(bob_s152_c_1_B_neg).

year(2015).
date(d2015_09_01).
date_split(d2015_09_01, 2015, 9, 1).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2019).
date(d2019_11_03).
date_split(d2019_11_03, 2019, 11, 3).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

son_(bob_is_son_s152_c_1_B_neg).
agent_(bob_is_son_s152_c_1_B_neg,bob_s152_c_1_B_neg).
patient_(bob_is_son_s152_c_1_B_neg,alice_s152_c_1_B_neg).
residence_(alice_and_bob_s152_c_1_B_neg).
agent_(alice_and_bob_s152_c_1_B_neg,alice_s152_c_1_B_neg).
agent_(alice_and_bob_s152_c_1_B_neg,bob_s152_c_1_B_neg).
patient_(alice_and_bob_s152_c_1_B_neg,home_s152_c_1_B_neg).
start_(alice_and_bob_s152_c_1_B_neg,d2015_09_01).
end_(alice_and_bob_s152_c_1_B_neg,d2019_11_03).

% Test
:- \+ s152_c_1_B(bob_s152_c_1_B_neg,home_s152_c_1_B_neg,alice_s152_c_1_B_neg,d2015_09_01,d2019_11_03,2015).
:- halt.
