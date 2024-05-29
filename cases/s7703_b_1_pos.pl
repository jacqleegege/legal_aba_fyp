% Text
% Alice and Bob got married on April 5th, 2012. Alice and Bob have a son, Charlie, who was born on September 16th, 2017. Alice and Charlie live in a home maintained by Alice since September 16th, 2017. Alice is entitled to a deduction for Charlie under section 151(c) for the years 2017 to 2019. Alice files a separate return.

% Question
% Section 7703(b)(1) applies to Alice for the year 2018. Entailment

% Facts
person(alice_s7703_b_1_pos).
person(bob_s7703_b_1_pos).
person(charlie_s7703_b_1_pos).

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

household(alice_s_house_s7703_b_1_pos).
finance(1).

marriage_(alice_and_bob_s7703_b_1_pos).
agent_(alice_and_bob_s7703_b_1_pos,alice_s7703_b_1_pos).
agent_(alice_and_bob_s7703_b_1_pos,bob_s7703_b_1_pos).
start_(alice_and_bob_s7703_b_1_pos,d2012_04_05).
son_(charlie_is_born_s7703_b_1_pos).
agent_(charlie_is_born_s7703_b_1_pos,charlie_s7703_b_1_pos).
patient_(charlie_is_born_s7703_b_1_pos,bob_s7703_b_1_pos).
patient_(charlie_is_born_s7703_b_1_pos,alice_s7703_b_1_pos).
start_(charlie_is_born_s7703_b_1_pos,d2017_09_16).
residence_(alice_residence_s7703_b_1_pos).
agent_(alice_residence_s7703_b_1_pos,alice_s7703_b_1_pos).
patient_(alice_residence_s7703_b_1_pos,alice_s_house_s7703_b_1_pos).
start_(alice_residence_s7703_b_1_pos,d2017_09_16).
residence_(charlie_residence_s7703_b_1_pos).
agent_(charlie_residence_s7703_b_1_pos,charlie_s7703_b_1_pos).
patient_(charlie_residence_s7703_b_1_pos,alice_s_house_s7703_b_1_pos).
start_(charlie_residence_s7703_b_1_pos,d2017_09_16).

% NOTE: should be generated to 2117 + dates should be validated
alice_household_maintenance(2017,'alice_maintains_household_s7703_b_1_pos2017',d2017_09_16,d2017_12_31).
alice_household_maintenance(2018,'alice_maintains_household_s7703_b_1_pos2018',d2018_01_01,d2018_12_31).
alice_household_maintenance(2019,'alice_maintains_household_s7703_b_1_pos2019',d2019_01_01,d2019_12_31).
alice_household_maintenance(2020,'alice_maintains_household_s7703_b_1_pos2020',d2020_01_01,d2020_12_31).
alice_household_maintenance(2021,'alice_maintains_household_s7703_b_1_pos2021',d2021_01_01,d2021_12_31).
alice_household_maintenance(2022,'alice_maintains_household_s7703_b_1_pos2022',d2022_01_01,d2022_12_31).
alice_household_maintenance(2023,'alice_maintains_household_s7703_b_1_pos2023',d2023_01_01,d2023_12_31).
alice_household_maintenance(2024,'alice_maintains_household_s7703_b_1_pos2024',d2024_01_01,d2024_12_31).
alice_household_maintenance(2025,'alice_maintains_household_s7703_b_1_pos2025',d2025_01_01,d2025_12_31).
alice_household_maintenance(2026,'alice_maintains_household_s7703_b_1_pos2026',d2026_01_01,d2026_12_31).
alice_household_maintenance(2027,'alice_maintains_household_s7703_b_1_pos2027',d2027_01_01,d2027_12_31).
alice_household_maintenance(2028,'alice_maintains_household_s7703_b_1_pos2028',d2028_01_01,d2028_12_31).
alice_household_maintenance(2029,'alice_maintains_household_s7703_b_1_pos2029',d2029_01_01,d2029_12_31).
alice_household_maintenance(2030,'alice_maintains_household_s7703_b_1_pos2030',d2030_01_01,d2030_12_31).
alice_household_maintenance(2031,'alice_maintains_household_s7703_b_1_pos2031',d2031_01_01,d2031_12_31).
alice_household_maintenance(2032,'alice_maintains_household_s7703_b_1_pos2032',d2032_01_01,d2032_12_31).
alice_household_maintenance(2033,'alice_maintains_household_s7703_b_1_pos2033',d2033_01_01,d2033_12_31).
alice_household_maintenance(2034,'alice_maintains_household_s7703_b_1_pos2034',d2034_01_01,d2034_12_31).
alice_household_maintenance(2035,'alice_maintains_household_s7703_b_1_pos2035',d2035_01_01,d2035_12_31).
alice_household_maintenance(2036,'alice_maintains_household_s7703_b_1_pos2036',d2036_01_01,d2036_12_31).
alice_household_maintenance(2037,'alice_maintains_household_s7703_b_1_pos2037',d2037_01_01,d2037_12_31).
alice_household_maintenance(2038,'alice_maintains_household_s7703_b_1_pos2038',d2038_01_01,d2038_12_31).
alice_household_maintenance(2039,'alice_maintains_household_s7703_b_1_pos2039',d2039_01_01,d2039_12_31).
alice_household_maintenance(2040,'alice_maintains_household_s7703_b_1_pos2040',d2040_01_01,d2040_12_31).
alice_household_maintenance(2041,'alice_maintains_household_s7703_b_1_pos2041',d2041_01_01,d2041_12_31).
alice_household_maintenance(2042,'alice_maintains_household_s7703_b_1_pos2042',d2042_01_01,d2042_12_31).
alice_household_maintenance(2043,'alice_maintains_household_s7703_b_1_pos2043',d2043_01_01,d2043_12_31).
alice_household_maintenance(2044,'alice_maintains_household_s7703_b_1_pos2044',d2044_01_01,d2044_12_31).
alice_household_maintenance(2045,'alice_maintains_household_s7703_b_1_pos2045',d2045_01_01,d2045_12_31).
alice_household_maintenance(2046,'alice_maintains_household_s7703_b_1_pos2046',d2046_01_01,d2046_12_31).
alice_household_maintenance(2047,'alice_maintains_household_s7703_b_1_pos2047',d2047_01_01,d2047_12_31).
alice_household_maintenance(2048,'alice_maintains_household_s7703_b_1_pos2048',d2048_01_01,d2048_12_31).
alice_household_maintenance(2049,'alice_maintains_household_s7703_b_1_pos2049',d2049_01_01,d2049_12_31).
alice_household_maintenance(2050,'alice_maintains_household_s7703_b_1_pos2050',d2050_01_01,d2050_12_31).
% alice_household_maintenance(Year,Event,Start_day,End_day) :-
%     between(2017,2117,Year), % avoid infinite forward loop
%     atom_concat('alice_maintains_household_',Year,Event),
%     (((Year==2017)->(Start_day=d2017_09_16));first_day_year(Year,Start_day)),
%     last_day_year(Year,End_day).
payment_(Event) :- alice_household_maintenance(_,Event,_,_).
agent_(Event,alice_s7703_b_1_pos) :- alice_household_maintenance(_,Event,_,_).
amount_(Event,1) :- alice_household_maintenance(_,Event,_,_).
purpose_(Event,alice_s_house_s7703_b_1_pos) :- alice_household_maintenance(_,Event,_,_).
start_(Event,Start_day) :- alice_household_maintenance(_,Event,Start_day,_).
end_(Event,End_day) :- alice_household_maintenance(_,Event,_,End_day).
s151_c_applies(alice_s7703_b_1_pos,charlie_s7703_b_1_pos,Year) :- between(2017,2019,Year).

% Test
:- s7703_b_1(alice_s7703_b_1_pos,alice_s_house_s7703_b_1_pos,charlie_s7703_b_1_pos,2018).
:- halt.
