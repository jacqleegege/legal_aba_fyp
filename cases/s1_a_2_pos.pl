% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $70117.

% Question
% Alice has to pay $14836 in taxes for the year 2017 under section 1(a). Entailment

% Facts
person(alice_s1_a_2_pos).
person(spouse_s1_a_2_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(70117).
finance(14836).
s2_a(alice_s1_a_2_pos,spouse_s1_a_2_pos,2017).
s63(alice_s1_a_2_pos,2017,70117).

% Test
:- s1_a(alice_s1_a_2_pos,2017,70117,14836).
:- halt.
