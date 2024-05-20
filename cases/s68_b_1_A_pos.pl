% Text
% In 2016, Alice's income was $567192. Alice is a surviving spouse for the year 2016.

% Question
% Under section 68(b)(1)(A), Alice's applicable amount for 2016 is equal to $300000. Entailment

% Facts
person(alice_s68_b_1_A_pos).
person(spouse_s68_b_1_A_pos).
finance(567192).
finance(300000).


year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

income_(alice_is_paid_s68_b_1_A_pos).
agent_(alice_is_paid_s68_b_1_A_pos,alice_s68_b_1_A_pos).
start_(alice_is_paid_s68_b_1_A_pos,d2016_12_31).
amount_(alice_is_paid_s68_b_1_A_pos,567192).
s2_a(alice_s68_b_1_A_pos,spouse_s68_b_1_A_pos,2016).
joint_return_(random_joint_return).

% Test
:- s68_b_1_A(alice_s68_b_1_A_pos,random_joint_return,alice_s68_b_1_A_pos,300000,2016).
:- halt.
