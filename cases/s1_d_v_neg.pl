% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $554313. Alice files a separate return.

% Question
% Alice has to pay $20772 in taxes for the year 2017 under section 1(d)(v). Contradiction

% Facts
person(alice).
person(spouse).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(554313).
marriage_(alice_and_spouse).
s7703(alice,spouse,alice_and_spouse,2017).
s63(alice,2017,554313).

% Test
:- \+ s1_d_v(554313,20772).
:- halt.
