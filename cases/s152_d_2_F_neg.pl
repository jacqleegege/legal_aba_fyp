% Text
% Charlie is Bob's father since April 15th, 2014. Alice married Charlie on October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(F). Contradiction

% Facts
person(alice_s152_d_2_F_neg).
person(bob_s152_d_2_F_neg).
person(charlie_s152_d_2_F_neg).

year(2014).
date("2014-04-15").
date_split("2014-04-15", 2014, 4, 15).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

year(1992).
date("1992-10-12").
date_split("1992-10-12", 1992, 10, 12).
date("1992-01-01").
date_split("1992-01-01", 1992, 1, 1).
date("1992-12-31").
date_split("1992-12-31", 1992, 12, 31).

year(2100).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_F_neg).
agent_(charlie_and_bob_s152_d_2_F_neg,charlie_s152_d_2_F_neg).
patient_(charlie_and_bob_s152_d_2_F_neg,bob_s152_d_2_F_neg).
start_(charlie_and_bob_s152_d_2_F_neg,"2014-04-15").
marriage_(alice_and_charlie_s152_d_2_F_neg).
agent_(alice_and_charlie_s152_d_2_F_neg,alice_s152_d_2_F_neg).
agent_(alice_and_charlie_s152_d_2_F_neg,charlie_s152_d_2_F_neg).
start_(alice_and_charlie_s152_d_2_F_neg,"1992-10-12").

% Test
:- \+ s152_d_2_F(alice_s152_d_2_F_neg,bob_s152_d_2_F_neg,charlie_s152_d_2_F_neg,"2014-04-15","2100-01-01").
:- halt.
