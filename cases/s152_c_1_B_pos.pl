% Text
% Alice has a son, Bob. From September 1st, 2015 to November 3rd, 2019, Alice and Bob lived in the same home.

% Question
% Section 152(c)(1)(B) applies to Bob with Alice as the taxpayer for the year 2016. Entailment

% Facts
person(alice_s152_c_1_B_pos).
person(bob_s152_c_1_B_pos).

year(2015).
date("2015-09-01").
date_split("2015-09-01", 2015, 9, 1).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

year(2019).
date("2019-11-03").
date_split("2019-11-03", 2019, 11, 3).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

son_(bob_is_son_s152_c_1_B_pos).
agent_(bob_is_son_s152_c_1_B_pos,bob_s152_c_1_B_pos).
patient_(bob_is_son_s152_c_1_B_pos,alice_s152_c_1_B_pos).
residence_(alice_and_bob_s152_c_1_B_pos).
agent_(alice_and_bob_s152_c_1_B_pos,alice_s152_c_1_B_pos).
agent_(alice_and_bob_s152_c_1_B_pos,bob_s152_c_1_B_pos).
patient_(alice_and_bob_s152_c_1_B_pos,home_s152_c_1_B_pos).
start_(alice_and_bob_s152_c_1_B_pos,"2015-09-01").
end_(alice_and_bob_s152_c_1_B_pos,"2019-11-03").

% Test
:- s152_c_1_B(bob_s152_c_1_B_pos,home_s152_c_1_B_pos,alice_s152_c_1_B_pos,"2015-09-01","2019-11-03",2016).
:- halt.
