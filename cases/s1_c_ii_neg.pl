% Text
% Alice's taxable income for the year 2017 is $7748. Alice is not married, is not a surviving spouse, and is not a head of household in 2017.

% Question
% Alice has to pay $1162 in taxes for the year 2017 under section 1(c)(ii). Contradiction

% Facts
person(alice).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(7748).
s63(alice,2017,7748).

% Test
:- \+ s1_c_ii(7748,1162).
:- halt.
