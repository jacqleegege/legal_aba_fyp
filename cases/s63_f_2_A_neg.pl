% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice and Bob file separate returns in 2017. Alice has been blind since April 19, 2015.

% Question
% Section 63(f)(2)(A) applies to Bob in 2017. Contradiction

% Facts
person(alice_s63_f_2_A_neg).
person(bob_s63_f_2_A_neg).
finance(33200).

year(2015).
date(d2015_04_19).
date_split(d2015_04_19, 2015, 4, 19).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03, 2017, 2, 3).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).


payment_(alice_is_paid_s63_f_2_A_neg).
patient_(alice_is_paid_s63_f_2_A_neg,alice_s63_f_2_A_neg).
start_(alice_is_paid_s63_f_2_A_neg,d2017_12_31).
amount_(alice_is_paid_s63_f_2_A_neg,33200).
marriage_(alice_and_bob_s63_f_2_A_neg).
agent_(alice_and_bob_s63_f_2_A_neg,alice_s63_f_2_A_neg).
agent_(alice_and_bob_s63_f_2_A_neg,bob_s63_f_2_A_neg).
start_(alice_and_bob_s63_f_2_A_neg,d2017_02_03).
blindness_(alice_is_blind_s63_f_2_A_neg).
agent_(alice_is_blind_s63_f_2_A_neg,alice_s63_f_2_A_neg).
start_(alice_is_blind_s63_f_2_A_neg,d2015_04_19).

% Test
:- \+ s63_f_2_A(bob_s63_f_2_A_neg,2017).
:- halt.
