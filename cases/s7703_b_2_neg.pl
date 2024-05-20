% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob have a son, Charlie, who was born on September 16th, 2017. Alice and Charlie live in a home for which Alice furnished 40% of the maintenance costs, since September 16th, 2017. Alice is entitled to a deduction for Charlie under section 151(c) for the years 2017 to 2019.

% Question
% Section 7703(b)(2) applies to Alice maintaining her home for the year 2018. Contradiction

% Facts
person(alice_s7703_b_2_neg).
person(bob_s7703_b_2_neg).
person(charlie_s7703_b_2_neg).

year(2012).
date(d2012_01_01).
date_split(d2012_01_01, 2012, 1, 1).
date(d2012_04_05).
date_split(d2012_04_05, 2012, 4, 5).
date(d2012_12_31).
date_split(d2012_12_31, 2012, 12, 31).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_09_16).
date_split(d2017_09_16, 2017, 9, 16).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

household(alice_s_house_s7703_b_2_neg).
finance(60).
finance(40).
finance(4000).

marriage_(alice_and_bob_s7703_b_2_neg).
agent_(alice_and_bob_s7703_b_2_neg,alice_s7703_b_2_neg).
agent_(alice_and_bob_s7703_b_2_neg,bob_s7703_b_2_neg).
start_(alice_and_bob_s7703_b_2_neg,d2012_04_05).
son_(charlie_is_born_s7703_b_2_neg).
agent_(charlie_is_born_s7703_b_2_neg,charlie_s7703_b_2_neg).
patient_(charlie_is_born_s7703_b_2_neg,bob_s7703_b_2_neg).
patient_(charlie_is_born_s7703_b_2_neg,alice_s7703_b_2_neg).
start_(charlie_is_born_s7703_b_2_neg,d2017_09_16).
residence_(home_s7703_b_2_neg).
agent_(home_s7703_b_2_neg,alice_s7703_b_2_neg).
agent_(home_s7703_b_2_neg,charlie_s7703_b_2_neg).
patient_(home_s7703_b_2_neg,alice_s_house_s7703_b_2_neg).
start_(home_s7703_b_2_neg,d2017_09_16).
% NOTE: should be generated to 2117 + dates should be validated
someone_household_maintenance(2017,'someone_maintains_household_s7703_b_2_neg2017',d2017_09_16,"2017-12-31").
someone_household_maintenance(2018,'someone_maintains_household_s7703_b_2_neg2018',d2018_01_01,"2018-12-31").
someone_household_maintenance(2019,'someone_maintains_household_s7703_b_2_neg2019',d2019_01_01,"2019-12-31").
someone_household_maintenance(2020,'someone_maintains_household_s7703_b_2_neg2020',d2020_01_01,"2020-12-31").
someone_household_maintenance(2021,'someone_maintains_household_s7703_b_2_neg2021',d2021_01_01,"2021-12-31").
someone_household_maintenance(2022,'someone_maintains_household_s7703_b_2_neg2022',d2022_01_01,"2022-12-31").
someone_household_maintenance(2023,'someone_maintains_household_s7703_b_2_neg2023',d2023_01_01,"2023-12-31").
someone_household_maintenance(2024,'someone_maintains_household_s7703_b_2_neg2024',d2024_01_01,"2024-12-31").
someone_household_maintenance(2025,'someone_maintains_household_s7703_b_2_neg2025',d2025_01_01,"2025-12-31").
someone_household_maintenance(2026,'someone_maintains_household_s7703_b_2_neg2026',d2026_01_01,"2026-12-31").
someone_household_maintenance(2027,'someone_maintains_household_s7703_b_2_neg2027',d2027_01_01,"2027-12-31").
someone_household_maintenance(2028,'someone_maintains_household_s7703_b_2_neg2028',d2028_01_01,"2028-12-31").
someone_household_maintenance(2029,'someone_maintains_household_s7703_b_2_neg2029',d2029_01_01,"2029-12-31").
someone_household_maintenance(2030,'someone_maintains_household_s7703_b_2_neg2030',d2030_01_01,"2030-12-31").
someone_household_maintenance(2031,'someone_maintains_household_s7703_b_2_neg2031',d2031_01_01,"2031-12-31").
someone_household_maintenance(2032,'someone_maintains_household_s7703_b_2_neg2032',d2032_01_01,"2032-12-31").
someone_household_maintenance(2033,'someone_maintains_household_s7703_b_2_neg2033',d2033_01_01,"2033-12-31").
someone_household_maintenance(2034,'someone_maintains_household_s7703_b_2_neg2034',d2034_01_01,"2034-12-31").
someone_household_maintenance(2035,'someone_maintains_household_s7703_b_2_neg2035',d2035_01_01,"2035-12-31").
someone_household_maintenance(2036,'someone_maintains_household_s7703_b_2_neg2036',d2036_01_01,"2036-12-31").
someone_household_maintenance(2037,'someone_maintains_household_s7703_b_2_neg2037',d2037_01_01,"2037-12-31").
someone_household_maintenance(2038,'someone_maintains_household_s7703_b_2_neg2038',d2038_01_01,"2038-12-31").
someone_household_maintenance(2039,'someone_maintains_household_s7703_b_2_neg2039',d2039_01_01,"2039-12-31").
someone_household_maintenance(2040,'someone_maintains_household_s7703_b_2_neg2040',d2040_01_01,"2040-12-31").
someone_household_maintenance(2041,'someone_maintains_household_s7703_b_2_neg2041',d2041_01_01,"2041-12-31").
someone_household_maintenance(2042,'someone_maintains_household_s7703_b_2_neg2042',d2042_01_01,"2042-12-31").
someone_household_maintenance(2043,'someone_maintains_household_s7703_b_2_neg2043',d2043_01_01,"2043-12-31").
someone_household_maintenance(2044,'someone_maintains_household_s7703_b_2_neg2044',d2044_01_01,"2044-12-31").
someone_household_maintenance(2045,'someone_maintains_household_s7703_b_2_neg2045',d2045_01_01,"2045-12-31").
someone_household_maintenance(2046,'someone_maintains_household_s7703_b_2_neg2046',d2046_01_01,"2046-12-31").
someone_household_maintenance(2047,'someone_maintains_household_s7703_b_2_neg2047',d2047_01_01,"2047-12-31").
someone_household_maintenance(2048,'someone_maintains_household_s7703_b_2_neg2048',d2048_01_01,"2048-12-31").
someone_household_maintenance(2049,'someone_maintains_household_s7703_b_2_neg2049',d2049_01_01,"2049-12-31").
someone_household_maintenance(2050,'someone_maintains_household_s7703_b_2_neg2050',d2050_01_01,"2050-12-31").

% someone_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('someone_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day=d2017_09_16));first_day_year(Year,Start_day)),
%     last_day_year(Year,End_day).

payment_(Event) :- someone_household_maintenance(_,Event,_,_).
agent_(Event,someone) :- someone_household_maintenance(_,Event,_,_).
amount_(Event,60) :- someone_household_maintenance(_,Event,_,_).
purpose_(Event,home_s7703_b_2_neg) :- someone_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- someone_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- someone_household_maintenance(_,Event,_,End_day).

% NOTE: should be generated to 2117 + dates should be validated
alice_household_maintenance(2017,'alice_maintains_household_s7703_b_2_neg2017',d2017_09_16,"2017-12-31").
alice_household_maintenance(2018,'alice_maintains_household_s7703_b_2_neg2018',d2018_01_01,"2018-12-31").
alice_household_maintenance(2019,'alice_maintains_household_s7703_b_2_neg2019',d2019_01_01,"2019-12-31").
alice_household_maintenance(2020,'alice_maintains_household_s7703_b_2_neg2020',d2020_01_01,"2020-12-31").
alice_household_maintenance(2021,'alice_maintains_household_s7703_b_2_neg2021',d2021_01_01,"2021-12-31").
alice_household_maintenance(2022,'alice_maintains_household_s7703_b_2_neg2022',d2022_01_01,"2022-12-31").
alice_household_maintenance(2023,'alice_maintains_household_s7703_b_2_neg2023',d2023_01_01,"2023-12-31").
alice_household_maintenance(2024,'alice_maintains_household_s7703_b_2_neg2024',d2024_01_01,"2024-12-31").
alice_household_maintenance(2025,'alice_maintains_household_s7703_b_2_neg2025',d2025_01_01,"2025-12-31").
alice_household_maintenance(2026,'alice_maintains_household_s7703_b_2_neg2026',d2026_01_01,"2026-12-31").
alice_household_maintenance(2027,'alice_maintains_household_s7703_b_2_neg2027',d2027_01_01,"2027-12-31").
alice_household_maintenance(2028,'alice_maintains_household_s7703_b_2_neg2028',d2028_01_01,"2028-12-31").
alice_household_maintenance(2029,'alice_maintains_household_s7703_b_2_neg2029',d2029_01_01,"2029-12-31").
alice_household_maintenance(2030,'alice_maintains_household_s7703_b_2_neg2030',d2030_01_01,"2030-12-31").
alice_household_maintenance(2031,'alice_maintains_household_s7703_b_2_neg2031',d2031_01_01,"2031-12-31").
alice_household_maintenance(2032,'alice_maintains_household_s7703_b_2_neg2032',d2032_01_01,"2032-12-31").
alice_household_maintenance(2033,'alice_maintains_household_s7703_b_2_neg2033',d2033_01_01,"2033-12-31").
alice_household_maintenance(2034,'alice_maintains_household_s7703_b_2_neg2034',d2034_01_01,"2034-12-31").
alice_household_maintenance(2035,'alice_maintains_household_s7703_b_2_neg2035',d2035_01_01,"2035-12-31").
alice_household_maintenance(2036,'alice_maintains_household_s7703_b_2_neg2036',d2036_01_01,"2036-12-31").
alice_household_maintenance(2037,'alice_maintains_household_s7703_b_2_neg2037',d2037_01_01,"2037-12-31").
alice_household_maintenance(2038,'alice_maintains_household_s7703_b_2_neg2038',d2038_01_01,"2038-12-31").
alice_household_maintenance(2039,'alice_maintains_household_s7703_b_2_neg2039',d2039_01_01,"2039-12-31").
alice_household_maintenance(2040,'alice_maintains_household_s7703_b_2_neg2040',d2040_01_01,"2040-12-31").
alice_household_maintenance(2041,'alice_maintains_household_s7703_b_2_neg2041',d2041_01_01,"2041-12-31").
alice_household_maintenance(2042,'alice_maintains_household_s7703_b_2_neg2042',d2042_01_01,"2042-12-31").
alice_household_maintenance(2043,'alice_maintains_household_s7703_b_2_neg2043',d2043_01_01,"2043-12-31").
alice_household_maintenance(2044,'alice_maintains_household_s7703_b_2_neg2044',d2044_01_01,"2044-12-31").
alice_household_maintenance(2045,'alice_maintains_household_s7703_b_2_neg2045',d2045_01_01,"2045-12-31").
alice_household_maintenance(2046,'alice_maintains_household_s7703_b_2_neg2046',d2046_01_01,"2046-12-31").
alice_household_maintenance(2047,'alice_maintains_household_s7703_b_2_neg2047',d2047_01_01,"2047-12-31").
alice_household_maintenance(2048,'alice_maintains_household_s7703_b_2_neg2048',d2048_01_01,"2048-12-31").
alice_household_maintenance(2049,'alice_maintains_household_s7703_b_2_neg2049',d2049_01_01,"2049-12-31").
alice_household_maintenance(2050,'alice_maintains_household_s7703_b_2_neg2050',d2050_01_01,"2050-12-31").
% alice_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('alice_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day=d2017_09_16));first_day_year(Year,Start_day)),
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
