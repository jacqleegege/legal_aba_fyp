% Text
% In 2017, Alice was paid $33200 in remuneration. She is allowed a deduction for herself under section 151 of $2000 for the year 2017.

% Question
% Alice's deduction for 2017 falls under section 63(d)(2). Entailment

% Facts
person(alice).
finance(33200).
finance(2000).

year(2017).
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s151(alice,2000,alice,0,2017).

% Test
:- s63_d_2(alice,2000,2017).
:- halt.
