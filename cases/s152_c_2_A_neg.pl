% Text
% Alice has a brother, Bob, who was born January 31st, 2014.

% Question
% Bob bears a relationship to Alice under section 152(c)(2)(A). Contradiction

% Facts
person(alice_s152_c_2_A_neg).
person(bob_s152_c_2_A_neg).
person(alice_child_s152_c_2_A_neg).

year(2014).
date("2014-01-31").
date_split("2014-01-31", 2014, 1, 31).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).


brother_(alice_and_bob_s152_c_2_A_neg).
agent_(alice_and_bob_s152_c_2_A_neg,bob_s152_c_2_A_neg).
patient_(alice_and_bob_s152_c_2_A_neg,alice_s152_c_2_A_neg).
start_(alice_and_bob_s152_c_2_A_neg,"2014-01-31").

% Test
:- \+ s152_c_2_A(bob_s152_c_2_A_neg,alice_s152_c_2_A_neg,alice_child_s152_c_2_A_neg,"2014-01-31","2100-01-01").
:- halt.
