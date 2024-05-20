% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $89150.

% Question
% Alice and her spouse have to pay $20165 in taxes for the year 2017 under section 1(a)(ii). Entailment

% Facts
person(alice_s1_a_1_ii_pos_2).
person(spouse_s1_a_1_ii_pos_2).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(89150).
finance(20165).

s7703(alice_s1_a_1_ii_pos_2,spouse_s1_a_1_ii_pos_2,alice_and_spouse_s1_a_1_ii_pos_2_2_2,2017).
marriage_(alice_and_spouse_s1_a_1_ii_pos_2_2_2).
joint_return_(joint_return_s1_a_1_ii_pos_2).
agent_(joint_return_s1_a_1_ii_pos_2,alice_s1_a_1_ii_pos_2).
agent_(joint_return_s1_a_1_ii_pos_2,spouse_s1_a_1_ii_pos_2).
start_(joint_return_s1_a_1_ii_pos_2,d2017_01_01).
end_(joint_return_s1_a_1_ii_pos_2,d2017_12_31).
s63(alice_s1_a_1_ii_pos_2,2017,89150).

% Test
:- s1_a_ii(89150,20165).
:- halt.