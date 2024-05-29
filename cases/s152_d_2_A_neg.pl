% Text
% Bob is Alice's brother since April 15th, 2014.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(A). Contradiction

% Facts
person(alice_s152_d_2_A_neg).
person(bob_s152_d_2_A_neg).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

brother_(alice_and_bob_s152_d_2_A_neg).
agent_(alice_and_bob_s152_d_2_A_neg,bob_s152_d_2_A_neg).
patient_(alice_and_bob_s152_d_2_A_neg,alice_s152_d_2_A_neg).
start_(alice_and_bob_s152_d_2_A_neg,d2014_04_15).

% Test
:- \+ s152_d_2_A(alice_s152_d_2_A_neg,bob_s152_d_2_A_neg,d2014_04_15,d2100_01_01).
:- halt.
