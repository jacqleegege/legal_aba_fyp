% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $615572.

% Question
% Alice has to pay $220295 in taxes for the year 2017 under section 1(a)(iv). Contradiction

% Facts
person(alice_s1_a_2_iv_neg).
person(spouse_s1_a_2_iv_neg).

year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(615572).
finance(220295).
s2_a(alice_s1_a_2_iv_neg,spouse_s1_a_2_iv_neg,2017).
s63(alice_s1_a_2_iv_neg,2017,615572).

% Test
:- \+ s1_a_iv(615572,220295).
:- halt.
