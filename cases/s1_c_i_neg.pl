% Text
% Alice's taxable income for the year 2017 is $718791. In 2017, Alice is not married, is not a surviving spouse, and is not a head of household.

% Question
% Alice has to pay $265413 in taxes for the year 2017 under section 1(c)(i). Contradiction

% Facts
person(alice_s1_c_i_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(718791).
finance(265413).

s63(alice_s1_c_i_neg,2017,718791).

% Test
:- \+ s1_c_i(718791,265413).
:- halt.
