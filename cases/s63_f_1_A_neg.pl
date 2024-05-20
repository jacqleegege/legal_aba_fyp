% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice was born March 2nd, 1950 and Bob was born March 3rd, 1955.

% Question
% Section 63(f)(1)(A) applies to Bob in 2017. Contradiction

% Facts
person(alice_s63_f_1_A_neg).
person(bob_s63_f_1_A_neg).
finance(33200).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03, 2017, 2, 3).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(1950).
date(d1950_03_02).
date_split(d1950_03_02, 1950, 3, 2).
date(d1950_01_01).
date_split(d1950_01_01, 1950, 1, 1).
date(d1950_12_31).
date_split(d1950_12_31, 1950, 12, 31).

year(1955).
date(d1955_03_03).
date_split(d1955_03_03, 1955, 3, 3).
date(d1955_01_01).
date_split(d1955_01_01, 1955, 1, 1).
date(d1955_12_31).
date_split(d1955_12_31, 1955, 12, 31).

payment_(alice_is_paid_s63_f_1_A_neg).
patient_(alice_is_paid_s63_f_1_A_neg,alice_s63_f_1_A_neg).
start_(alice_is_paid_s63_f_1_A_neg,d2017_12_31).
amount_(alice_is_paid_s63_f_1_A_neg,33200).
marriage_(alice_and_bob_s63_f_1_A_neg).
agent_(alice_and_bob_s63_f_1_A_neg,alice_s63_f_1_A_neg).
agent_(alice_and_bob_s63_f_1_A_neg,bob_s63_f_1_A_neg).
start_(alice_and_bob_s63_f_1_A_neg,d2017_02_03).
birth_(alice_is_born_s63_f_1_A_neg).
agent_(alice_is_born_s63_f_1_A_neg,alice_s63_f_1_A_neg).
start_(alice_is_born_s63_f_1_A_neg,d1950_03_02).
end_(alice_is_born_s63_f_1_A_neg,d1950_03_02).
birth_(bob_is_born_s63_f_1_A_neg).
agent_(bob_is_born_s63_f_1_A_neg,bob_s63_f_1_A_neg).
start_(bob_is_born_s63_f_1_A_neg,d1955_03_03).
end_(bob_is_born_s63_f_1_A_neg,d1955_03_03).

% Test
:- \+ s63_f_1_A(bob_s63_f_1_A_neg,2017).
:- halt.
