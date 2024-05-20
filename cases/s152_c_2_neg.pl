% Text
% Alice has a son, Bob, who was born January 31st, 2014.

% Question
% Alice bears a relationship to Bob under section 152(c)(2). Contradiction

% Facts
person(alice_s152_c_2_neg).
person(bob_s152_c_2_neg).

year(2014).
date(d2014_01_31).
date_split(d2014_01_31, 2014, 1, 31).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

son_(alice_and_bob_s152_c_2_neg).
agent_(alice_and_bob_s152_c_2_neg,bob_s152_c_2_neg).
patient_(alice_and_bob_s152_c_2_neg,alice_s152_c_2_neg).
start_(alice_and_bob_s152_c_2_neg,d2014_01_31).

% Test
:- \+ s152_c_2(alice_s152_c_2_neg,bob_s152_c_2_neg,d2014_01_31,"2100-01-01").
:- halt.
