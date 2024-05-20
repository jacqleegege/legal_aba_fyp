% Text
% Alice has a son, Bob. From September 1st, 2015 to November 3rd, 2019, Alice and Bob lived in the same home. Bob married Charlie on October 23rd, 2018. Bob satisfied section 152(c)(2) and 152(c)(3) with Alice as the taxpayer for the years 2015 to 2020.

% Question
% Under section 152(c)(1), Bob is a qualifying child of Alice for the year 2019. Entailment

% Facts
person(alice_s152_c_1_pos).
person(bob_s152_c_1_pos).
person(charlie_s152_c_1_pos).

year(2015).
date(d2015_09_01).
date_split(d2015_09_01, 2015, 9, 1).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2016).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

year(2017).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

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

year(2020).
date_split(d2020_01_01, 2020, 1, 1).
date(d2020_12_31).
date_split(d2020_12_31, 2020, 12, 31).

son_(bob_is_son_s152_c_1_pos).
agent_(bob_is_son_s152_c_1_pos,bob_s152_c_1_pos).
patient_(bob_is_son_s152_c_1_pos,alice_s152_c_1_pos).
residence_(alice_and_bob_s152_c_1_pos).
agent_(alice_and_bob_s152_c_1_pos,alice_s152_c_1_pos).
agent_(alice_and_bob_s152_c_1_pos,bob_s152_c_1_pos).
patient_(alice_and_bob_s152_c_1_pos,home_s152_c_1_pos).
start_(alice_and_bob_s152_c_1_pos,d2015_09_01).
end_(alice_and_bob_s152_c_1_pos,d2019_11_03).
marriage_(bob_and_charlie_s152_c_1_pos).
agent_(bob_and_charlie_s152_c_1_pos,bob_s152_c_1_pos).
agent_(bob_and_charlie_s152_c_1_pos,charlie_s152_c_1_pos).
start_(bob_and_charlie_s152_c_1_pos,d2018_10_23).
s152_c_2(bob_s152_c_1_pos,alice_s152_c_1_pos,d2015_01_01,"2020-12-31").
s152_c_3(bob_s152_c_1_pos,alice_s152_c_1_pos,Year) :- between(2015,2020,Year).

% Test
:- s152_c_1(bob_s152_c_1_pos,alice_s152_c_1_pos,2019).
:- halt.
