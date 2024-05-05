% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $6662. Alice files a separate return.

% Question
% Alice has to pay $999 in taxes for the year 2017 under section 1(d)(iii). Contradiction

% Facts
person(alice_s1_d_iii_neg).
person(spouse_s1_d_iii_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(6662).
finance(999).

marriage_(alice_and_spouse_s1_d_iii_neg).
s7703(alice_s1_d_iii_neg,spouse_s1_d_iii_neg,alice_and_spouse_s1_d_iii_neg,2017).
s63(alice_s1_d_iii_neg,2017,6662).

% Test
:- \+ s1_d_iii(6662,999).
:- halt.
