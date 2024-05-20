% Text
% Bob is Alice's son since April 15th, 2014.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(C). Entailment

% Facts
person(alice_s152_d_2_C_pos).
person(bob_s152_d_2_C_pos).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

son_(alice_and_bob_s152_d_2_C_pos).
agent_(alice_and_bob_s152_d_2_C_pos,bob_s152_d_2_C_pos).
patient_(alice_and_bob_s152_d_2_C_pos,alice_s152_d_2_C_pos).
start_(alice_and_bob_s152_d_2_C_pos,d2014_04_15).

% Test
:- s152_d_2_C(alice_s152_d_2_C_pos,bob_s152_d_2_C_pos,d2014_04_15,"2100-01-01").
:- halt.
