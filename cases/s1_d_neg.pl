% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $70117.

% Question
% Alice has to pay $14836 in taxes for the year 2017 under section 1(d). Contradiction

% Facts
person(alice_s1_d_neg).
person(spouse_s1_d_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(70117).
finance(14836).

s2_a(alice_s1_d_neg,spouse_s1_d_neg,2017).
s63(alice_s1_d_neg,2017,70117).

% Test
:- \+ s1_d(alice_s1_d_neg,spouse_s1_d_neg,2017,70117,14836).
:- halt.
