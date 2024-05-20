% Text
% Alice has a brother, Bob, who was born January 31st, 2014.

% Question
% Bob bears a relationship to Alice under section 152(c)(2)(B). Entailment

% Facts
person(alice_s152_c_2_B_pos).
person(bob_s152_c_2_B_pos).

year(2014).
date(d2014_01_31).
date_split(d2014_01_31, 2014, 1, 31).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

brother_(alice_and_bob_s152_c_2_B_pos).
agent_(alice_and_bob_s152_c_2_B_pos,bob_s152_c_2_B_pos).
patient_(alice_and_bob_s152_c_2_B_pos,alice_s152_c_2_B_pos).
start_(alice_and_bob_s152_c_2_B_pos,d2014_01_31).

% Test
:- s152_c_2_B(bob_s152_c_2_B_pos,alice_s152_c_2_B_pos,bob_s152_c_2_B_pos,d2014_01_31,"2100-01-01").
:- halt.
