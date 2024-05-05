% Text
% Alice is entitled to an exemption under section 151(b) for the year 2018.

% Question
% The exemption amount of Alice's exemption is equal to $2000 under section 151(d)(5). Contradiction

% Facts
person(alice_s151_d_5_neg).
finance(2000).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

s151_b_applies(alice_s151_d_5_neg,2018).

% Test
:- \+ s151_d_5(2000,2018).
:- halt.
