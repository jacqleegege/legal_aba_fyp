% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice has a child, Charlie, born October 9th, 2000. Alice died on July 9th, 2021. From 2011 to 2024, Bob furnished the costs of maintaining the home where he and Charlie lived during that time. In 2020, Charlie filed a joint return with his spouse whom he married on Dec 1st, 2019. Charlie earned $312489 in 2020.

% Question
% Section 2(a)(1)(B) applies to Bob in 2020. Contradiction

% Facts
person(alice_s2_a_1_B_neg).
person(bob_s2_a_1_B_neg).
person(charlie_s2_a_1_B_neg).

year(1992).
date(d1992_02_03).
date_split(d1992_02_03,1992,2,3).
date(d1992_01_01).
date_split(d1992_01_01,1992,1,1).
date(d1992_12_31).
date_split(d1992_12_31,1992,12,31).

year(2000).
date(d2000_10_09).
date_split(d2000_10_09,2000,10,9).
date(d2000_01_01).
date_split(d2000_01_01,2000,1,1).
date(d2000_12_31).
date_split(d2000_12_31,2000,12,31).

year(2011).
date(d2011_01_01).
date_split(d2011_01_01,2011,1,1).
date(d2011_12_31).
date_split(d2011_12_31,2011,12,31).

year(2012).
date(d2012_01_01).
date_split(d2012_01_01,2012,1,1).
date(d2012_12_31).
date_split(d2012_12_31,2012,12,31).

year(2013).
date(d2013_01_01).
date_split(d2013_01_01,2013,1,1).
date(d2013_12_31).
date_split(d2013_12_31,2013,12,31).

year(2014).
date(d2014_01_01).
date_split(d2014_01_01,2014,1,1).
date(d2014_12_31).
date_split(d2014_12_31,2014,12,31).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01,2015,1,1).
date(d2015_12_31).
date_split(d2015_12_31,2015,12,31).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01,2016,1,1).
date(d2016_12_31).
date_split(d2016_12_31,2016,12,31).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01,2018,1,1).
date(d2018_12_31).
date_split(d2018_12_31,2018,12,31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01,2019,1,1).
date(d2019_12_31).
date_split(d2019_12_31,2019,12,31).

year(2020).
date(d2020_01_01).
date_split(d2020_01_01,2020,1,1).
date(d2020_12_31).
date_split(d2020_12_31,2020,12,31).

year(2021).
date(d2021_07_09).
date_split(d2021_07_09,2021,7,9).
date(d2021_01_01).
date_split(d2021_01_01,2021,1,1).
date(d2021_12_31).
date_split(d2021_12_31,2021,12,31).

year(2022).
date(d2022_01_01).
date_split(d2022_01_01,2022,1,1).
date(d2022_12_31).
date_split(d2022_12_31,2022,12,31).

year(2023).
date(d2023_01_01).
date_split(d2023_01_01,2023,1,1).
date(d2023_12_31).
date_split(d2023_12_31,2023,12,31).

year(2024).
date(d2024_01_01).
date_split(d2024_01_01,2024,1,1).
date(d2024_12_31).
date_split(d2024_12_31,2024,12,31).

finance(1).
finance(312489).

atom_concat('bob_maintains_household_s2_a_1_B_neg', 2011, bob_maintains_household_s2_a_1_B_neg2011).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2012, bob_maintains_household_s2_a_1_B_neg2012).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2013, bob_maintains_household_s2_a_1_B_neg2013).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2014, bob_maintains_household_s2_a_1_B_neg2014).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2015, bob_maintains_household_s2_a_1_B_neg2015).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2016, bob_maintains_household_s2_a_1_B_neg2016).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2017, bob_maintains_household_s2_a_1_B_neg2017).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2018, bob_maintains_household_s2_a_1_B_neg2018).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2019, bob_maintains_household_s2_a_1_B_neg2019).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2020, bob_maintains_household_s2_a_1_B_neg2020).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2021, bob_maintains_household_s2_a_1_B_neg2021).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2022, bob_maintains_household_s2_a_1_B_neg2022).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2023, bob_maintains_household_s2_a_1_B_neg2023).
atom_concat('bob_maintains_household_s2_a_1_B_neg', 2024, bob_maintains_household_s2_a_1_B_neg2024).

marriage_(alice_and_bob_s2_a_1_B_neg).
agent_(alice_and_bob_s2_a_1_B_neg,alice_s2_a_1_B_neg).
agent_(alice_and_bob_s2_a_1_B_neg,bob_s2_a_1_B_neg).
start_(alice_and_bob_s2_a_1_B_neg,d1992_02_03).
death_(alice_dies_s2_a_1_B_neg).
agent_(alice_dies_s2_a_1_B_neg,alice_s2_a_1_B_neg).
start_(alice_dies_s2_a_1_B_neg,d2021_07_09).
son_(charlie_is_son_s2_a_1_B_neg).
agent_(charlie_is_son_s2_a_1_B_neg,charlie_s2_a_1_B_neg).
patient_(charlie_is_son_s2_a_1_B_neg,alice_s2_a_1_B_neg).
start_(charlie_is_son_s2_a_1_B_neg,d2000_10_09).
residence_(charlie_and_bob_residence_s2_a_1_B_neg).
agent_(charlie_and_bob_residence_s2_a_1_B_neg,charlie_s2_a_1_B_neg).
agent_(charlie_and_bob_residence_s2_a_1_B_neg,bob_s2_a_1_B_neg).
patient_(charlie_and_bob_residence_s2_a_1_B_neg,bob_s_house_s2_a_1_B_neg).
start_(charlie_and_bob_residence_s2_a_1_B_neg,d2011_01_01).
end_(charlie_and_bob_residence_s2_a_1_B_neg,d2024_12_31).
bob_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2011,2024,Year),
    atom_concat('bob_maintains_household_s2_a_1_B_neg',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob_s2_a_1_B_neg) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,1) :- bob_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house_s2_a_1_B_neg) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).
marriage_(charlie_marriage_s2_a_1_B_neg).
agent_(charlie_marriage_s2_a_1_B_neg,charlie_s2_a_1_B_neg).
agent_(charlie_marriage_s2_a_1_B_neg,spouse_s2_a_1_B_neg).
start_(charlie_marriage_s2_a_1_B_neg,d2019_12_01).
joint_return_(charlie_and_spouse_joint_return_s2_a_1_B_neg).
agent_(charlie_and_spouse_joint_return_s2_a_1_B_neg,charlie_s2_a_1_B_neg).
agent_(charlie_and_spouse_joint_return_s2_a_1_B_neg,spouse_s2_a_1_B_neg).
start_(charlie_and_spouse_joint_return_s2_a_1_B_neg,d2020_01_01).
end_(charlie_and_spouse_joint_return_s2_a_1_B_neg,d2020_12_31).
income_(charlie_makes_money_s2_a_1_B_neg).
agent_(charlie_makes_money_s2_a_1_B_neg,charlie_s2_a_1_B_neg).
amount_(charlie_makes_money_s2_a_1_B_neg,312489).
start_(charlie_makes_money_s2_a_1_B_neg,d2020_12_31).

% Test
:- \+ s2_a_1_B(bob_s2_a_1_B_neg,bob_s_house_s2_a_1_B_neg,charlie_s2_a_1_B_neg,2020).
:- halt.
