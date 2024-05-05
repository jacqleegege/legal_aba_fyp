% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice has been blind since March 20, 2016.

% Question
% Section 63(f)(2)(A) applies to Alice in 2017. Entailment

% Facts
person(alice_s63_f_2_A_pos).
person(bob_s63_f_2_A_pos).
finance(33200).

year(2016).
date("2016-03-20").
date_split("2016-03-20", 2016, 3, 20).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

payment_(alice_is_paid_s63_f_2_A_pos).
patient_(alice_is_paid_s63_f_2_A_pos,alice_s63_f_2_A_pos).
start_(alice_is_paid_s63_f_2_A_pos,"2017-12-31").
amount_(alice_is_paid_s63_f_2_A_pos,33200).
marriage_(alice_and_bob_s63_f_2_A_pos).
agent_(alice_and_bob_s63_f_2_A_pos,alice_s63_f_2_A_pos).
agent_(alice_and_bob_s63_f_2_A_pos,bob_s63_f_2_A_pos).
start_(alice_and_bob_s63_f_2_A_pos,"2017-02-03").
blindness_(alice_is_blind_s63_f_2_A_pos).
agent_(alice_is_blind_s63_f_2_A_pos,alice_s63_f_2_A_pos).
start_(alice_is_blind_s63_f_2_A_pos,"2016-03-20").

% Test
:- s63_f_2_A(alice_s63_f_2_A_pos,2017).
:- halt.
