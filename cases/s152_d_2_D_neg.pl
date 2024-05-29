% Text
% Charlie is Alice's father since April 15th, 2014. Bob is Charlie's brother since October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(D) for the year 2018. Contradiction

% Facts
person(alice_s152_d_2_D_neg).
person(bob_s152_d_2_D_neg).
person(charlie_s152_d_2_D_neg).

year(1992).
date(d1992_10_12).
date_split(d1992_10_12, 1992, 10, 12).
date(d1992_01_01).
date_split(d1992_01_01, 1992, 1, 1).
date(d1992_12_31).
date_split(d1992_12_31, 1992, 12, 31).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

father_(alice_and_bob_s152_d_2_D_neg).
agent_(alice_and_bob_s152_d_2_D_neg,bob_s152_d_2_D_neg).
patient_(alice_and_bob_s152_d_2_D_neg,alice_s152_d_2_D_neg).
start_(alice_and_bob_s152_d_2_D_neg,d2014_04_15).
brother_(bob_and_charlie_s152_d_2_D_neg).
agent_(bob_and_charlie_s152_d_2_D_neg,bob_s152_d_2_D_neg).
patient_(bob_and_charlie_s152_d_2_D_neg,charlie_s152_d_2_D_neg).
start_(bob_and_charlie_s152_d_2_D_neg,d1992_10_12).
% neg_s152_d_2_D():-
%     s152_d_2_D(alice,bob,Start_relationship,End_relationship),
%     first_day_year(2018,First_day),
%     is_before(Start_relationship,First_day).

% Test
:- \+ s152_d_2_D(alice_s152_d_2_D_neg,bob_s152_d_2_D_neg,d2014_04_15,d2100_01_01).
:- halt.
