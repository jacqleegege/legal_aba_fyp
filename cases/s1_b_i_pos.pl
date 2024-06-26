% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $9560.

% Question
% Alice has to pay $1434 in taxes for the year 2017 under section 1(b)(i). Entailment

% Facts
person(alice_s1_b_i_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(9560).
finance(1434).

s2_b(alice_s1_b_i_pos,alice_s1_b_i_pos,2017).
s63(alice_s1_b_i_pos,2017,9560).

% Test
:- s1_b_i(9560,1434).
:- halt.
