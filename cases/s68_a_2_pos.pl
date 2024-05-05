% Text
% In 2016, Alice's income was $277192. Alice is a head of household for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(2) prescribes a reduction of Alice's itemized deductions for the year 2016 by $48000. Entailment

% Facts
person(alice_s68_a_2_pos).
finance(277192).
finance(60000).
finance(48000).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_a_2_pos).
agent_(alice_is_paid_s68_a_2_pos,alice_s68_a_2_pos).
start_(alice_is_paid_s68_a_2_pos,"2016-12-31").
amount_(alice_is_paid_s68_a_2_pos,277192).
s63_d(alice_s68_a_2_pos,60000,60000,2016).
s2_b(alice_s68_a_2_pos,alice_s68_a_2_pos,2016).

% Test
:- s68_a_2(alice_s68_a_2_pos,60000,48000,2016).
:- halt.
