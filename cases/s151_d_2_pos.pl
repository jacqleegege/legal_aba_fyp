% Text
% Alice is entitled to an exemption under section 151(c) for Bob for the year 2015.

% Question
% Under section 151(d)(2), Bob's exemption amount for the year 2015 is equal to $0. Entailment

% Facts
person(alice).
person(bob).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

s151_c_applies(alice,bob,2015).

% Test
:- s151_d_2(bob,alice,0,2015).
:- halt.
