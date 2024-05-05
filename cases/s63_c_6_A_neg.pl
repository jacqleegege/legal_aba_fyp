% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Bob and Alice file a joint return for 2017.

% Question
% Section 63(c)(6)(A) applies to Alice for 2017. Contradiction

% Facts
person(alice_s63_c_6_A_neg).
person(bob_s63_c_6_A_neg).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_6_A_neg).
patient_(alice_is_paid_s63_c_6_A_neg,alice_s63_c_6_A_neg).
start_(alice_is_paid_s63_c_6_A_neg,"2017-12-31").
amount_(alice_is_paid_s63_c_6_A_neg,33200).
marriage_(alice_and_bob_s63_c_6_A_neg).
agent_(alice_and_bob_s63_c_6_A_neg,alice_s63_c_6_A_neg).
agent_(alice_and_bob_s63_c_6_A_neg,bob_s63_c_6_A_neg).
start_(alice_and_bob_s63_c_6_A_neg,"2017-02-03").
joint_return_(bob_and_alice_joint_return_s63_c_6_A_neg).
agent_(bob_and_alice_joint_return_s63_c_6_A_neg,bob_s63_c_6_A_neg).
agent_(bob_and_alice_joint_return_s63_c_6_A_neg,alice_s63_c_6_A_neg).
start_(bob_and_alice_joint_return_s63_c_6_A_neg,"2017-01-01").
end_(bob_and_alice_joint_return_s63_c_6_A_neg,"2017-12-31").
deduction_(random_deduction).

% Test
:- \+ s63_c_6_A(alice_s63_c_6_A_neg,bob_s63_c_6_A_neg,random_deduction,2017).
:- halt.
