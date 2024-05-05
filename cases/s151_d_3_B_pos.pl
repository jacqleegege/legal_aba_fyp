% Text
% Alice's income in 2015 is $276932. Alice is not married. The applicable amount according to section 68(b) is $250000.

% Question
% Under section 151(d)(3)(B), the applicable percentage for Alice for 2015 is equal to 22. Entailment

% Facts
person(alice_s151_d_3_B_pos).

finance(276932).
finance(250000).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

income_(alice_makes_money_s151_d_3_B_pos).
agent_(alice_makes_money_s151_d_3_B_pos,alice_s151_d_3_B_pos).
amount_(alice_makes_money_s151_d_3_B_pos,276932).
start_(alice_makes_money_s151_d_3_B_pos,"2015-01-01").
end_(alice_makes_money_s151_d_3_B_pos,"2015-12-31").
s68_b(alice_s151_d_3_B_pos,2015,250000).

% Test
:- s151_d_3_B(22,alice_s151_d_3_B_pos,276932,2015,250000).
:- halt.
