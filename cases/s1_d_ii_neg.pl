% Text
% Alice is married under section 7703 for the year 2017. Alice's taxable income for the year 2017 is $113580. Alice files a separate return.

% Question
% Alice has to pay $33653 in taxes for the year 2017 under section 1(d)(ii). Contradiction

% Facts
person(alice).
person(spouse).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(113580).
marriage_(alice_and_spouse).
s7703(alice,spouse,_alice_and_spouse,2017).
s63(alice,2017,113580).

% Test
:- \+ s1_d_ii(113580,33653).
:- halt.
