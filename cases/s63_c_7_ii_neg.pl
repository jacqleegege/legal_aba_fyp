% Text
% In 2019, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2019.  Alice and Bob file separate returns in 2019.

% Question
% Under section 63(c)(7)(ii), Alice's basic standard deduction in 2019 is equal to $3000. Contradiction

% Facts
person(alice_s63_c_7_ii_neg).
person(bob_s63_c_7_ii_neg).
finance(33200).
finance(3000).

year(2019).
date(d2019_02_03).
date_split(d2019_02_03, 2019, 2, 3).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

payment_(alice_is_paid_s63_c_7_ii_neg).
patient_(alice_is_paid_s63_c_7_ii_neg,alice_s63_c_7_ii_neg).
start_(alice_is_paid_s63_c_7_ii_neg,d2019_12_31).
amount_(alice_is_paid_s63_c_7_ii_neg,33200).
marriage_(alice_and_bob_s63_c_7_ii_neg).
agent_(alice_and_bob_s63_c_7_ii_neg,alice_s63_c_7_ii_neg).
agent_(alice_and_bob_s63_c_7_ii_neg,bob_s63_c_7_ii_neg).
start_(alice_and_bob_s63_c_7_ii_neg,d2019_02_03).

% Test
:- \+ s63_c_7_ii(2019,3000).
:- halt.
