% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $1172980.

% Question
% Alice has to pay $442985 in taxes for the year 2017 under section 1(b)(v). Entailment

% Facts
person(alice_s1_b_v_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(1172980).
finance(442985).

s2_b(alice_s1_b_v_pos,alice_s1_b_v_pos,2017).
s63(alice_s1_b_v_pos,2017,1172980).

% Test
:- s1_b_v(1172980,442985).
:- halt.
