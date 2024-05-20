% Text
% In 2018, Alice's income was $310192. Alice is a surviving spouse for the year 2018. Alice is allowed itemized deductions of $600 under section 63.

% Question
% Section 68(f) applies to Alice for the year 2018. Entailment

% Facts
person(alice_s68_f_pos).
person(bob_s68_f_pos).
finance(310192).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

income_(alice_is_paid_s68_f_pos).
agent_(alice_is_paid_s68_f_pos,alice_s68_f_pos).
start_(alice_is_paid_s68_f_pos,d2018_12_31).
amount_(alice_is_paid_s68_f_pos,310192).
s2_a(alice_s68_f_pos,bob_s68_f_pos,2018).

% Test
:- s68_f(2018).
:- halt.
