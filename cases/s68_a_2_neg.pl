% Text
% In 2016, Alice's income was $295192. Alice is a surviving spouse for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(2) prescribes a reduction of Alice's itemized deductions for the year 2016 by $47000. Contradiction

% Facts
person(alice_s68_a_2_neg).
person(spouse_s68_a_2_neg).
finance(295192).
finance(60000).
finance(47000).


year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).


income_(alice_is_paid_s68_a_2_neg).
agent_(alice_is_paid_s68_a_2_neg,alice_s68_a_2_neg).
start_(alice_is_paid_s68_a_2_neg,"2016-12-31").
amount_(alice_is_paid_s68_a_2_neg,295192).
s63_d(alice_s68_a_2_neg,60000,60000,2016).
s2_a(alice_s68_a_2_neg,spouse_s68_a_2_neg,2016).

% Test
:- \+ s68_a_2(alice_s68_a_2_neg,60000,47000,2016).
:- halt.
