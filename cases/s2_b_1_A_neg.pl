% Text
% Alice and Bob got married on Feb 3rd, 1992. Alice and Bob have a child, Charlie, born October 9th, 2000. Alice died on July 9th, 2014. From 2004 to 2019, Bob furnished 40% of the costs of maintaining the home where he and Charlie lived during that time. Charlie is not the dependent of Bob under section 152(b)(2).

% Question
% Section 2(b)(1)(A) applies to Bob in 2018. Contradiction

% Facts
person(alice).
person(bob).
person(charlie).
person(someone).

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

atom_concat('bob_maintains_household_',2004,bob_maintains_household_2004).
atom_concat('bob_maintains_household_',2005,bob_maintains_household_2005).
atom_concat('bob_maintains_household_',2006,bob_maintains_household_2006).
atom_concat('bob_maintains_household_',2007,bob_maintains_household_2007).
atom_concat('bob_maintains_household_',2008,bob_maintains_household_2008).
atom_concat('bob_maintains_household_',2009,bob_maintains_household_2009).
atom_concat('bob_maintains_household_',2010,bob_maintains_household_2010).
atom_concat('bob_maintains_household_',2011,bob_maintains_household_2011).
atom_concat('bob_maintains_household_',2012,bob_maintains_household_2012).
atom_concat('bob_maintains_household_',2013,bob_maintains_household_2013).
atom_concat('bob_maintains_household_',2014,bob_maintains_household_2014).
atom_concat('bob_maintains_household_',2015,bob_maintains_household_2015).
atom_concat('bob_maintains_household_',2016,bob_maintains_household_2016).
atom_concat('bob_maintains_household_',2017,bob_maintains_household_2017).
atom_concat('bob_maintains_household_',2018,bob_maintains_household_2018).
atom_concat('bob_maintains_household_',2019,bob_maintains_household_2019).

atom_concat('someone_maintains_household_',2004,someone_maintains_household_2004).
atom_concat('someone_maintains_household_',2005,someone_maintains_household_2005).
atom_concat('someone_maintains_household_',2006,someone_maintains_household_2006).
atom_concat('someone_maintains_household_',2007,someone_maintains_household_2007).
atom_concat('someone_maintains_household_',2008,someone_maintains_household_2008).
atom_concat('someone_maintains_household_',2009,someone_maintains_household_2009).
atom_concat('someone_maintains_household_',2010,someone_maintains_household_2010).
atom_concat('someone_maintains_household_',2011,someone_maintains_household_2011).
atom_concat('someone_maintains_household_',2012,someone_maintains_household_2012).
atom_concat('someone_maintains_household_',2013,someone_maintains_household_2013).
atom_concat('someone_maintains_household_',2014,someone_maintains_household_2014).
atom_concat('someone_maintains_household_',2015,someone_maintains_household_2015).
atom_concat('someone_maintains_household_',2016,someone_maintains_household_2016).
atom_concat('someone_maintains_household_',2017,someone_maintains_household_2017).
atom_concat('someone_maintains_household_',2018,someone_maintains_household_2018).
atom_concat('someone_maintains_household_',2019,someone_maintains_household_2019).

finance(40).
finance(60).

marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"1992-02-03").
death_(alice_dies).
agent_(alice_dies,alice).
start_(alice_dies,"2014-07-09").
end_(alice_dies,"2014-07-09").
son_(charlie_is_son).
agent_(charlie_is_son,charlie).
patient_(charlie_is_son,alice).
patient_(charlie_is_son,bob).
start_(charlie_is_son,"2000-10-09").
residence_(charlie_and_bob_residence).
agent_(charlie_and_bob_residence,charlie).
agent_(charlie_and_bob_residence,bob).
patient_(charlie_and_bob_residence,bob_s_house).
start_(charlie_and_bob_residence,"2004-01-01").
end_(charlie_and_bob_residence,"2019-12-31").
bob_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2004,2019,Year),
    atom_concat('bob_maintains_household_',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- bob_household_maintenance(_,Event,_,_).
agent_(Event,bob) :- bob_household_maintenance(_,Event,_,_).
amount_(Event,40) :- bob_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house) :- bob_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- bob_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- bob_household_maintenance(_,Event,_,End_day).
someone_household_maintenance(Year,Event,Start_day,End_day) :-
    between(2004,2019,Year),
    atom_concat('someone_maintains_household_',Year,Event),
    first_day_year(Year,Start_day),
    last_day_year(Year,End_day).
payment_(Event) :- someone_household_maintenance(_,Event,_,_).
agent_(Event,someone) :- someone_household_maintenance(_,Event,_,_).
amount_(Event,60) :- someone_household_maintenance(_,Event,_,_).
purpose_(Event,bob_s_house) :- someone_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- someone_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- someone_household_maintenance(_,Event,_,End_day).

% Test
:- \+ s2_b_1_A(bob,bob_s_house,charlie,2018).
:- halt.
