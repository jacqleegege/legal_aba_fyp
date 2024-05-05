% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $67285. Alice files a separate return.

% Question
% Alice has to pay $17123 in taxes for the year 2017 under section 1(d)(iii). Entailment

% Facts
person(alice_s1_d_iii_pos).
person(spouse_s1_d_iii_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(67285).
finance(17123).

marriage_(alice_and_spouse_s1_d_iii_pos).
s7703(alice_s1_d_iii_pos,spouse_s1_d_iii_pos,alice_and_spouse_s1_d_iii_pos,2017).
s63(alice_s1_d_iii_pos,2017,67285).

% Test
:- s1_d_iii(67285,17123).
:- halt.
