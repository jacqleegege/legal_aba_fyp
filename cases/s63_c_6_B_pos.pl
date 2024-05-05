% Text
% In 2017, Alice was paid $33200. Alice and Bob got married on Feb 3rd, 2017. Alice was a nonresident alien from August 23rd, 2016 to September 15th, 2018.

% Question
% Section 63(c)(6)(B) applies to Alice for 2017. Entailment

% Facts
person(alice_s63_c_6_B_pos).
person(bob_s63_c_6_B_pos).

year(2016).
date("2016-08-15").
date_split("2016-08-23",2016,8,23).
date("2016-01-01").
date_split("2016-01-01",2016,1,1).
date("2016-12-31").
date_split("2016-12-31",2016,12,31).
year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).
year(2018).
date("2018-08-15").
date_split("2018-08-15",2018,8,15).
date("2018-01-01").
date_split("2018-01-01",2018,1,1).
date("2018-12-31").
date_split("2018-12-31",2018,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_6_B_pos).
patient_(alice_is_paid_s63_c_6_B_pos,alice_s63_c_6_B_pos).
start_(alice_is_paid_s63_c_6_B_pos,"2017-12-31").
amount_(alice_is_paid_s63_c_6_B_pos,33200).
marriage_(alice_and_bob_s63_c_6_B_pos).
agent_(alice_and_bob_s63_c_6_B_pos,alice_s63_c_6_B_pos).
agent_(alice_and_bob_s63_c_6_B_pos,bob_s63_c_6_B_pos).
start_(alice_and_bob_s63_c_6_B_pos,"2017-02-03").
nonresident_alien_(alice_is_a_nra_s63_c_6_B_pos).
agent_(alice_is_a_nra_s63_c_6_B_pos,alice_s63_c_6_B_pos).
start_(alice_is_a_nra_s63_c_6_B_pos,"2016-08-23").
end_(alice_is_a_nra_s63_c_6_B_pos,"2018-08-15").

% Test
:- s63_c_6_B(alice_s63_c_6_B_pos,2017).
:- halt.
