% Text
% Bob is Alice's father since April 15th, 1994. In 2015, Alice and Bob live in separate houses.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(H) for the year 2015. Contradiction

% Facts
person(alice_s152_d_2_H_neg).
person(bob_s152_d_2_H_neg).

year(1994).
date("1994-04-15").
date_split("1994-04-15", 1994, 4, 15).
date("1994-01-01").
date_split("1994-01-01", 1994, 1, 1).
date("1994-12-31").
date_split("1994-12-31", 1994, 12, 31).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2100).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

father_(alice_and_bob_s152_d_2_H_neg).
agent_(alice_and_bob_s152_d_2_H_neg,bob_s152_d_2_H_neg).
patient_(alice_and_bob_s152_d_2_H_neg,alice_s152_d_2_H_neg).
start_(alice_and_bob_s152_d_2_H_neg,"1994-04-15").

% Test
:- \+ s152_d_2_H(alice_s152_d_2_H_neg,bob_s152_d_2_H_neg,2015,home_s152_d_2_H_neg,"1994-04-15","2100-01-01").
:- halt.
