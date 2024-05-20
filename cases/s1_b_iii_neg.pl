% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $54775.

% Question
% Alice has to pay $11489 in taxes for the year 2017 under section 1(b)(iii). Contradiction

% Facts
person(alice_s1_b_iii_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(54775).
finance(11489).

s2_b(alice_s1_b_iii_neg,alice_s1_b_iii_neg,2017).
s63(alice_s1_b_iii_neg,2017,54775).

% Test
:- \+ s1_b_iii(54775,11489).
:- halt.
