% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice is entitled to a deduction for Bob under section 151(b). Bob had no gross income in 2017.

% Question
% Under section 63(c)(5), Bob's basic standard deduction in 2017 is equal to at most $500. Entailment

% Facts
person(alice_s63_c_5_pos).
person(bob_s63_c_5_pos).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(500).

payment_(alice_is_paid_s63_c_5_pos).
patient_(alice_is_paid_s63_c_5_pos,alice_s63_c_5_pos).
start_(alice_is_paid_s63_c_5_pos,"2017-12-31").
amount_(alice_is_paid_s63_c_5_pos,33200).
marriage_(alice_and_bob_s63_c_5_pos).
agent_(alice_and_bob_s63_c_5_pos,alice_s63_c_5_pos).
agent_(alice_and_bob_s63_c_5_pos,bob_s63_c_5_pos).
start_(alice_and_bob_s63_c_5_pos,"2017-02-03").
s151_b_applies(alice_s63_c_5_pos,bob_s63_c_5_pos,2017).

% Test
:- s63_c_5(bob_s63_c_5_pos,0,0,2017,500).
:- halt.
