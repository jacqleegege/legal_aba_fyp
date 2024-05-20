% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice has been blind since March 20, 2016.

% Question
% Section 63(f)(2)(A) applies to Alice in 2017. Entailment

% Facts
person(alice_s63_f_2_A_pos).
person(bob_s63_f_2_A_pos).
finance(33200).

year(2016).
date(d2016_03_20).
date_split(d2016_03_20, 2016, 3, 20).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03, 2017, 2, 3).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

payment_(alice_is_paid_s63_f_2_A_pos).
patient_(alice_is_paid_s63_f_2_A_pos,alice_s63_f_2_A_pos).
start_(alice_is_paid_s63_f_2_A_pos,d2017_12_31).
amount_(alice_is_paid_s63_f_2_A_pos,33200).
marriage_(alice_and_bob_s63_f_2_A_pos).
agent_(alice_and_bob_s63_f_2_A_pos,alice_s63_f_2_A_pos).
agent_(alice_and_bob_s63_f_2_A_pos,bob_s63_f_2_A_pos).
start_(alice_and_bob_s63_f_2_A_pos,d2017_02_03).
blindness_(alice_is_blind_s63_f_2_A_pos).
agent_(alice_is_blind_s63_f_2_A_pos,alice_s63_f_2_A_pos).
start_(alice_is_blind_s63_f_2_A_pos,d2016_03_20).

% Test
:- s63_f_2_A(alice_s63_f_2_A_pos,2017).
:- halt.
