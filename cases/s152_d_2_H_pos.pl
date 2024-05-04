% Text
% Alice and Bob started living together on April 15th, 2014. Alice and Bob are not married.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(H) for the year 2018. Entailment

% Facts
person(alice).
person(bob).

year(2014).
date("2014-04-15").
date_split("2014-04-15", 2014, 4, 15).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

residence_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2014-04-15").
patient_(alice_and_bob,home).

% Test
:- s152_d_2_H(alice,bob,2018,home,"2014-04-15","2100-01-01").
:- halt.
