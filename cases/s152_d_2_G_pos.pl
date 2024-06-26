% Text
% Charlie is Bob's father since April 15th, 2014. Alice married Bob on October 12th, 1992.

% Question
% Alice bears a relationship to Charlie under section 152(d)(2)(G) for the year 2018. Entailment

% Facts
person(alice_s152_d_2_G_pos).
person(bob_s152_d_2_G_pos).
person(charlie_s152_d_2_G_pos).

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

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

year(2100).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_G_pos).
agent_(charlie_and_bob_s152_d_2_G_pos,charlie_s152_d_2_G_pos).
patient_(charlie_and_bob_s152_d_2_G_pos,bob_s152_d_2_G_pos).
start_(charlie_and_bob_s152_d_2_G_pos,d2014_04_15).
marriage_(alice_and_bob_s152_d_2_G_pos).
agent_(alice_and_bob_s152_d_2_G_pos,alice_s152_d_2_G_pos).
agent_(alice_and_bob_s152_d_2_G_pos,bob_s152_d_2_G_pos).
start_(alice_and_bob_s152_d_2_G_pos,d1992_10_12).
% pos_s152_d_2_G():-
%     s152_d_2_G(alice,charlie,Start_relationship,End_relationship),
%     first_day_year(2018,First_day),
%     is_before(Start_relationship,First_day).

% Test
:- s152_d_2_G(alice_s152_d_2_G_pos,charlie_s152_d_2_G_pos,d2014_04_15,d2100_01_01).
:- halt.
