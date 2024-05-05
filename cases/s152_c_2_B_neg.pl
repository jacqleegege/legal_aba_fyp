% Text
% Alice has a son, Bob, who was born January 31st, 2014.

% Question
% Bob bears a relationship to Alice under section 152(c)(2)(B). Contradiction

% Facts
person(alice_s152_c_2_B_neg).
person(bob_s152_c_2_B_neg).

year(2014).
date("2014-01-31").
date_split("2014-01-31", 2014, 1, 31).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

son_(alice_and_bob_s152_c_2_B_neg).
agent_(alice_and_bob_s152_c_2_B_neg,bob_s152_c_2_B_neg).
patient_(alice_and_bob_s152_c_2_B_neg,alice_s152_c_2_B_neg).
start_(alice_and_bob_s152_c_2_B_neg,"2014-01-31").

% Test
:- \+ s152_c_2_B(bob_s152_c_2_B_neg,alice_s152_c_2_B_neg,bob_s152_c_2_B_neg,"2014-01-31","2100-01-01").
:- halt.
