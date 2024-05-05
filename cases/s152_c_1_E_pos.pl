% Text
% Alice has a son, Bob. From September 1st, 2015 to November 3rd, 2019, Alice and Bob lived in the same home. Bob married Charlie on October 23rd, 2018. Bob and Charlie file separate returns.

% Question
% Section 152(c)(1)(E) applies to Bob for the year 2019. Entailment

% Facts
person(alice_s152_c_1_E_pos).
person(bob_s152_c_1_E_pos).
person(charlie_s152_c_1_E_pos).

year(2015).
date("2015-09-01").
date_split("2015-09-01", 2015, 9, 1).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2018).
date("2018-10-23").
date_split("2018-10-23", 2018, 10, 23).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

year(2019).
date("2019-11-03").
date_split("2019-11-03", 2019, 11, 3).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

son_(bob_is_son_s152_c_1_E_pos).
agent_(bob_is_son_s152_c_1_E_pos,bob_s152_c_1_E_pos).
patient_(bob_is_son_s152_c_1_E_pos,alice_s152_c_1_E_pos).
residence_(alice_and_bob_s152_c_1_E_pos).
agent_(alice_and_bob_s152_c_1_E_pos,alice_s152_c_1_E_pos).
agent_(alice_and_bob_s152_c_1_E_pos,bob_s152_c_1_E_pos).
patient_(alice_and_bob_s152_c_1_E_pos,home_s152_c_1_E_pos).
start_(alice_and_bob_s152_c_1_E_pos,"2015-09-01").
end_(alice_and_bob_s152_c_1_E_pos,"2019-11-03").
marriage_(bob_and_charlie_s152_c_1_E_pos).
agent_(bob_and_charlie_s152_c_1_E_pos,bob_s152_c_1_E_pos).
agent_(bob_and_charlie_s152_c_1_E_pos,charlie_s152_c_1_E_pos).
start_(bob_and_charlie_s152_c_1_E_pos,"2018-10-23").

% Test
:- s152_c_1_E(bob_s152_c_1_E_pos,charlie_s152_c_1_E_pos,2019).
:- halt.
