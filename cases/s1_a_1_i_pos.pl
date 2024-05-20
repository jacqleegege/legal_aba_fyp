% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $17330.

% Question
% Alice and her spouse have to pay $2600 in taxes for the year 2017 under section 1(a)(i). Entailment

% Facts
person(alice_s1_a_1_i_pos).
person(spouse_s1_a_1_i_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(17330).
finance(2600).
s7703(alice_s1_a_1_i_pos,spouse_s1_a_1_i_pos,alice_and_spouse_s1_a_1_i_pos,2017).
marriage_(alice_and_spouse_s1_a_1_i_pos).
marriage_(alice_and_spouse_s1_a_1_i_pos).
joint_return_(joint_return_s1_a_1_i_pos).
agent_(joint_return_s1_a_1_i_pos,alice_s1_a_1_i_pos).
agent_(joint_return_s1_a_1_i_pos,spouse_s1_a_1_i_pos).
start_(joint_return_s1_a_1_i_pos,d2017_01_01).
end_(joint_return_s1_a_1_i_pos,d2017_12_31).
s63(alice_s1_a_1_i_pos,2017,17330).

% Test
:- s1_a_i(17330,2600).
:- halt.
