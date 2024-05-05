% Text
% In 2017, Alice was paid $33200. Alice and Bob got married on Feb 3rd, 2017. Alice was a nonresident alien from August 23rd, 2015 to September 15th, 2016.

% Question
% Section 63(c)(6)(B) applies to Alice for 2017. Contradiction

% Facts
person(alice_s63_c_6_B_neg).
person(bob_s63_c_6_B_neg).

year(2015).
date("2015-08-23").
date_split("2015-08-23",2015,8,23).
date("2015-01-01").
date_split("2015-01-01",2015,1,1).
date("2015-12-31").
date_split("2015-12-31",2015,12,31).
year(2016).
date("2016-08-15").
date_split("2016-08-15",2016,8,15).
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

finance(33200).

payment_(alice_is_paid_s63_c_6_B_neg).
patient_(alice_is_paid_s63_c_6_B_neg,alice_s63_c_6_B_neg).
start_(alice_is_paid_s63_c_6_B_neg,"2017-12-31").
amount_(alice_is_paid_s63_c_6_B_neg,33200).
marriage_(alice_and_bob_s63_c_6_B_neg).
agent_(alice_and_bob_s63_c_6_B_neg,alice_s63_c_6_B_neg).
agent_(alice_and_bob_s63_c_6_B_neg,bob_s63_c_6_B_neg).
start_(alice_and_bob_s63_c_6_B_neg,"2017-02-03").
nonresident_alien_(alice_is_a_nra_s63_c_6_B_neg).
agent_(alice_is_a_nra_s63_c_6_B_neg,alice_s63_c_6_B_neg).
start_(alice_is_a_nra_s63_c_6_B_neg,"2015-08-23").
end_(alice_is_a_nra_s63_c_6_B_neg,"2016-08-15").

% Test
:- \+ s63_c_6_B(alice_s63_c_6_B_neg,2017).
:- halt.
