% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under section 63(c)(1) of $2000 for the year 2017, and no deduction under section 151. Alice takes the standard deduction.

% Question
% Under section 63(b), Alice's taxable income in 2017 is equal to $31400. Contradiction

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(2000).
finance(0).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s63_c_1(alice,2017,2000).
s151(alice,0,alice,0,2017).

% Test
:- \+ s63_b(alice,2017,31400,33200).
:- halt.
