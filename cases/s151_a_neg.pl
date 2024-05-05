% Text
% Alice's income in 2015 is $100000. She gets one exemption of $2000 for the year 2015 under section 151(c). Alice is not married.

% Question
% Alice's total exemption for 2015 under section 151(a) is equal to $6000. Contradiction

% Facts
person(alice_s151_a_neg).
person(bob_s151_a_neg).
finance(100000).
finance(2000).
finance(6000).


year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

income_(alice_makes_money_s151_a_neg).
agent_(alice_makes_money_s151_a_neg,alice_s151_a_neg).
start_(alice_makes_money_s151_a_neg,"2015-01-01").
end_(alice_makes_money_s151_a_neg,"2015-12-31").
amount_(alice_makes_money_s151_a_neg,100000).
s151_c(alice_s151_a_neg,bob_s151_a_neg,2000,2015).


% Test
:- \+ s151_a(alice_s151_a_neg,6000,2015).
:- halt.
