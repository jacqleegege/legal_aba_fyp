% Text
% Alice's taxable income for the year 2017 is $22895. Alice is not married, is not a surviving spouse, and is not a head of household in 2017.

% Question
% Alice has to pay $3538 in taxes for the year 2017 under section 1(c)(iii). Contradiction

% Facts
person(alice_s1_c_iii_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(22895).
finance(3538).

s63(alice_s1_c_iii_neg,2017,22895).

% Test
:- \+ s1_c_iii(22895,3538).
:- halt.
