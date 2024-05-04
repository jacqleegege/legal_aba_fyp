% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Bob and Alice file a joint return for 2017.

% Question
% Section 63(c)(6)(A) applies to Alice for 2017. Contradiction

% Facts
person(alice).
person(bob).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2017-02-03").
joint_return_(bob_and_alice_joint_return).
agent_(bob_and_alice_joint_return,bob).
agent_(bob_and_alice_joint_return,alice).
start_(bob_and_alice_joint_return,"2017-01-01").
end_(bob_and_alice_joint_return,"2017-12-31").
deduction_(random_deduction).

% Test
:- \+ s63_c_6_A(alice,bob,random_deduction,2017).
:- halt.
