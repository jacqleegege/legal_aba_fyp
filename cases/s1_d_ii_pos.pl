% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $28864. Alice files a separate return.

% Question
% Alice has to pay $5683 in taxes for the year 2017 under section 1(d)(ii). Entailment

% Facts
person(alice_s1_d_ii_pos).
person(spouse_s1_d_ii_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(28864).
finance(5683).

marriage_(alice_and_spouse_s1_d_ii_pos).
s7703(alice_s1_d_ii_pos,spouse_s1_d_ii_pos,alice_and_spouse_s1_d_ii_pos,2017).
s63(alice_s1_d_ii_pos,2017,28864).

% Test
:- s1_d_ii(28864,5683).
:- halt.
