% Text
% In 2017, Alice was paid $33200. She is allowed a deduction of $2000 for herself for the year 2017 under section 151(b).

% Question
% Alice's deduction for 2017 falls under section 63(d). Contradiction

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
s151_b(alice,2000,2017).

% Test
:- \+ s63_d(alice,2000,2000,2017).
:- halt.