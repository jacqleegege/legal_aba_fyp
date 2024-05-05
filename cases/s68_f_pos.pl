% Text
% In 2018, Alice's income was $310192. Alice is a surviving spouse for the year 2018. Alice is allowed itemized deductions of $600 under section 63.

% Question
% Section 68(f) applies to Alice for the year 2018. Entailment

% Facts
person(alice_s68_f_pos).
person(bob_s68_f_pos).
finance(310192).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

income_(alice_is_paid_s68_f_pos).
agent_(alice_is_paid_s68_f_pos,alice_s68_f_pos).
start_(alice_is_paid_s68_f_pos,"2018-12-31").
amount_(alice_is_paid_s68_f_pos,310192).
s2_a(alice_s68_f_pos,bob_s68_f_pos,2018).

% Test
:- s68_f(2018).
:- halt.
