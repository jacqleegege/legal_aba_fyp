% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice has been blind since October 4, 2013. In addition, Alice is allowed an exemption for Bob under section 151(b) for the year 2017.

% Question
% Section 63(f)(2)(B) applies to Alice in 2017. Contradiction

% Facts
person(alice_s63_f_2_B_neg).
person(bob_s63_f_2_B_neg).
finance(33200).

year(2013).
date(d2013_10_04).
date_split(d2013_10_04, 2013, 10, 4).
date(d2013_01_01).
date_split(d2013_01_01, 2013, 1, 1).
date(d2013_12_31).
date_split(d2013_12_31, 2013, 12, 31).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03, 2017, 2, 3).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

payment_(alice_is_paid_s63_f_2_B_neg).
patient_(alice_is_paid_s63_f_2_B_neg,alice_s63_f_2_B_neg).
start_(alice_is_paid_s63_f_2_B_neg,d2017_12_31).
amount_(alice_is_paid_s63_f_2_B_neg,33200).
marriage_(alice_and_bob_s63_f_2_B_neg).
agent_(alice_and_bob_s63_f_2_B_neg,alice_s63_f_2_B_neg).
agent_(alice_and_bob_s63_f_2_B_neg,bob_s63_f_2_B_neg).
start_(alice_and_bob_s63_f_2_B_neg,d2017_02_03).
blindness_(alice_is_blind_s63_f_2_B_neg).
agent_(alice_is_blind_s63_f_2_B_neg,alice_s63_f_2_B_neg).
start_(alice_is_blind_s63_f_2_B_neg,d2013_10_04).
s151_b_applies(alice_s63_f_2_B_neg,bob_s63_f_2_B_neg,2017).

% Test
:- \+ s63_f_2_B(alice_s63_f_2_B_neg,bob_s63_f_2_B_neg,2017).
:- halt.
