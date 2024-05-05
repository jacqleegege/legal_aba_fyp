% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $236422.

% Question
% Alice has to pay $70640 in taxes for the year 2017 under section 1(a)(iv). Entailment

% Facts
person(alice_s1_a_2_iv_pos).
person(spouse_s1_a_2_iv_pos).

year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(236422).
finance(70640).

s2_a(alice_s1_a_2_iv_pos,spouse_s1_a_2_iv_pos,2017).
s63(alice_s1_a_2_iv_pos,2017,236422).

% Test
:- s1_a_iv(236422,70640).
:- halt.
