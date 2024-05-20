% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Bob is allowed an itemized deduction of $4324. Alice and Bob file separate returns.

% Question
% Section 63(c)(6)(A) applies to Alice for 2017. Entailment

% Facts
person(alice_s63_c_6_A_pos).
person(bob_s63_c_6_A_pos).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_6_A_pos).
patient_(alice_is_paid_s63_c_6_A_pos,alice_s63_c_6_A_pos).
start_(alice_is_paid_s63_c_6_A_pos,d2017_12_31).
amount_(alice_is_paid_s63_c_6_A_pos,33200).
marriage_(alice_and_bob_s63_c_6_A_pos).
agent_(alice_and_bob_s63_c_6_A_pos,alice_s63_c_6_A_pos).
agent_(alice_and_bob_s63_c_6_A_pos,bob_s63_c_6_A_pos).
start_(alice_and_bob_s63_c_6_A_pos,d2017_02_03).
deduction_(bob_itemized_deduction_s63_c_6_A_pos).
agent_(bob_itemized_deduction_s63_c_6_A_pos,bob_s63_c_6_A_pos).
start_(bob_itemized_deduction_s63_c_6_A_pos,d2017_12_31).

% Test
:- s63_c_6_A(alice_s63_c_6_A_pos,bob_s63_c_6_A_pos,bob_itemized_deduction_s63_c_6_A_pos,2017).
:- halt.
