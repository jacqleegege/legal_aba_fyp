% Text
% In 2017, Alice was paid $33200. Alice and Bob got married on Feb 3rd, 2017. Alice was a nonresident alien from August 23rd, 2015 to September 15th, 2016.

% Question
% Section 63(c)(6)(B) applies to Alice for 2017. Contradiction

% Facts
person(alice_s63_c_6_B_neg).
person(bob_s63_c_6_B_neg).

year(2015).
date(d2015_08_23).
date_split(d2015_08_23,2015,8,23).
date(d2015_01_01).
date_split(d2015_01_01,2015,1,1).
date(d2015_12_31).
date_split(d2015_12_31,2015,12,31).
year(2016).
date(d2016_08_15).
date_split(d2016_08_15,2016,8,15).
date(d2016_01_01).
date_split(d2016_01_01,2016,1,1).
date(d2016_12_31).
date_split(d2016_12_31,2016,12,31).
year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_6_B_neg).
patient_(alice_is_paid_s63_c_6_B_neg,alice_s63_c_6_B_neg).
start_(alice_is_paid_s63_c_6_B_neg,d2017_12_31).
amount_(alice_is_paid_s63_c_6_B_neg,33200).
marriage_(alice_and_bob_s63_c_6_B_neg).
agent_(alice_and_bob_s63_c_6_B_neg,alice_s63_c_6_B_neg).
agent_(alice_and_bob_s63_c_6_B_neg,bob_s63_c_6_B_neg).
start_(alice_and_bob_s63_c_6_B_neg,d2017_02_03).
nonresident_alien_(alice_is_a_nra_s63_c_6_B_neg).
agent_(alice_is_a_nra_s63_c_6_B_neg,alice_s63_c_6_B_neg).
start_(alice_is_a_nra_s63_c_6_B_neg,d2015_08_23).
end_(alice_is_a_nra_s63_c_6_B_neg,d2016_08_15).

% Test
:- \+ s63_c_6_B(alice_s63_c_6_B_neg,2017).
:- halt.
