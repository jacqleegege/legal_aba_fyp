% Text
% Bob is Alice's brother since April 15th, 2014.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(B) for the year 2015. Entailment

% Facts
person(alice_s152_d_2_B_pos).
person(bob_s152_d_2_B_pos).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

brother_(alice_and_bob_s152_d_2_B_pos).
agent_(alice_and_bob_s152_d_2_B_pos,bob_s152_d_2_B_pos).
patient_(alice_and_bob_s152_d_2_B_pos,alice_s152_d_2_B_pos).
start_(alice_and_bob_s152_d_2_B_pos,d2014_04_15).

% Test
:- s152_d_2_B(alice_s152_d_2_B_pos,bob_s152_d_2_B_pos,d2014_04_15,d2100_01_01).
:- halt.
