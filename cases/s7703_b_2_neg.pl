% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob have a son, Charlie, who was born on September 16th, 2017. Alice and Charlie live in a home for which Alice furnished 40% of the maintenance costs, since September 16th, 2017. Alice is entitled to a deduction for Charlie under section 151(c) for the years 2017 to 2019.

% Question
% Section 7703(b)(2) applies to Alice maintaining her home for the year 2018. Contradiction

% Facts
person(alice_s7703_b_2_neg).
person(bob_s7703_b_2_neg).
person(charlie_s7703_b_2_neg).

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

household(alice_s_house_s7703_b_2_neg).
finance(60).
finance(40).
finance(4000).

marriage_(alice_and_bob_s7703_b_2_neg).
agent_(alice_and_bob_s7703_b_2_neg,alice_s7703_b_2_neg).
agent_(alice_and_bob_s7703_b_2_neg,bob_s7703_b_2_neg).
start_(alice_and_bob_s7703_b_2_neg,"2012-04-05").
son_(charlie_is_born_s7703_b_2_neg).
agent_(charlie_is_born_s7703_b_2_neg,charlie_s7703_b_2_neg).
patient_(charlie_is_born_s7703_b_2_neg,bob_s7703_b_2_neg).
patient_(charlie_is_born_s7703_b_2_neg,alice_s7703_b_2_neg).
start_(charlie_is_born_s7703_b_2_neg,"2017-09-16").
residence_(home_s7703_b_2_neg).
agent_(home_s7703_b_2_neg,alice_s7703_b_2_neg).
agent_(home_s7703_b_2_neg,charlie_s7703_b_2_neg).
patient_(home_s7703_b_2_neg,alice_s_house_s7703_b_2_neg).
start_(home_s7703_b_2_neg,"2017-09-16").
% NOTE: should be generated to 2117 + dates should be validated
someone_household_maintenance(2017,'someone_maintains_household_s7703_b_2_neg2017',"2017-09-16","2017-12-31").
someone_household_maintenance(2018,'someone_maintains_household_s7703_b_2_neg2018',"2018-01-01","2018-12-31").
someone_household_maintenance(2019,'someone_maintains_household_s7703_b_2_neg2019',"2019-01-01","2019-12-31").
someone_household_maintenance(2020,'someone_maintains_household_s7703_b_2_neg2020',"2020-01-01","2020-12-31").
someone_household_maintenance(2021,'someone_maintains_household_s7703_b_2_neg2021',"2021-01-01","2021-12-31").
someone_household_maintenance(2022,'someone_maintains_household_s7703_b_2_neg2022',"2022-01-01","2022-12-31").
someone_household_maintenance(2023,'someone_maintains_household_s7703_b_2_neg2023',"2023-01-01","2023-12-31").
someone_household_maintenance(2024,'someone_maintains_household_s7703_b_2_neg2024',"2024-01-01","2024-12-31").
someone_household_maintenance(2025,'someone_maintains_household_s7703_b_2_neg2025',"2025-01-01","2025-12-31").
someone_household_maintenance(2026,'someone_maintains_household_s7703_b_2_neg2026',"2026-01-01","2026-12-31").
someone_household_maintenance(2027,'someone_maintains_household_s7703_b_2_neg2027',"2027-01-01","2027-12-31").
someone_household_maintenance(2028,'someone_maintains_household_s7703_b_2_neg2028',"2028-01-01","2028-12-31").
someone_household_maintenance(2029,'someone_maintains_household_s7703_b_2_neg2029',"2029-01-01","2029-12-31").
someone_household_maintenance(2030,'someone_maintains_household_s7703_b_2_neg2030',"2030-01-01","2030-12-31").
someone_household_maintenance(2031,'someone_maintains_household_s7703_b_2_neg2031',"2031-01-01","2031-12-31").
someone_household_maintenance(2032,'someone_maintains_household_s7703_b_2_neg2032',"2032-01-01","2032-12-31").
someone_household_maintenance(2033,'someone_maintains_household_s7703_b_2_neg2033',"2033-01-01","2033-12-31").
someone_household_maintenance(2034,'someone_maintains_household_s7703_b_2_neg2034',"2034-01-01","2034-12-31").
someone_household_maintenance(2035,'someone_maintains_household_s7703_b_2_neg2035',"2035-01-01","2035-12-31").
someone_household_maintenance(2036,'someone_maintains_household_s7703_b_2_neg2036',"2036-01-01","2036-12-31").
someone_household_maintenance(2037,'someone_maintains_household_s7703_b_2_neg2037',"2037-01-01","2037-12-31").
someone_household_maintenance(2038,'someone_maintains_household_s7703_b_2_neg2038',"2038-01-01","2038-12-31").
someone_household_maintenance(2039,'someone_maintains_household_s7703_b_2_neg2039',"2039-01-01","2039-12-31").
someone_household_maintenance(2040,'someone_maintains_household_s7703_b_2_neg2040',"2040-01-01","2040-12-31").
someone_household_maintenance(2041,'someone_maintains_household_s7703_b_2_neg2041',"2041-01-01","2041-12-31").
someone_household_maintenance(2042,'someone_maintains_household_s7703_b_2_neg2042',"2042-01-01","2042-12-31").
someone_household_maintenance(2043,'someone_maintains_household_s7703_b_2_neg2043',"2043-01-01","2043-12-31").
someone_household_maintenance(2044,'someone_maintains_household_s7703_b_2_neg2044',"2044-01-01","2044-12-31").
someone_household_maintenance(2045,'someone_maintains_household_s7703_b_2_neg2045',"2045-01-01","2045-12-31").
someone_household_maintenance(2046,'someone_maintains_household_s7703_b_2_neg2046',"2046-01-01","2046-12-31").
someone_household_maintenance(2047,'someone_maintains_household_s7703_b_2_neg2047',"2047-01-01","2047-12-31").
someone_household_maintenance(2048,'someone_maintains_household_s7703_b_2_neg2048',"2048-01-01","2048-12-31").
someone_household_maintenance(2049,'someone_maintains_household_s7703_b_2_neg2049',"2049-01-01","2049-12-31").
someone_household_maintenance(2050,'someone_maintains_household_s7703_b_2_neg2050',"2050-01-01","2050-12-31").

% someone_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('someone_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day="2017-09-16"));first_day_year(Year,Start_day)),
%     last_day_year(Year,End_day).

payment_(Event) :- someone_household_maintenance(_,Event,_,_).
agent_(Event,someone) :- someone_household_maintenance(_,Event,_,_).
amount_(Event,60) :- someone_household_maintenance(_,Event,_,_).
purpose_(Event,home_s7703_b_2_neg) :- someone_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- someone_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- someone_household_maintenance(_,Event,_,End_day).

% NOTE: should be generated to 2117 + dates should be validated
alice_household_maintenance(2017,'alice_maintains_household_s7703_b_2_neg2017',"2017-09-16","2017-12-31").
alice_household_maintenance(2018,'alice_maintains_household_s7703_b_2_neg2018',"2018-01-01","2018-12-31").
alice_household_maintenance(2019,'alice_maintains_household_s7703_b_2_neg2019',"2019-01-01","2019-12-31").
alice_household_maintenance(2020,'alice_maintains_household_s7703_b_2_neg2020',"2020-01-01","2020-12-31").
alice_household_maintenance(2021,'alice_maintains_household_s7703_b_2_neg2021',"2021-01-01","2021-12-31").
alice_household_maintenance(2022,'alice_maintains_household_s7703_b_2_neg2022',"2022-01-01","2022-12-31").
alice_household_maintenance(2023,'alice_maintains_household_s7703_b_2_neg2023',"2023-01-01","2023-12-31").
alice_household_maintenance(2024,'alice_maintains_household_s7703_b_2_neg2024',"2024-01-01","2024-12-31").
alice_household_maintenance(2025,'alice_maintains_household_s7703_b_2_neg2025',"2025-01-01","2025-12-31").
alice_household_maintenance(2026,'alice_maintains_household_s7703_b_2_neg2026',"2026-01-01","2026-12-31").
alice_household_maintenance(2027,'alice_maintains_household_s7703_b_2_neg2027',"2027-01-01","2027-12-31").
alice_household_maintenance(2028,'alice_maintains_household_s7703_b_2_neg2028',"2028-01-01","2028-12-31").
alice_household_maintenance(2029,'alice_maintains_household_s7703_b_2_neg2029',"2029-01-01","2029-12-31").
alice_household_maintenance(2030,'alice_maintains_household_s7703_b_2_neg2030',"2030-01-01","2030-12-31").
alice_household_maintenance(2031,'alice_maintains_household_s7703_b_2_neg2031',"2031-01-01","2031-12-31").
alice_household_maintenance(2032,'alice_maintains_household_s7703_b_2_neg2032',"2032-01-01","2032-12-31").
alice_household_maintenance(2033,'alice_maintains_household_s7703_b_2_neg2033',"2033-01-01","2033-12-31").
alice_household_maintenance(2034,'alice_maintains_household_s7703_b_2_neg2034',"2034-01-01","2034-12-31").
alice_household_maintenance(2035,'alice_maintains_household_s7703_b_2_neg2035',"2035-01-01","2035-12-31").
alice_household_maintenance(2036,'alice_maintains_household_s7703_b_2_neg2036',"2036-01-01","2036-12-31").
alice_household_maintenance(2037,'alice_maintains_household_s7703_b_2_neg2037',"2037-01-01","2037-12-31").
alice_household_maintenance(2038,'alice_maintains_household_s7703_b_2_neg2038',"2038-01-01","2038-12-31").
alice_household_maintenance(2039,'alice_maintains_household_s7703_b_2_neg2039',"2039-01-01","2039-12-31").
alice_household_maintenance(2040,'alice_maintains_household_s7703_b_2_neg2040',"2040-01-01","2040-12-31").
alice_household_maintenance(2041,'alice_maintains_household_s7703_b_2_neg2041',"2041-01-01","2041-12-31").
alice_household_maintenance(2042,'alice_maintains_household_s7703_b_2_neg2042',"2042-01-01","2042-12-31").
alice_household_maintenance(2043,'alice_maintains_household_s7703_b_2_neg2043',"2043-01-01","2043-12-31").
alice_household_maintenance(2044,'alice_maintains_household_s7703_b_2_neg2044',"2044-01-01","2044-12-31").
alice_household_maintenance(2045,'alice_maintains_household_s7703_b_2_neg2045',"2045-01-01","2045-12-31").
alice_household_maintenance(2046,'alice_maintains_household_s7703_b_2_neg2046',"2046-01-01","2046-12-31").
alice_household_maintenance(2047,'alice_maintains_household_s7703_b_2_neg2047',"2047-01-01","2047-12-31").
alice_household_maintenance(2048,'alice_maintains_household_s7703_b_2_neg2048',"2048-01-01","2048-12-31").
alice_household_maintenance(2049,'alice_maintains_household_s7703_b_2_neg2049',"2049-01-01","2049-12-31").
alice_household_maintenance(2050,'alice_maintains_household_s7703_b_2_neg2050',"2050-01-01","2050-12-31").
% alice_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('alice_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day="2017-09-16"));first_day_year(Year,Start_day)),
%     last_day_year(Year,End_day).
payment_(Event) :- alice_household_maintenance(_,Event,_,_).
agent_(Event,alice_s7703_b_2_neg) :- alice_household_maintenance(_,Event,_,_).
amount_(Event,40) :- alice_household_maintenance(_,Event,_,_).
purpose_(Event,home_s7703_b_2_neg) :- alice_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- alice_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- alice_household_maintenance(_,Event,_,End_day).
s151_c_applies(alice_s7703_b_2_neg,charlie_s7703_b_2_neg,Year) :- between(2017,2019,Year).

% Test
:- \+ s7703_b_2(alice_s7703_b_2_neg,alice_s_house_s7703_b_2_neg,4000,2018).
:- halt.
