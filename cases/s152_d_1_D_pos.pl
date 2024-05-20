% Text
% In 2015, Alice's income was $312. The exemption amount for Alice under section 151(d) for the year 2015 was $2000. Bob is Alice's father.

% Question
% Section 152(d)(1)(D) applies to Bob for the year 2015. Entailment

% Facts
person(alice_s152_d_1_D_pos).
person(bob_s152_d_1_D_pos).

finance(2000).
finance(312).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

income_(alice_makes_money_s152_d_1_D_pos).
agent_(alice_makes_money_s152_d_1_D_pos,alice_s152_d_1_D_pos).
amount_(alice_makes_money_s152_d_1_D_pos,312).
start_(alice_makes_money_s152_d_1_D_pos,d2015_01_01).
end_(alice_makes_money_s152_d_1_D_pos,d2015_12_31).
father_(alice_and_bob_s152_d_1_D_pos).
agent_(alice_and_bob_s152_d_1_D_pos,bob_s152_d_1_D_pos).
patient_(alice_and_bob_s152_d_1_D_pos,alice_s152_d_1_D_pos).
s151_d(alice_s152_d_1_D_pos,2000,2015).

% Test
:- s152_d_1_D(bob_s152_d_1_D_pos,2015).
:- halt.
