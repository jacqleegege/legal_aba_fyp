% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice is entitled to an additional standard deduction of $600 each for herself and for Bob, under section 63(f)(1)(A) and 63(f)(1)(B), respectively.

% Question
% Under section 63(c)(3), Alice's additional standard deduction in 2017 is equal to $300. Contradiction

% Facts
person(alice_s63_c_3_neg).
person(bob_s63_c_3_neg).

year(2017).
date("2017-02-03").
date_split("2017-02-03",2017,2,3).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(300).

payment_(alice_is_paid_s63_c_3_neg).
patient_(alice_is_paid_s63_c_3_neg,alice_s63_c_3_neg).
start_(alice_is_paid_s63_c_3_neg,"2017-12-31").
amount_(alice_is_paid_s63_c_3_neg,33200).
marriage_(alice_and_bob_s63_c_3_neg).
agent_(alice_and_bob_s63_c_3_neg,alice_s63_c_3_neg).
agent_(alice_and_bob_s63_c_3_neg,bob_s63_c_3_neg).
start_(alice_and_bob_s63_c_3_neg,"2017-02-03").
s63_f_1_A(alice_s63_c_3_neg,2017).
s63_f_1_B(alice_s63_c_3_neg,bob_s63_c_3_neg,2017).

% Test
:- \+ s63_c_3(alice_s63_c_3_neg,300,2017).
:- halt.
