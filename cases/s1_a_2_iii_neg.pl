% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $236422.

% Question
% Alice has to pay $70640 in taxes for the year 2017 under section 1(a)(iii). Contradiction

% Facts
person(alice_s1_a_2_iii_neg).
person(spouse_s1_a_2_iii_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(236422).
finance(70640).

s2_a(alice_s1_a_2_iii_neg,spouse_s1_a_2_iii_neg,2017).
s63(alice_s1_a_2_iii_neg,2017,236422).

% Test
:- \+ s1_a_iii(236422,70640).
:- halt.
