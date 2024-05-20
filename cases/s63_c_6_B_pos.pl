% Text
% In 2017, Alice was paid $33200. Alice and Bob got married on Feb 3rd, 2017. Alice was a nonresident alien from August 23rd, 2016 to September 15th, 2018.

% Question
% Section 63(c)(6)(B) applies to Alice for 2017. Entailment

% Facts
person(alice_s63_c_6_B_pos).
person(bob_s63_c_6_B_pos).

year(2016).
date(d2016_08_15).
date_split(d2016_08_23,2016,8,23).
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
year(2018).
date(d2018_08_15).
date_split(d2018_08_15,2018,8,15).
date(d2018_01_01).
date_split(d2018_01_01,2018,1,1).
date(d2018_12_31).
date_split(d2018_12_31,2018,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_6_B_pos).
patient_(alice_is_paid_s63_c_6_B_pos,alice_s63_c_6_B_pos).
start_(alice_is_paid_s63_c_6_B_pos,d2017_12_31).
amount_(alice_is_paid_s63_c_6_B_pos,33200).
marriage_(alice_and_bob_s63_c_6_B_pos).
agent_(alice_and_bob_s63_c_6_B_pos,alice_s63_c_6_B_pos).
agent_(alice_and_bob_s63_c_6_B_pos,bob_s63_c_6_B_pos).
start_(alice_and_bob_s63_c_6_B_pos,d2017_02_03).
nonresident_alien_(alice_is_a_nra_s63_c_6_B_pos).
agent_(alice_is_a_nra_s63_c_6_B_pos,alice_s63_c_6_B_pos).
start_(alice_is_a_nra_s63_c_6_B_pos,d2016_08_23).
end_(alice_is_a_nra_s63_c_6_B_pos,d2018_08_15).

% Test
:- s63_c_6_B(alice_s63_c_6_B_pos,2017).
:- halt.
