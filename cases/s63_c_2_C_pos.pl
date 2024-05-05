% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice and Bob file separate returns.

% Question
% Under section 63(c)(2)(C), Alice's basic standard deduction in 2017 is equal to $3000. Entailment

% Facts
person(alice_s63_c_2_C_pos).
person(bob_s63_c_2_C_pos).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(3000).

payment_(alice_is_paid_s63_c_2_C_pos).
patient_(alice_is_paid_s63_c_2_C_pos,alice_s63_c_2_C_pos).
start_(alice_is_paid_s63_c_2_C_pos,"2017-12-31").
amount_(alice_is_paid_s63_c_2_C_pos,33200).
marriage_(alice_and_bob_s63_c_2_C_pos).
agent_(alice_and_bob_s63_c_2_C_pos,alice_s63_c_2_C_pos).
agent_(alice_and_bob_s63_c_2_C_pos,bob_s63_c_2_C_pos).
start_(alice_and_bob_s63_c_2_C_pos,"2017-02-03").

% Test
:- s63_c_2_C(2017,3000).
:- halt.
