% Text
% Alice is entitled to an exemption under section 151(c) for Bob for the year 2015.

% Question
% Under section 151(d)(2), Bob's exemption amount for the year 2015 is equal to $0. Entailment

% Facts
person(alice_s151_d_2_pos).
person(bob_s151_d_2_pos).
finance(0).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

s151_c_applies(alice_s151_d_2_pos,bob_s151_d_2_pos,2015).

% Test
:- s151_d_2(bob_s151_d_2_pos,alice_s151_d_2_pos,0,2015).
:- halt.
