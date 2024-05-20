% Text
% Alice's income in 2015 was $260932. For 2015, Alice received one exemption of $2000 under section 151(c). Alice's applicable percentage under section 151(d)(3)(B) is equal to 10%.

% Question
% Under section 151(d)(3)(A), Alice's exemption amount is reduced to $1800. Entailment

% Facts
person(alice_s151_d_3_A_pos).

finance(260932).
finance(250000).
finance(10).
finance(2000).
finance(1800).


year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

income_(alice_makes_money_s151_d_3_A_pos).
agent_(alice_makes_money_s151_d_3_A_pos,alice_s151_d_3_A_pos).
amount_(alice_makes_money_s151_d_3_A_pos,260932).
start_(alice_makes_money_s151_d_3_A_pos,d2015_01_01).
end_(alice_makes_money_s151_d_3_A_pos,d2015_12_31).
s151_c(alice_s151_d_3_A_pos,alice_s151_d_3_A_pos,2000,2015).

% Test
:- s151_d_3_A(alice_s151_d_3_A_pos,260932,250000,10,2000,1800,2015).
:- halt.
