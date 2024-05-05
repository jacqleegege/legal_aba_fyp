% Text
% Bob is Alice's son since April 15th, 2014.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(B) for the year 2015. Contradiction

% Facts
person(alice_s152_d_2_B_neg).
person(bob_s152_d_2_B_neg).

year(2014).
date("2014-04-15").
date_split("2014-04-15", 2014, 4, 15).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

son_(alice_and_bob_s152_d_2_B_neg).
agent_(alice_and_bob_s152_d_2_B_neg,bob_s152_d_2_B_neg).
patient_(alice_and_bob_s152_d_2_B_neg,alice_s152_d_2_B_neg).
start_(alice_and_bob_s152_d_2_B_neg,"2014-04-15").

% Test
:- \+ s152_d_2_B(alice_s152_d_2_B_neg,bob_s152_d_2_B_neg,"2014-04-15","2100-01-01").
:- halt.
