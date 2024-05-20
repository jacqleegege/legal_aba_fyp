% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $70117.

% Question
% Alice has to pay $14836 in taxes for the year 2017 under section 1(a)(ii). Entailment

% Facts
person(alice_s1_a_2_ii_pos).
person(spouse_s1_a_2_ii_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(70117).
finance(14836).

s2_a(alice_s1_a_2_ii_pos,spouse_s1_a_2_ii_pos,2017).
s63(alice_s1_a_2_ii_pos,2017,70117).

% Test
:- s1_a_ii(70117,14836).
:- halt.
