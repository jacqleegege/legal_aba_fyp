% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $1172980.

% Question
% Alice has to pay $442985 in taxes for the year 2017 under section 1(b)(v). Entailment

% Facts
person(alice).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(1172980).
s2_b(alice,alice,2017).
s63(alice,2017,1172980).

% Test
:- s1_b_v(1172980,442985).
:- halt.
