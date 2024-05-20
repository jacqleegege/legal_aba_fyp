% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice and Bob have a child, Charlie, born October 9th, 2000. Alice died on July 9th, 2014. From 2004 to 2019, Bob furnished the costs of maintaining the home where he and Charlie lived during that time.

% Question
% Section 2(b)(1)(A)(i) applies to Charlie in 2018. Entailment

% Facts
person(alice_s2_b_1_A_i_pos).
person(bob_s2_b_1_A_i_pos).
person(charlie_s2_b_1_A_i_pos).

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

year(2004).
date(d2004_01_01).
date_split(d2004_01_01,2004,1,1).
date(d2004_12_31).
date_split(d2004_12_31,2004,12,31).

year(2005).
date(d2005_01_01).
date_split(d2005_01_01,2005,1,1).
date(d2005_12_31).
date_split(d2005_12_31,2005,12,31).

year(2006).
date(d2006_01_01).
date_split(d2006_01_01,2006,1,1).
date(d2006_12_31).
date_split(d2006_12_31,2006,12,31).

year(2007).
date(d2007_01_01).
date_split(d2007_01_01,2007,1,1).
date(d2007_12_31).
date_split(d2007_12_31,2007,12,31).

year(2008).
date(d2008_01_01).
date_split(d2008_01_01,2008,1,1).
date(d2008_12_31).
date_split(d2008_12_31,2008,12,31).

year(2009).
date(d2009_01_01).
date_split(d2009_01_01,2009,1,1).
date(d2009_12_31).
date_split(d2009_12_31,2009,12,31).

year(2010).
date(d2010_01_01).
date_split(d2010_01_01,2010,1,1).
date(d2010_12_31).
date_split(d2010_12_31,2010,12,31).

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
date(d2014_07_09).
date_split(d2014_07_09,2014,7,9).
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

atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2004,bob_maintains_household_s2_b_1_A_i_pos2004).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2005,bob_maintains_household_s2_b_1_A_i_pos2005).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2006,bob_maintains_household_s2_b_1_A_i_pos2006).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2007,bob_maintains_household_s2_b_1_A_i_pos2007).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2008,bob_maintains_household_s2_b_1_A_i_pos2008).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2009,bob_maintains_household_s2_b_1_A_i_pos2009).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2010,bob_maintains_household_s2_b_1_A_i_pos2010).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2011,bob_maintains_household_s2_b_1_A_i_pos2011).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2012,bob_maintains_household_s2_b_1_A_i_pos2012).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2013,bob_maintains_household_s2_b_1_A_i_pos2013).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2014,bob_maintains_household_s2_b_1_A_i_pos2014).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2015,bob_maintains_household_s2_b_1_A_i_pos2015).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2016,bob_maintains_household_s2_b_1_A_i_pos2016).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2017,bob_maintains_household_s2_b_1_A_i_pos2017).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2018,bob_maintains_household_s2_b_1_A_i_pos2018).
atom_concat('bob_maintains_household_s2_b_1_A_i_pos',2019,bob_maintains_household_s2_b_1_A_i_pos2019).

finance(1).

marriage_(alice_and_bob_s2_b_1_A_i_pos).
agent_(alice_and_bob_s2_b_1_A_i_pos,alice_s2_b_1_A_i_pos).
agent_(alice_and_bob_s2_b_1_A_i_pos,bob_s2_b_1_A_i_pos).
start_(alice_and_bob_s2_b_1_A_i_pos,d1992_02_03).
death_(alice_dies_s2_b_1_A_i_pos).
agent_(alice_dies_s2_b_1_A_i_pos,alice_s2_b_1_A_i_pos).
start_(alice_dies_s2_b_1_A_i_pos,d2014_07_09).
end_(alice_dies_s2_b_1_A_i_pos,d2014_07_09).
son_(charlie_is_son_s2_b_1_A_i_pos).
agent_(charlie_is_son_s2_b_1_A_i_pos,charlie_s2_b_1_A_i_pos).
patient_(charlie_is_son_s2_b_1_A_i_pos,alice_s2_b_1_A_i_pos).
patient_(charlie_is_son_s2_b_1_A_i_pos,bob_s2_b_1_A_i_pos).
start_(charlie_is_son_s2_b_1_A_i_pos,d2000_10_09).
residence_(charlie_and_bob_residence_s2_b_1_A_i_pos).
agent_(charlie_and_bob_residence_s2_b_1_A_i_pos,charlie_s2_b_1_A_i_pos).
agent_(charlie_and_bob_residence_s2_b_1_A_i_pos,bob_s2_b_1_A_i_pos).
patient_(charlie_and_bob_residence_s2_b_1_A_i_pos,bob_s_house_s2_b_1_A_i_pos).
start_(charlie_and_bob_residence_s2_b_1_A_i_pos,d2004_01_01).
end_(charlie_and_bob_residence_s2_b_1_A_i_pos,d2019_12_31).
bob_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2004,2019,Year),
    atom_concat('bob_maintains_household_s2_b_1_A_i_pos',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob_s2_b_1_A_i_pos) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,1) :- bob_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house_s2_b_1_A_i_pos) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).

% Test
:- s2_b_1_A_i(bob_s2_b_1_A_i_pos,charlie_s2_b_1_A_i_pos,2018).
:- halt.
