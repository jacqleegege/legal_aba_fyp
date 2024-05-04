% Text
% Alice has a son, Bob, who was born January 31st, 2014.

% Question
% Alice bears a relationship to Bob under section 152(c)(2). Contradiction

% Facts
person(alice).
person(bob).

year(2014).
date("2014-01-31").
date_split("2014-01-31", 2014, 1, 31).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

son_(alice_and_bob).
agent_(alice_and_bob,bob).
patient_(alice_and_bob,alice).
start_(alice_and_bob,"2014-01-31").

% Test
:- \+ s152_c_2(alice,bob,"2014-01-31","2100-01-01").
:- halt.
