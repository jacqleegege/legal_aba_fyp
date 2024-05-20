% Text
% In 2016, Alice's income was $567192. Alice is married for the year 2016 under section 7703. Alice does not file a joint return.

% Question
% Section 68(b)(1)(A) applies to Alice for 2016. Contradiction

% Facts
person(alice_s68_b_1_A_neg).
person(bob_s68_b_1_A_neg).
marriage_(alice_and_bob_s68_b_1_A_neg).
finance(567192).
finance(300000).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

income_(alice_is_paid_s68_b_1_A_neg).
agent_(alice_is_paid_s68_b_1_A_neg,alice_s68_b_1_A_neg).
start_(alice_is_paid_s68_b_1_A_neg,d2016_12_31).
amount_(alice_is_paid_s68_b_1_A_neg,567192).
s7703(alice_s68_b_1_A_neg,bob_s68_b_1_A_neg,alice_and_bob_s68_b_1_A_neg,2016).
joint_return_(random_joint_return).

% Test
:- \+ s68_b_1_A(alice_s68_b_1_A_neg,random_joint_return,bob_s68_b_1_A_neg,300000,2016).
:- halt.
