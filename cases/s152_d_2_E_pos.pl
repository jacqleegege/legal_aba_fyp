% Text
% Charlie is Alice's father since April 15th, 2014. Bob is Charlie's brother since October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(E). Entailment

% Facts
person(alice_s152_d_2_E_pos).
person(bob_s152_d_2_E_pos).
person(charlie_s152_d_2_E_pos).

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

father_(alice_and_charlie_s152_d_2_E_pos).
agent_(alice_and_charlie_s152_d_2_E_pos,charlie_s152_d_2_E_pos).
patient_(alice_and_charlie_s152_d_2_E_pos,alice_s152_d_2_E_pos).
start_(alice_and_charlie_s152_d_2_E_pos,d2014_04_15).
brother_(bob_and_charlie_s152_d_2_E_pos).
agent_(bob_and_charlie_s152_d_2_E_pos,bob_s152_d_2_E_pos).
patient_(bob_and_charlie_s152_d_2_E_pos,charlie_s152_d_2_E_pos).
start_(bob_and_charlie_s152_d_2_E_pos,d1992_10_12).

% Test
:- s152_d_2_E(alice_s152_d_2_E_pos,bob_s152_d_2_E_pos,charlie_s152_d_2_E_pos,d2014_04_15,d2100_01_01).
:- halt.
