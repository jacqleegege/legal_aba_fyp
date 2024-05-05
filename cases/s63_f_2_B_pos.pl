% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice has been blind since Feb 28, 2014. In addition, Bob is allowed an exemption for Alice under section 151(b) for the year 2017.

% Question
% Section 63(f)(2)(B) applies to Bob in 2017. Entailment

% Facts
person(alice_s63_f_2_B_pos).
person(bob_s63_f_2_B_pos).
finance(33200).

year(2014).
date("2014-02-28").
date_split("2014-02-28", 2014, 2, 28).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).


payment_(alice_is_paid_s63_f_2_B_pos).
patient_(alice_is_paid_s63_f_2_B_pos,alice_s63_f_2_B_pos).
start_(alice_is_paid_s63_f_2_B_pos,"2017-12-31").
amount_(alice_is_paid_s63_f_2_B_pos,33200).
marriage_(alice_and_bob_s63_f_2_B_pos).
agent_(alice_and_bob_s63_f_2_B_pos,alice_s63_f_2_B_pos).
agent_(alice_and_bob_s63_f_2_B_pos,bob_s63_f_2_B_pos).
start_(alice_and_bob_s63_f_2_B_pos,"2017-02-03").
blindness_(alice_is_blind_s63_f_2_B_pos).
agent_(alice_is_blind_s63_f_2_B_pos,alice_s63_f_2_B_pos).
start_(alice_is_blind_s63_f_2_B_pos,"2014-02-28").
s151_b_applies(bob_s63_f_2_B_pos,alice_s63_f_2_B_pos,2017).

% Test
:- s63_f_2_B(bob_s63_f_2_B_pos,alice_s63_f_2_B_pos,2017).
:- halt.
