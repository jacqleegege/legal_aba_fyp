% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under section 63(c) of $2000 and deductions of $4000 under section 151 for the year 2017.

% Question
% Under section 63(a), Alice's taxable income in 2017 is equal to $31200. Contradiction

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(2000).
finance(4000).
finance(6000).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s63_c(alice,2017,2000).
s151(alice,4000,alice,0,2017).

% Test
:- \+ s63_a(alice,2017,31200,33200,6000).
:- halt.
