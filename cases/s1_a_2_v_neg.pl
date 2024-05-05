% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $25561.

% Question
% Alice has to pay $3834 in taxes for the year 2017 under section 1(a)(v). Contradiction

% Facts
person(alice_s1_a_2_v_neg).
person(spouse_s1_a_2_v_neg).

year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(25561).
finance(3834).

s2_a(alice_s1_a_2_v_neg,spouse_s1_a_2_v_neg,2017).
s63(alice_s1_a_2_v_neg,2017,25561).

% Test
:- \+ s1_a_v(25561,3834).
:- halt.
