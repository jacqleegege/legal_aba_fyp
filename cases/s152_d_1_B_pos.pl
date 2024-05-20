% Text
% In 2015, Alice did not have any income. The exemption amount for Alice under section 151(d) for the year 2015 was $2000.

% Question
% Section 152(d)(1)(B) applies to Alice for the year 2015. Entailment

% Facts
person(alice_s152_d_1_B_pos).

finance(2000).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

s151_d(alice_s152_d_1_B_pos,2000,2015).

% Test
:- s152_d_1_B(alice_s152_d_1_B_pos,2015).
:- halt.
