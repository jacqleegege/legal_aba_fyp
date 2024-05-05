% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $554313. Alice files a separate return.

% Question
% Alice has to pay $207772 in taxes for the year 2017 under section 1(d)(v). Entailment

% Facts
person(alice_s1_d_v_pos).
person(spouse_s1_d_v_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(554313).
finance(20772).

marriage_(alice_and_spouse_s1_d_v_pos).
s7703(alice_s1_d_v_pos,spouse_s1_d_v_pos,alice_and_spouse_s1_d_v_pos,2017).
s63(alice_s1_d_v_pos,2017,554313).

% Test
:- s1_d_v(554313,207772).
:- halt.
