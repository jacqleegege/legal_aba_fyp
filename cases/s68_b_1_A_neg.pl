% Text
% In 2016, Alice's income was $567192. Alice is married for the year 2016 under section 7703. Alice does not file a joint return.

% Question
% Section 68(b)(1)(A) applies to Alice for 2016. Contradiction

% Facts
person(alice).
person(bob).
marriage_(alice_and_bob).
finance(567192).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2016-12-31").
amount_(alice_is_paid,567192).
s7703(alice,bob,alice_and_bob,2016).
joint_return_(random_joint_return).

% Test
:- \+ s68_b_1_A(alice,random_joint_return,bob,300000,2016).
:- halt.
