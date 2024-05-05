% Text
% In 2016, Alice's income was $310192. Alice is a surviving spouse for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(1) prescribes a reduction of Alice's itemized deductions for the year 2016 by $306. Entailment

% Facts
person(alice_s68_a_1_pos).
person(spouse_s68_a_1_pos).
finance(310192).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_a_1_pos).
agent_(alice_is_paid_s68_a_1_pos,alice_s68_a_1_pos).
start_(alice_is_paid_s68_a_1_pos,"2016-12-31").
amount_(alice_is_paid_s68_a_1_pos,310192).
s2_a(alice_s68_a_1_pos,spouse_s68_a_1_pos,2016).
s68_b(alice_s68_a_1_pos,300000,2016).
gross_income(alice_s68_a_1_pos,2016,310192).

% Test
:- s68_a_1(310192,300000,306).
:- halt.
