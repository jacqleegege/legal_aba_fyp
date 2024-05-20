% Text
% Alice was born January 10th, 1992. Bob was born January 31st, 2014. Alice adopted Bob on March 4th, 2018.

% Question
% Bob satisfies section 152(c)(3) with Alice claiming Bob as a qualifying child for the year 2019. Entailment

% Facts
person(alice_s152_c_3_pos).
person(bob_s152_c_3_pos).

year(1992).
date(d1992_01_10).
date_split(d1992_01_10, 1992, 1, 10).
date(d1992_01_01).
date_split(d1992_01_01, 1992, 1, 1).
date(d1992_12_31).
date_split(d1992_12_31, 1992, 12, 31).

year(2014).
date(d2014_01_31).
date_split(d2014_01_31, 2014, 1, 31).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

year(2018).
date(d2018_03_04).
date_split(d2018_03_04, 2018, 3, 4).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

birth_(alice_is_born_s152_c_3_pos).
agent_(alice_is_born_s152_c_3_pos,alice_s152_c_3_pos).
start_(alice_is_born_s152_c_3_pos,d1992_01_10).
end_(alice_is_born_s152_c_3_pos,d1992_01_10).
birth_(bob_is_born_s152_c_3_pos).
agent_(bob_is_born_s152_c_3_pos,bob_s152_c_3_pos).
start_(bob_is_born_s152_c_3_pos,d2014_01_31).
end_(bob_is_born_s152_c_3_pos,d2014_01_31).
son_(alice_and_bob_s152_c_3_pos).
agent_(alice_and_bob_s152_c_3_pos,bob_s152_c_3_pos).
patient_(alice_and_bob_s152_c_3_pos,alice_s152_c_3_pos).
start_(alice_and_bob_s152_c_3_pos,d2018_03_04).

% Test
:- s152_c_3(bob_s152_c_3_pos,alice_s152_c_3_pos,2019).
:- halt.
