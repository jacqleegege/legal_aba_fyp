% Text
% Alice is a surviving spouse for the year 2017. Alice's taxable income for the year 2017 is $25561.

% Question
% Alice has to pay $3834 in taxes for the year 2017 under section 1(a)(i). Entailment

% Facts
person(alice_s1_a_2_i_pos).
person(spouse_s1_a_2_i_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(25561).
finance(3834).
s2_a(alice_s1_a_2_i_pos,spouse_s1_a_2_i_pos,2017).
s63(alice_s1_a_2_i_pos,2017,25561).

% Test
:- s1_a_i(25561,3834).
:- halt.
