% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $89150.

% Question
% Alice has to pay $20165 in taxes for the year 2017 under section 1(a). Contradiction

% Facts
person(alice_s1_a_1_neg_2).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(89150).
finance(20165).
% s2_b(alice,_,2017).
s2_b(alice_s1_a_1_neg_2,alice_s1_a_1_neg_2,2017).
s63(alice_s1_a_1_neg_2,2017,89150).

% Test
:- \+ s1_a(alice_s1_a_1_neg_2,2017,89150,20165).
:- halt.