% Text
% Alice has a son, Bob, who was born January 31st, 2014.

% Question
% Bob bears a relationship to Alice under section 152(c)(2). Entailment

% Facts
person(alice_s152_c_2_pos).
person(bob_s152_c_2_pos).

year(2014).
date("2014-01-31").
date_split("2014-01-31", 2014, 1, 31).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

son_(alice_and_bob_s152_c_2_pos).
agent_(alice_and_bob_s152_c_2_pos,bob_s152_c_2_pos).
patient_(alice_and_bob_s152_c_2_pos,alice_s152_c_2_pos).
start_(alice_and_bob_s152_c_2_pos,"2014-01-31").

% Test
:- s152_c_2(bob_s152_c_2_pos,alice_s152_c_2_pos,"2014-01-31","2100-01-01").
:- halt.
