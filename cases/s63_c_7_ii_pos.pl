% Text
% In 2019, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2019. Alice and Bob file separate returns in 2019.

% Question
% Under section 63(c)(7)(ii), Alice's basic standard deduction in 2019 is equal to $12000. Entailment

% Facts
person(alice_s63_c_7_ii_pos).
person(bob_s63_c_7_ii_pos).
finance(33200).
finance(12000).

year(2019).
date("2019-02-03").
date_split("2019-02-03", 2019, 2, 3).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

payment_(alice_is_paid_s63_c_7_ii_pos).
patient_(alice_is_paid_s63_c_7_ii_pos,alice_s63_c_7_ii_pos).
start_(alice_is_paid_s63_c_7_ii_pos,"2019-12-31").
amount_(alice_is_paid_s63_c_7_ii_pos,33200).
marriage_(alice_and_bob_s63_c_7_ii_pos).
agent_(alice_and_bob_s63_c_7_ii_pos,alice_s63_c_7_ii_pos).
agent_(alice_and_bob_s63_c_7_ii_pos,bob_s63_c_7_ii_pos).
start_(alice_and_bob_s63_c_7_ii_pos,"2019-02-03").

% Test
:- s63_c_7_ii(2019,12000).
:- halt.
