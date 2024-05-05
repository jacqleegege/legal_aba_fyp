% Text
% In 2016, Alice's income was $267192. Alice is a head of household for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(1) prescribes a reduction of Alice's itemized deductions for the year 2016 by $306. Contradiction

% Facts
person(alice_s68_a_1_neg).
finance(267192).
finance(275000).
finance(306).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_a_1_neg).
agent_(alice_is_paid_s68_a_1_neg,alice_s68_a_1_neg).
start_(alice_is_paid_s68_a_1_neg,"2016-12-31").
amount_(alice_is_paid_s68_a_1_neg,267192).
s2_b(alice_s68_a_1_neg,alice_s68_a_1_neg,2016).
gross_income(alice_s68_a_1_neg,2016,267192).
s68_b(alice_s68_a_1_neg,275000,2016).

% Test
:- \+ s68_a_1(267192,275000,306).
:- halt.
