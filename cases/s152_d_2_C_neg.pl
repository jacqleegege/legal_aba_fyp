% Text
% Charlie is Bob's father since April 15th, 1995. Dorothy is Bob's mother. Alice married Charlie on August 8th, 2018.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(C). Contradiction

% Facts
person(alice_s152_d_2_C_neg).
person(bob_s152_d_2_C_neg).
person(charlie_s152_d_2_C_neg).
person(dorothy_s152_d_2_C_neg).

year(1995).
date("1995-04-15").
date_split("1995-04-15", 1995, 4, 15).
date("1995-01-01").
date_split("1995-01-01", 1995, 1, 1).
date("1995-12-31").
date_split("1995-12-31", 1995, 12, 31).

year(2018).
date("2018-08-08").
date_split("2018-08-08", 2018, 8, 8).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_C_neg).
agent_(charlie_and_bob_s152_d_2_C_neg,charlie_s152_d_2_C_neg).
patient_(charlie_and_bob_s152_d_2_C_neg,bob_s152_d_2_C_neg).
start_(charlie_and_bob_s152_d_2_C_neg,"1995-04-15").
mother_(dorothy_and_bob_s152_d_2_C_neg).
agent_(dorothy_and_bob_s152_d_2_C_neg,dorothy_s152_d_2_C_neg).
patient_(dorothy_and_bob_s152_d_2_C_neg,bob_s152_d_2_C_neg).
start_(dorothy_and_bob_s152_d_2_C_neg,"1995-04-15").
marriage_(alice_and_charlie_s152_d_2_C_neg).
agent_(alice_and_charlie_s152_d_2_C_neg,alice_s152_d_2_C_neg).
agent_(alice_and_charlie_s152_d_2_C_neg,charlie_s152_d_2_C_neg).
start_(alice_and_charlie_s152_d_2_C_neg,"2018-08-08").

% Test
:- \+ s152_d_2_C(alice_s152_d_2_C_neg,bob_s152_d_2_C_neg,"1995-04-15","2100-01-01").
:- halt.
