% Text
% Alice's income in 2015 was $260932. For 2015, Alice received one exemption of $2000 under section 151(c). Alice's applicable percentage under section 151(d)(3)(B) is equal to 10%.

% Question
% Under section 151(d)(3)(A), Alice's exemption amount is reduced to $1900. Contradiction

% Facts
person(alice).
finance(260932).
finance(2000).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

income_(alice_makes_money).
agent_(alice_makes_money,alice).
amount_(alice_makes_money,260932).
start_(alice_makes_money,"2015-01-01").
end_(alice_makes_money,"2015-12-31").
s151_c(alice,alice,2000,2015).

% Test
:- \+ s151_d_3_A(alice,260932,250,000,10,2000,1900,2015).
:- halt.
