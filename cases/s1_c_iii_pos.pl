% Text
% Alice's taxable income for the year 2017 is $102268. Alice is not married, is not a surviving spouse, and is not a head of household in 2017.

% Question
% Alice has to pay $27225 in taxes for the year 2017 under section 1(c)(iii). Entailment

% Facts
person(alice_s1_c_iii_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(102268).
finance(27225).

s63(alice_s1_c_iii_pos,2017,102268).

% Test
:- s1_c_iii(102268,27225).
:- halt.
