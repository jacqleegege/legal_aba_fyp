% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice was born March 2nd, 1950 and Bob was born March 3rd, 1955. In addition, Bob is allowed an exemption for Alice under section 151(b) for the year 2017.

% Question
% Section 63(f)(1)(B) applies to Bob with Alice as the spouse in 2017. Entailment

% Facts
person(alice_s63_f_1_B_pos).
person(bob_s63_f_1_B_pos).
finance(33200).

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(1950).
date("1950-03-02").
date_split("1950-03-02", 1950, 3, 2).
date("1950-01-01").
date_split("1950-01-01", 1950, 1, 1).
date("1950-12-31").
date_split("1950-12-31", 1950, 12, 31).

year(1955).
date("1955-03-03").
date_split("1955-03-03", 1955, 3, 3).
date("1955-01-01").
date_split("1955-01-01", 1955, 1, 1).
date("1955-12-31").
date_split("1955-12-31", 1955, 12, 31).

payment_(alice_is_paid_s63_f_1_B_pos).
patient_(alice_is_paid_s63_f_1_B_pos,alice_s63_f_1_B_pos).
start_(alice_is_paid_s63_f_1_B_pos,"2017-12-31").
amount_(alice_is_paid_s63_f_1_B_pos,33200).
marriage_(alice_and_bob_s63_f_1_B_pos).
agent_(alice_and_bob_s63_f_1_B_pos,alice_s63_f_1_B_pos).
agent_(alice_and_bob_s63_f_1_B_pos,bob_s63_f_1_B_pos).
start_(alice_and_bob_s63_f_1_B_pos,"2017-02-03").
birth_(alice_is_born_s63_f_1_B_pos).
agent_(alice_is_born_s63_f_1_B_pos,alice_s63_f_1_B_pos).
start_(alice_is_born_s63_f_1_B_pos,"1950-03-02").
end_(alice_is_born_s63_f_1_B_pos,"1950-03-02").
birth_(bob_is_born_s63_f_1_B_pos).
agent_(bob_is_born_s63_f_1_B_pos,bob_s63_f_1_B_pos).
start_(bob_is_born_s63_f_1_B_pos,"1955-03-03").
end_(bob_is_born_s63_f_1_B_pos,"1955-03-03").
s151_b_applies(bob_s63_f_1_B_pos,alice_s63_f_1_B_pos,2017).

% Test
:- s63_f_1_B(bob_s63_f_1_B_pos,alice_s63_f_1_B_pos,2017).
:- halt.
