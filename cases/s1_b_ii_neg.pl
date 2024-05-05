% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $9560.

% Question
% Alice has to pay $1434 in taxes for the year 2017 under section 1(b)(ii). Contradiction

% Facts
person(alice_s1_b_ii_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(9560).
finance(1434).

s2_b(alice_s1_b_ii_neg,alice_s1_b_ii_neg,2017).
s63(alice_s1_b_ii_neg,2017,9560).

% Test
:- \+ s1_b_ii(9560,1434).
:- halt.
