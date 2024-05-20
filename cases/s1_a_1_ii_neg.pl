% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse_s1_a_ii_neg's taxable income for the year 2017 is $103272.

% Question
% Alice and her spouse have to pay $24543 in taxes for the year 2017 under section 1(a)(ii). Contradiction

% Facts
person(alice_s1_a_1_ii_neg).
person(spouse_s1_a_1_ii_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(103272).
finance(24543).

s7703(alice_s1_a_1_ii_neg,spouse_s1_a_1_ii_neg,alice_and_spouse_s1_a_1_ii_neg,2017).
marriage_(alice_and_spouse_s1_a_1_ii_neg).
joint_return_(joint_return_s1_a_1_ii_neg).
agent_(joint_return_s1_a_1_ii_neg,alice_s1_a_1_ii_neg).
agent_(joint_return_s1_a_1_ii_neg,spouse_s1_a_1_ii_neg).
start_(joint_return_s1_a_1_ii_neg,d2017_01_01).
end_(joint_return_s1_a_1_ii_neg,d2017_12_31).
s63(alice_s1_a_1_ii_neg,2017,103272).

% Test
:- \+ s1_a_ii(103272,24543).
:- halt.
