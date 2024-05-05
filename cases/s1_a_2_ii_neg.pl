% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $95129.

% Question
% Alice has to pay $22018 in taxes for the year 2017 under section 1(a)(ii). Contradiction

% Facts
person(alice_s1_a_2_ii_neg).
person(spouse_s1_a_2_ii_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(95129).
finance(22018).

s2_a(alice_s1_a_2_ii_neg,spouse_s1_a_2_ii_neg,2017).
s63(alice_s1_a_2_ii_neg,2017,95129).

% Test
:- \+ s1_a_ii(95129,22018).
:- halt.
