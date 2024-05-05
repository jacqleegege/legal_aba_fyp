% Text
% Alice is a head of household for the year 2017. Alice's taxable income for the year 2017 is $194512.

% Question
% Alice has to pay $57509 in taxes for the year 2017 under section 1(b)(iv). Entailment

% Facts
person(alice_s1_b_iv_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(194512).
finance(57509).

s2_b(alice_s1_b_iv_pos,alice_s1_b_iv_pos,2017).
s63(alice_s1_b_iv_pos,2017,194512).

% Test
:- s1_b_iv(194512,57509).
:- halt.
