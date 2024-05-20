% Text
% In 2014, Alice's income was $310192. Alice is a surviving spouse for the year 2014. Alice is allowed itemized deductions of $600 under section 63.

% Question
% Section 68(f) applies to Alice for the year 2014. Contradiction

% Facts
person(alice_s68_f_neg).
person(bob_s68_f_neg).
finance(310192).

year(2014).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

income_(alice_is_paid_s68_f_neg).
agent_(alice_is_paid_s68_f_neg,alice_s68_f_neg).
start_(alice_is_paid_s68_f_neg,d2014_12_31).
amount_(alice_is_paid_s68_f_neg,310192).
s2_a(alice_s68_f_neg,bob_s68_f_neg,2014).

% Test
:- \+ s68_f(2014).
:- halt.
