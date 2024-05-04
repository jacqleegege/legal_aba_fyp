% Text
% In 2016, Alice's income was $567192. Alice is a surviving spouse for the year 2016.

% Question
% Under section 68(b)(1)(A), Alice's applicable amount for 2016 is equal to $300000. Entailment

% Facts
person(alice).
person(spouse).
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
s2_a(alice,spouse,2016).
joint_return_(random_joint_return).

% Test
:- s68_b_1_A(alice,random_joint_return,alice,300000,2016).
:- halt.
