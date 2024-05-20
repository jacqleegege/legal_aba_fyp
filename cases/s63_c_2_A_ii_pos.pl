% Text
% In 2017, Alice was paid $33200. Alice is a surviving spouse for 2017.

% Question
% Section 63(c)(2)(A)(ii) applies to Alice in 2017. Entailment

% Facts
person(alice_s63_c_2_A_ii_pos).
person(spouse_s63_c_2_A_ii_pos).

year(2017).
date(d2017_02_03).
date_split(d2017_02_03,2017,2,3).
date(d2017_01_01).
date_split(d2017_01_01,2017,1,1).
date(d2017_12_31).
date_split(d2017_12_31,2017,12,31).

finance(33200).

payment_(alice_is_paid_s63_c_2_A_ii_pos).
patient_(alice_is_paid_s63_c_2_A_ii_pos,alice_s63_c_2_A_ii_pos).
start_(alice_is_paid_s63_c_2_A_ii_pos,d2017_12_31).
amount_(alice_is_paid_s63_c_2_A_ii_pos,33200).
s2_a(alice_s63_c_2_A_ii_pos,spouse_s63_c_2_A_ii_pos,2017).

% Test
:- s63_c_2_A_ii(alice_s63_c_2_A_ii_pos,2017).
:- halt.
