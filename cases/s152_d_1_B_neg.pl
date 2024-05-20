% Text
% In 2015, Alice's income was $2312. The exemption amount for Alice under section 151(d) for the year 2015 was $2000.

% Question
% Section 152(d)(1)(B) applies to Alice for the year 2015. Contradiction

% Facts
person(alice_s152_d_1_B_neg).

finance(2312).
finance(2000).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

income_(alice_makes_money_s152_d_1_B_neg).
agent_(alice_makes_money_s152_d_1_B_neg,alice_s152_d_1_B_neg).
amount_(alice_makes_money_s152_d_1_B_neg,2312).
start_(alice_makes_money_s152_d_1_B_neg,d2015_01_01).
end_(alice_makes_money_s152_d_1_B_neg,d2015_12_31).
s151_d(alice_s152_d_1_B_neg,2000,2015).

% Test
:- \+ s152_d_1_B(alice_s152_d_1_B_neg,2015).
:- halt.
