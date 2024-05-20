% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $67285. Alice files taxes separately in 2017.

% Question
% Alice has to pay $17123 in taxes for the year 2017 under section 1(d)(i). Contradiction

% Facts
person(alice_s1_d_i_neg).
person(spouse_s1_d_i_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(67285).
finance(17123).

marriage_(alice_and_spouse_s1_d_i_neg).
s7703(alice_s1_d_i_neg,spouse_s1_d_i_neg,alice_and_spouse_s1_d_i_neg,2017).
s63(alice_s1_d_i_neg,2017,67285).

% Test
:- \+ s1_d_i(67285,17123).
:- halt.
