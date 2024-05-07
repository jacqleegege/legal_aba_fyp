% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice died on July 9th, 2014. From 2015 to 2019, Bob furnished the costs of maintaining the home where he and and his friend Charlie lived during that time. Charlie is a dependent of Bob under section 152(d)(2)(H) for the years 2015 to 2019. Bob earned $300000 every year from 2015 to 2019.

% Question
% Section 2(b)(3)(B) applies to Bob as the taxpayer and Charlie as the individual in 2018. Entailment

% Facts
person(alice_s2_b_3_B_pos).
person(bob_s2_b_3_B_pos).
person(charlie_s2_b_3_B_pos).

year(1992).
date("1992-02-03").
date_split("1992-02-03",1992,2,3).
date("1992-01-01").
date_split("1992-01-01",1992,1,1).
date("1992-12-31").
date_split("1992-12-31",1992,12,31).

year(2000).
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
date("2018-01-01").
date_split("2018-01-01",2018,1,1).
date("2018-12-31").
date_split("2018-12-31",2018,12,31).

year(2019).
date("2019-01-01").
date_split("2019-01-01",2019,1,1).
date("2019-12-31").
date_split("2019-12-31",2019,12,31).

atom_concat('bob_maintains_household_s2_b_3_B_pos',2015,bob_maintains_household_s2_b_3_B_pos2015).
atom_concat('bob_maintains_household_s2_b_3_B_pos',2016,bob_maintains_household_s2_b_3_B_pos2016).
atom_concat('bob_maintains_household_s2_b_3_B_pos',2017,bob_maintains_household_s2_b_3_B_pos2017).
atom_concat('bob_maintains_household_s2_b_3_B_pos',2018,bob_maintains_household_s2_b_3_B_pos2018).
atom_concat('bob_maintains_household_s2_b_3_B_pos',2019,bob_maintains_household_s2_b_3_B_pos2019).

atom_concat('bob_income_s2_b_3_B_pos',2015,bob_income_s2_b_3_B_pos2015).
atom_concat('bob_income_s2_b_3_B_pos',2016,bob_income_s2_b_3_B_pos2016_s2_b_3_B_pos).
atom_concat('bob_income_s2_b_3_B_pos',2017,bob_income_s2_b_3_B_pos2017).
atom_concat('bob_income_s2_b_3_B_pos',2018,bob_income_s2_b_3_B_pos2018).
atom_concat('bob_income_s2_b_3_B_pos',2019,bob_income_s2_b_3_B_pos2019).

finance(1).
finance(300000).

marriage_(alice_and_bob_s2_b_3_B_pos).
agent_(alice_and_bob_s2_b_3_B_pos,alice_s2_b_3_B_pos).
agent_(alice_and_bob_s2_b_3_B_pos,bob_s2_b_3_B_pos).
start_(alice_and_bob_s2_b_3_B_pos,"1992-02-03").
death_(alice_dies_s2_b_3_B_pos).
agent_(alice_dies_s2_b_3_B_pos,alice_s2_b_3_B_pos).
start_(alice_dies_s2_b_3_B_pos,"2014-07-09").
end_(alice_dies_s2_b_3_B_pos,"2014-07-09").
residence_(charlie_and_bob_residence_s2_b_3_B_pos).
agent_(charlie_and_bob_residence_s2_b_3_B_pos,charlie_s2_b_3_B_pos).
agent_(charlie_and_bob_residence_s2_b_3_B_pos,bob_s2_b_3_B_pos).
patient_(charlie_and_bob_residence_s2_b_3_B_pos,bob_s_house_s2_b_3_B_pos).
start_(charlie_and_bob_residence_s2_b_3_B_pos,"2004-01-01").
end_(charlie_and_bob_residence_s2_b_3_B_pos,"2019-12-31").
bob_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2015,2019,Year),
    atom_concat('bob_maintains_household_s2_b_3_B_pos',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob_s2_b_3_B_pos) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,1) :- bob_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house_s2_b_3_B_pos) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).
s152_d_2_H(charlie_s2_b_3_B_pos,bob_s2_b_3_B_pos,Year,_,Start_day,End_day) :-
    between(2015,2019,Year),first_day_year(Year,Start_day),last_day_year(Year,End_day).
bob_income(Year,Event,Start_day,End_day) :-
    between(2015,2019,Year),
    atom_concat('bob_income_s2_b_3_B_pos',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
income_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob_s2_b_3_B_pos) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,300000) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).

% Test
:- s2_b_3_B(bob_s2_b_3_B_pos,charlie_s2_b_3_B_pos,2018).
:- halt.
