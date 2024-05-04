% Text
% Alice's income in 2015 is $395276. The applicable amount according to section 68(b) is $250000.
%
% Question
% Under section 151(d)(3)(B), the applicable percentage for Alice for 2015 is equal to 118. Contradiction

% Facts
person(alice).

finance(395276).
finance(250000).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

income_(alice_makes_money).
agent_(alice_makes_money,alice).
amount_(alice_makes_money,395276).
start_(alice_makes_money,"2015-01-01").
end_(alice_makes_money,"2015-12-31").
s68_b(alice,2015,250000).

% Test
:- \+ s151_d_3_B(118,alice,395276,2015,250000).
:- halt.
