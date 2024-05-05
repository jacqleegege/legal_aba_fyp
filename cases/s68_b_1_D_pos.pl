% Text
% In 2016, Alice's income was $567192. Alice is married for the year 2016 under section 7703. Alice does not file a joint return.

% Question
% Under section 68(b)(1)(D), Alice's applicable amount for 2016 is equal to $150000. Entailment

% Facts
person(alice_s68_b_1_D_pos).
person(bob_s68_b_1_D_pos).
finance(567192).
finance(150000).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid_s68_b_1_D_pos).
agent_(alice_is_paid_s68_b_1_D_pos,alice_s68_b_1_D_pos).
start_(alice_is_paid_s68_b_1_D_pos,"2016-12-31").
amount_(alice_is_paid_s68_b_1_D_pos,567192).
marriage_(alice_and_bob_s68_b_1_D_pos),
agent_(alice_and_bob_s68_b_1_D_pos,alice_s68_b_1_D_pos),
agent_(alice_and_bob_s68_b_1_D_pos,bob_s68_b_1_D_pos),
s7703(alice_s68_b_1_D_pos,bob_s68_b_1_D_pos,alice_and_bob_s68_b_1_D_pos,2016).

% Test
:- s68_b_1_D(alice_s68_b_1_D_pos,150000,2016).
:- halt.
