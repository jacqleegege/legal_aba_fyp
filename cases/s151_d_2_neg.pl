% Text
% Alice is entitled to an exemption under section 151(d) for Bob for the year 2015.

% Question
% Under section 151(d)(2), Bob's exemption amount for the year 2015 is equal to $2000. Contradiction

% Facts
person(alice_s151_d_2_neg).
person(bob_s151_d_2_neg).
finance(2000).


year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

s151_d(alice_s151_d_2_neg,bob_s151_d_2_neg,2000,2015).

% Test
:- \+ s151_d_2(bob_s151_d_2_neg,alice_s151_d_2_neg,2000,2015).
:- halt.
