% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $554313. Alice files a separate return.

% Question
% Alice has to pay $20772 in taxes for the year 2017 under section 1(d)(v). Contradiction

% Facts
person(alice_s1_d_v_neg).
person(spouse_s1_d_v_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(554313).
finance(20772).

marriage_(alice_and_spouse_s1_d_v_neg).
s7703(alice_s1_d_v_neg,spouse_s1_d_v_neg,alice_and_spouse_s1_d_v_neg,2017).
s63(alice_s1_d_v_neg,2017,554313).

% Test
:- \+ s1_d_v(554313,20772).
:- halt.
