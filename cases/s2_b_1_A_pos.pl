% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice and Bob have a child, Charlie, born October 9th, 2000. Alice died on July 9th, 2014. From 2004 to 2019, Bob furnished the costs of maintaining the home where he and Charlie lived during that time. Charlie was a qualifying child of Bob under section 152(c) from 2004 to 2019.

% Question
% Section 2(b)(1)(A) applies to Bob in 2018. Entailment

% Facts
person(alice_s2_b_1_A_pos).
person(bob_s2_b_1_A_pos).
person(charlie_s2_b_1_A_pos).

year(1992).
date("1992-02-03").
date_split("1992-02-03",1992,2,3).
date("1992-01-01").
date_split("1992-01-01",1992,1,1).
date("1992-12-31").
date_split("1992-12-31",1992,12,31).

year(2000).
date("2000-10-09").
date_split("2000-10-09",2000,10,9).
date("2000-01-01").
date_split("2000-01-01",2000,1,1).
date("2000-12-31").
date_split("2000-12-31",2000,12,31).

year(2004).
date("2004-01-01").
date_split("2004-01-01",2004,1,1).
date("2004-12-31").
date_split("2004-12-31",2004,12,31).

year(2005).
date("2005-01-01").
date_split("2005-01-01",2005,1,1).
date("2005-12-31").
date_split("2005-12-31",2005,12,31).

year(2006).
date("2006-01-01").
date_split("2006-01-01",2006,1,1).
date("2006-12-31").
date_split("2006-12-31",2006,12,31).

year(2007).
date("2007-01-01").
date_split("2007-01-01",2007,1,1).
date("2007-12-31").
date_split("2007-12-31",2007,12,31).

year(2008).
date("2008-01-01").
date_split("2008-01-01",2008,1,1).
date("2008-12-31").
date_split("2008-12-31",2008,12,31).

year(2009).
date("2009-01-01").
date_split("2009-01-01",2009,1,1).
date("2009-12-31").
date_split("2009-12-31",2009,12,31).

year(2010).
date("2010-01-01").
date_split("2010-01-01",2010,1,1).
date("2010-12-31").
date_split("2010-12-31",2010,12,31).

year(2011).
date("2011-01-01").
date_split("2011-01-01",2011,1,1).
date("2011-12-31").
date_split("2011-12-31",2011,12,31).

year(2012).
date("2012-01-01").
date_split("2012-01-01",2012,1,1).
date("2012-12-31").
date_split("2012-12-31",2012,12,31).

year(2013).
date("2013-01-01").
date_split("2013-01-01",2013,1,1).
date("2013-12-31").
date_split("2013-12-31",2013,12,31).

year(2014).
date("2014-07-09").
date_split("2014-07-09",2014,7,9).
date("2014-01-01").
date_split("2014-01-01",2014,1,1).
date("2014-12-31").
date_split("2014-12-31",2014,12,31).

year(2015).
date("2015-01-01").
date_split("2015-01-01",2015,1,1).
date("2015-12-31").
date_split("2015-12-31",2015,12,31).

year(2016).
date("2016-01-01").
date_split("2016-01-01",2016,1,1).
date("2016-12-31").
date_split("2016-12-31",2016,12,31).

year(2017).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

year(2018).
date("2018-02-14").
date_split("2018-02-14",2018,2,14).
date("2018-01-01").
date_split("2018-01-01",2018,1,1).
date("2018-12-31").
date_split("2018-12-31",2018,12,31).

year(2019).
date("2019-01-01").
date_split("2019-01-01",2019,1,1).
date("2019-12-31").
date_split("2019-12-31",2019,12,31).

atom_concat('bob_maintains_household_s2_b_1_A_pos',2004,bob_maintains_household_s2_b_1_A_pos2004).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2005,bob_maintains_household_s2_b_1_A_pos2005).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2006,bob_maintains_household_s2_b_1_A_pos2006).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2007,bob_maintains_household_s2_b_1_A_pos2007).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2008,bob_maintains_household_s2_b_1_A_pos2008).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2009,bob_maintains_household_s2_b_1_A_pos2009).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2010,bob_maintains_household_s2_b_1_A_pos2010).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2011,bob_maintains_household_s2_b_1_A_pos2011).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2012,bob_maintains_household_s2_b_1_A_pos2012).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2013,bob_maintains_household_s2_b_1_A_pos2013).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2014,bob_maintains_household_s2_b_1_A_pos2014).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2015,bob_maintains_household_s2_b_1_A_pos2015).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2016,bob_maintains_household_s2_b_1_A_pos2016).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2017,bob_maintains_household_s2_b_1_A_pos2017).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2018,bob_maintains_household_s2_b_1_A_pos2018).
atom_concat('bob_maintains_household_s2_b_1_A_pos',2019,bob_maintains_household_s2_b_1_A_pos2019).

finance(1).

marriage_(alice_and_bob_s2_b_1_A_pos).
agent_(alice_and_bob_s2_b_1_A_pos,alice_s2_b_1_A_pos).
agent_(alice_and_bob_s2_b_1_A_pos,bob_s2_b_1_A_pos).
start_(alice_and_bob_s2_b_1_A_pos,"1992-02-03").
death_(alice_dies_s2_b_1_A_pos).
agent_(alice_dies_s2_b_1_A_pos,alice_s2_b_1_A_pos).
start_(alice_dies_s2_b_1_A_pos,"2014-07-09").
end_(alice_dies_s2_b_1_A_pos,"2014-07-09").
son_(charlie_is_son_s2_b_1_A_pos).
agent_(charlie_is_son_s2_b_1_A_pos,charlie_s2_b_1_A_pos).
patient_(charlie_is_son_s2_b_1_A_pos,alice_s2_b_1_A_pos).
patient_(charlie_is_son_s2_b_1_A_pos,bob_s2_b_1_A_pos).
start_(charlie_is_son_s2_b_1_A_pos,"2000-10-09").
residence_(charlie_and_bob_residence_s2_b_1_A_pos).
agent_(charlie_and_bob_residence_s2_b_1_A_pos,charlie_s2_b_1_A_pos).
agent_(charlie_and_bob_residence_s2_b_1_A_pos,bob_s2_b_1_A_pos).
patient_(charlie_and_bob_residence_s2_b_1_A_pos,bob_s_house_s2_b_1_A_pos).
start_(charlie_and_bob_residence_s2_b_1_A_pos,"2004-01-01").
end_(charlie_and_bob_residence_s2_b_1_A_pos,"2019-12-31").
bob_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2004,2019,Year),
    atom_concat('bob_maintains_household_s2_b_1_A_pos',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob_s2_b_1_A_pos) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,1) :- bob_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house_s2_b_1_A_pos) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).
s152_c(charlie_s2_b_1_A_pos,bob_s2_b_1_A_pos,Year) :- between(2004,2019,Year).

% Test
:- s2_b_1_A(bob_s2_b_1_A_pos,bob_s_house_s2_b_1_A_pos,charlie_s2_b_1_A_pos,2018).
:- halt.
