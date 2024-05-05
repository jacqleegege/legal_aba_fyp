% Text
% Alice's taxable income for the year 2017 is $210204. Alice is not married, is not a surviving spouse, and is not a head of household in 2017.

% Question
% Alice has to pay $65445 in taxes for the year 2017 under section 1(a). Contradiction

% Facts
person(alice_s1_a_2_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(2102047).
finance(65445).

s63(alice_s1_a_2_neg,2017,2102047).

% Test
:- \+ s1_a(alice_s1_a_2_neg,2017,2102047,65445).
:- halt.
