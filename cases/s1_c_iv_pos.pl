% Text
% Alice's taxable income for the year 2017 is $210204. In 2017, Alice is not married, is not a surviving spouse, and is not a head of household.

% Question
% Alice has to pay $65445 in taxes for the year 2017 under section 1(c)(iv). Entailment

% Facts
person(alice_s1_c_iv_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(210204).
finance(65445).

s63(alice_s1_c_iv_pos,2017,210204).

% Test
:- s1_c_iv(210204,65445).
:- halt.
