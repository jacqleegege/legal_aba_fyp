% Text
% Alice and Bob started living together on April 15th, 2014. Alice and Bob are not married.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(H) for the year 2018. Entailment

% Facts
person(alice_s152_d_2_H_pos).
person(bob_s152_d_2_H_pos).

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

year(2100).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

residence_(alice_and_bob_s152_d_2_H_pos).
agent_(alice_and_bob_s152_d_2_H_pos,alice_s152_d_2_H_pos).
agent_(alice_and_bob_s152_d_2_H_pos,bob_s152_d_2_H_pos).
start_(alice_and_bob_s152_d_2_H_pos,d2014_04_15).
patient_(alice_and_bob_s152_d_2_H_pos,home_s152_d_2_H_pos).

% Test
:- s152_d_2_H(alice_s152_d_2_H_pos,bob_s152_d_2_H_pos,2018,home_s152_d_2_H_pos,d2014_04_15,"2100-01-01").
:- halt.
