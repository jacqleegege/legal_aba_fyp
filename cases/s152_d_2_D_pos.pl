% Text
% Charlie is Bob's father since April 15th, 1995. Dorothy is Bob's mother. Alice married Charlie on August 8th, 2018.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(D) for the year 2019. Entailment

% Facts
person(alice_s152_d_2_D_pos).
person(bob_s152_d_2_D_pos).
person(charlie_s152_d_2_D_pos).
person(dorothy_s152_d_2_D_pos).

year(1995).
date(d1995_04_15).
date_split(d1995_04_15, 1995, 4, 15).
date(d1995_01_01).
date_split(d1995_01_01, 1995, 1, 1).
date(d1995_12_31).
date_split(d1995_12_31, 1995, 12, 31).

year(2018).
date(d2018_08_08).
date_split(d2018_08_08, 2018, 8, 8).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_D_pos).
agent_(charlie_and_bob_s152_d_2_D_pos,charlie_s152_d_2_D_pos).
patient_(charlie_and_bob_s152_d_2_D_pos,bob_s152_d_2_D_pos).
start_(charlie_and_bob_s152_d_2_D_pos,d1995_04_15).
mother_(dorothy_and_bob_s152_d_2_D_pos).
agent_(dorothy_and_bob_s152_d_2_D_pos,dorothy_s152_d_2_D_pos).
patient_(dorothy_and_bob_s152_d_2_D_pos,bob_s152_d_2_D_pos).
start_(dorothy_and_bob_s152_d_2_D_pos,d1995_04_15).
marriage_(alice_and_charlie_s152_d_2_D_pos).
agent_(alice_and_charlie_s152_d_2_D_pos,alice_s152_d_2_D_pos).
agent_(alice_and_charlie_s152_d_2_D_pos,charlie_s152_d_2_D_pos).
start_(alice_and_charlie_s152_d_2_D_pos,d2018_08_08).
% pos_s152_d_2_D():-
%     s152_d_2_D(alice,bob,Start_relationship,End_relationship),
%     first_day_year(2019,First_day),
%     is_before(Start_relationship,First_day).

% Test
:- s152_d_2_D(alice_s152_d_2_D_pos,bob_s152_d_2_D_pos,d2018_08_08,d2100_01_01).
:- halt.
