% Text
% Alice is entitled to an exemption under section 151(b) for the year 2018.

% Question
% The exemption amount of Alice's exemption is equal to $2000 under section 151(d)(5). Contradiction

% Facts
person(alice_s151_d_5_neg).
finance(2000).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

s151_b_applies(alice_s151_d_5_neg,2018).

% Test
:- \+ s151_d_5(2000,2018).
:- halt.
