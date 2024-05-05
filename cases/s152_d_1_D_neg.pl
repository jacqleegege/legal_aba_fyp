% Text
% In 2015, Alice's income was $312. The exemption amount for Alice under section 151(d) for the year 2015 was $2000. Alice is Bob's mother, and Bob is a dependent of Alice under 152(c) for the year 2015.

% Question
% Section 152(d)(1)(D) applies to Bob for the year 2015. Contradiction

% Facts
person(alice_s152_d_1_D_neg).
person(bob_s152_d_1_D_neg).

finance(2000).
finance(312).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

income_(alice_makes_money_s152_d_1_D_neg).
agent_(alice_makes_money_s152_d_1_D_neg,alice_s152_d_1_D_neg).
amount_(alice_makes_money_s152_d_1_D_neg,312).
start_(alice_makes_money_s152_d_1_D_neg,"2015-01-01").
end_(alice_makes_money_s152_d_1_D_neg,"2015-12-31").
father_(alice_and_bob_s152_d_1_D_neg).
agent_(alice_and_bob_s152_d_1_D_neg,bob_s152_d_1_D_neg).
patient_(alice_and_bob_s152_d_1_D_neg,alice_s152_d_1_D_neg).
s152_c(bob_s152_d_1_D_neg,alice_s152_d_1_D_neg,2015).
s151_d(alice_s152_d_1_D_neg,2000,2015).

% Test
:- \+ s152_d_1_D(bob_s152_d_1_D_neg,2015).
:- halt.
