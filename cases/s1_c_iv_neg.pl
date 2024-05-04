% Text
% Alice's taxable income for the year 2017 is $102268. In 2017, Alice is not married, is not a surviving spouse, and is not a head of household.

% Question
% Alice has to pay $27225 in taxes for the year 2017 under section 1(c)(iv). Contradiction

% Facts
person(alice).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(102268).
s63(alice,2017,102268).

% Test
:- \+ s1_c_iv(102268,27225).
:- halt.