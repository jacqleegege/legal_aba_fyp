% Text
% Bob is Alice's brother since April 15th, 2014.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(B) for the year 2015. Entailment

% Facts
person(alice_s152_d_2_B_pos).
person(bob_s152_d_2_B_pos).

year(2014).
date("2014-04-15").
date_split("2014-04-15", 2014, 4, 15).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

brother_(alice_and_bob_s152_d_2_B_pos).
agent_(alice_and_bob_s152_d_2_B_pos,bob_s152_d_2_B_pos).
patient_(alice_and_bob_s152_d_2_B_pos,alice_s152_d_2_B_pos).
start_(alice_and_bob_s152_d_2_B_pos,"2014-04-15").

% Test
:- s152_d_2_B(alice_s152_d_2_B_pos,bob_s152_d_2_B_pos,"2014-04-15","2100-01-01").
:- halt.
