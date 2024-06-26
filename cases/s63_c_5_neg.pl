% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Bob earned $10 in 2017. Alice and Bob file separate returns. Alice is not entitled to a deduction for Bob under section 151.

% Question
% Section 63(c)(5) applies to Bob's basic standard deduction in 2017. Contradiction

% Facts
person(alice_s63_c_5_neg).
person(bob_s63_c_5_neg).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).
finance(10).
finance(500).


payment_(alice_is_paid_s63_c_5_neg).
patient_(alice_is_paid_s63_c_5_neg,alice_s63_c_5_neg).
start_(alice_is_paid_s63_c_5_neg,d2017_12_31).
amount_(alice_is_paid_s63_c_5_neg,33200).
payment_(bob_is_paid_s63_c_5_neg).
patient_(bob_is_paid_s63_c_5_neg,bob_s63_c_5_neg).
start_(bob_is_paid_s63_c_5_neg,d2017_12_31).
amount_(bob_is_paid_s63_c_5_neg,10).
marriage_(alice_and_bob_s63_c_5_neg).
agent_(alice_and_bob_s63_c_5_neg,alice_s63_c_5_neg).
agent_(alice_and_bob_s63_c_5_neg,bob_s63_c_5_neg).
start_(alice_and_bob_s63_c_5_neg,d2017_02_03).

% Test
:- \+ s63_c_5(bob_s63_c_5_neg,0,10,2017,500).
:- halt.
