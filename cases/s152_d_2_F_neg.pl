% Text
% Charlie is Bob's father since April 15th, 2014. Alice married Charlie on October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(F). Contradiction

% Facts
person(alice_s152_d_2_F_neg).
person(bob_s152_d_2_F_neg).
person(charlie_s152_d_2_F_neg).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

year(1992).
date(d1992_10_12).
date_split(d1992_10_12, 1992, 10, 12).
date(d1992_01_01).
date_split(d1992_01_01, 1992, 1, 1).
date(d1992_12_31).
date_split(d1992_12_31, 1992, 12, 31).

year(2100).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_F_neg).
agent_(charlie_and_bob_s152_d_2_F_neg,charlie_s152_d_2_F_neg).
patient_(charlie_and_bob_s152_d_2_F_neg,bob_s152_d_2_F_neg).
start_(charlie_and_bob_s152_d_2_F_neg,d2014_04_15).
marriage_(alice_and_charlie_s152_d_2_F_neg).
agent_(alice_and_charlie_s152_d_2_F_neg,alice_s152_d_2_F_neg).
agent_(alice_and_charlie_s152_d_2_F_neg,charlie_s152_d_2_F_neg).
start_(alice_and_charlie_s152_d_2_F_neg,d1992_10_12).

% Test
:- \+ s152_d_2_F(alice_s152_d_2_F_neg,bob_s152_d_2_F_neg,charlie_s152_d_2_F_neg,d2014_04_15,d2100_01_01).
:- halt.
