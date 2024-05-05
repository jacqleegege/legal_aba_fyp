% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob have a son, Charlie, who was born on September 16th, 2017. Alice and Charlie live in a home maintained by Alice since September 16th, 2017. Alice is entitled to a deduction for Charlie under section 151(c) for the years 2017 to 2019. Alice and Bob file a joint return for the years 2017 to 2019.

% Question
% Section 7703(b)(2) applies to Alice maintaining her home for the year 2018. Entailment

% Facts
person(alice_s7703_b_2_pos).
person(bob_s7703_b_2_pos).
person(charlie_s7703_b_2_pos).

year(2012).
date("2012-01-01").
date_split("2012-01-01", 2012, 1, 1).
date("2012-04-05").
date_split("2012-04-05", 2012, 4, 5).
date("2012-12-31").
date_split("2012-12-31", 2012, 12, 31).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-09-16").
date_split("2017-09-16", 2017, 9, 16).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

household(alice_s_house_s7703_b_2_pos).
finance(1).
finance(100).


marriage_(alice_and_bob_s7703_b_2_pos).
agent_(alice_and_bob_s7703_b_2_pos,alice_s7703_b_2_pos).
agent_(alice_and_bob_s7703_b_2_pos,bob_s7703_b_2_pos).
start_(alice_and_bob_s7703_b_2_pos,"2012-04-05").
son_(charlie_is_born_s7703_b_2_pos).
agent_(charlie_is_born_s7703_b_2_pos,charlie_s7703_b_2_pos).
patient_(charlie_is_born_s7703_b_2_pos,bob_s7703_b_2_pos).
patient_(charlie_is_born_s7703_b_2_pos,alice_s7703_b_2_pos).
start_(charlie_is_born_s7703_b_2_pos,"2017-09-16").
residence_(home_s7703_b_2_pos).
agent_(home_s7703_b_2_pos,alice_s7703_b_2_pos).
agent_(home_s7703_b_2_pos,charlie_s7703_b_2_pos).
patient_(home_s7703_b_2_pos,alice_s_house_s7703_b_2_pos).
start_(home_s7703_b_2_pos,"2017-09-16").

% NOTE: should be generated to 2117 + dates should be validated
alice_household_maintenance(2017,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2017',"2017-09-16","2017-12-31").
alice_household_maintenance(2018,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2018',"2018-01-01","2018-12-31").
alice_household_maintenance(2019,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2019',"2019-01-01","2019-12-31").
alice_household_maintenance(2020,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2020',"2020-01-01","2020-12-31").
alice_household_maintenance(2021,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2021',"2021-01-01","2021-12-31").
alice_household_maintenance(2022,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2022',"2022-01-01","2022-12-31").
alice_household_maintenance(2023,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2023',"2023-01-01","2023-12-31").
alice_household_maintenance(2024,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2024',"2024-01-01","2024-12-31").
alice_household_maintenance(2025,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2025',"2025-01-01","2025-12-31").
alice_household_maintenance(2026,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2026',"2026-01-01","2026-12-31").
alice_household_maintenance(2027,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2027',"2027-01-01","2027-12-31").
alice_household_maintenance(2028,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2028',"2028-01-01","2028-12-31").
alice_household_maintenance(2029,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2029',"2029-01-01","2029-12-31").
alice_household_maintenance(2030,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2030',"2030-01-01","2030-12-31").
alice_household_maintenance(2031,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2031',"2031-01-01","2031-12-31").
alice_household_maintenance(2032,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2032',"2032-01-01","2032-12-31").
alice_household_maintenance(2033,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2033',"2033-01-01","2033-12-31").
alice_household_maintenance(2034,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2034',"2034-01-01","2034-12-31").
alice_household_maintenance(2035,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2035',"2035-01-01","2035-12-31").
alice_household_maintenance(2036,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2036',"2036-01-01","2036-12-31").
alice_household_maintenance(2037,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2037',"2037-01-01","2037-12-31").
alice_household_maintenance(2038,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2038',"2038-01-01","2038-12-31").
alice_household_maintenance(2039,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2039',"2039-01-01","2039-12-31").
alice_household_maintenance(2040,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2040',"2040-01-01","2040-12-31").
alice_household_maintenance(2041,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2041',"2041-01-01","2041-12-31").
alice_household_maintenance(2042,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2042',"2042-01-01","2042-12-31").
alice_household_maintenance(2043,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2043',"2043-01-01","2043-12-31").
alice_household_maintenance(2044,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2044',"2044-01-01","2044-12-31").
alice_household_maintenance(2045,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2045',"2045-01-01","2045-12-31").
alice_household_maintenance(2046,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2046',"2046-01-01","2046-12-31").
alice_household_maintenance(2047,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2047',"2047-01-01","2047-12-31").
alice_household_maintenance(2048,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2048',"2048-01-01","2048-12-31").
alice_household_maintenance(2049,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2049',"2049-01-01","2049-12-31").
alice_household_maintenance(2050,'alice_maintains_household_s7703_b_2_poss7703_b_2_poss7703_b_2_poss7703_b_2_pos2050',"2050-01-01","2050-12-31").
% alice_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('alice_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day="2017-09-16"));first_day_year(Year,Start_day)),
%     last_day_year(Year,End_day).

payment_(Event) :- alice_household_maintenance(_,Event,_,_).
agent_(Event,alice_s7703_b_2_pos) :- alice_household_maintenance(_,Event,_,_).
amount_(Event,1) :- alice_household_maintenance(_,Event,_,_).
purpose_(Event,home_s7703_b_2_pos) :- alice_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- alice_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- alice_household_maintenance(_,Event,_,End_day).

joint_return_alice_and_bob(2017,'alice_and_bob_joint_return_2017',"2017-01-01","2017-12-31").
joint_return_alice_and_bob(2018,'alice_and_bob_joint_return_2017',"2018-01-01","2018-12-31").
joint_return_alice_and_bob(2019,'alice_and_bob_joint_return_2017',"2019-01-01","2019-12-31").

s151_c_applies(alice_s7703_b_2_pos,charlie_s7703_b_2_pos,Year) :- between(2017,2019,Year).
% joint_return_alice_and_bob(Year,Event,Start_day,End_day) :-
%     between(2017,2019,Year),
%     atom_concat('alice_and_bob_joint_return_',Year,Event),
%     first_day_year(Year,Start_day),
%     last_day_year(Year,End_day).
joint_return_(Event) :- joint_return_alice_and_bob(_,Event,_,_).
agent_(Event,alice_s7703_b_2_pos) :- joint_return_alice_and_bob(_,Event,_,_).
agent_(Event,bob_s7703_b_2_pos) :- joint_return_alice_and_bob(_,Event,_,_).
start_(Event,Day) :- joint_return_alice_and_bob(_,Event,Day,_).
end_(Event,Day) :- joint_return_alice_and_bob(_,Event,_,Day).

% Test
:- s7703_b_2(alice_s7703_b_2_pos,alice_s_house_s7703_b_2_pos,100,2018).
:- halt.
