% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $97407.

% Question
% Alice has to pay $24056 in taxes for the year 2017 under section 1(b)(iii). Entailment

% Facts
person(alice_s1_b_iii_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(97407).
finance(24056).

s2_b(alice_s1_b_iii_pos,alice_s1_b_iii_pos,2017).
s63(alice_s1_b_iii_pos,2017,97407).

% Test
:- s1_b_iii(97407,24056).
:- halt.
