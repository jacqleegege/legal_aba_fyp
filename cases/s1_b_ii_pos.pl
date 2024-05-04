% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $54775.

% Question
% Alice has to pay $11489 in taxes for the year 2017 under section 1(b)(ii). Entailment

% Facts
person(alice).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(54775).
s2_b(alice,alice,2017).
s63(alice,2017,54775).

% Test
:- s1_b_ii(54775,11489).
:- halt.
