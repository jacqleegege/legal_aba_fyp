% Text
% Charlie is Bob's father since April 15th, 2014. Alice is Charlie's sister since October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(F). Entailment

% Facts
person(alice).
person(bob).
person(charlie).

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

father_(charlie_and_bob).
agent_(charlie_and_bob,charlie).
patient_(charlie_and_bob,bob).
start_(charlie_and_bob,"2014-04-15").
sister_(alice_and_charlie).
agent_(alice_and_charlie,alice).
patient_(alice_and_charlie,charlie).
start_(alice_and_charlie,"1992-10-12").

% Test
:- s152_d_2_F(alice,bob,charlie,"2014-04-15","2100-01-01").
:- halt.