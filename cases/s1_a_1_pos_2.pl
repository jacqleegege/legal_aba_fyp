% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her husband's taxable income for the year 2017 is $140000.

% Question
% Alice and her husband have to pay $35929 in taxes for the year 2017 under section 1(a). Entailment

% Facts
person(alice_s1_a_1_pos_2).
person(spouse_s1_a_1_pos_2).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(140000).
finance(35929).
s7703(alice_s1_a_1_pos_2,spouse_s1_a_1_pos_2,alice_and_spouse_s1_a_1_pos_2_2_2_2,2017).
marriage_(alice_and_spouse_s1_a_1_pos_2_2_2_2).
joint_return_(joint_return_s1_a_1_pos_2).
agent_(joint_return_s1_a_1_pos_2,alice_s1_a_1_pos_2).
agent_(joint_return_s1_a_1_pos_2,spouse_s1_a_1_pos_2).
start_(joint_return_s1_a_1_pos_2,"2017-01-01").
end_(joint_return_s1_a_1_pos_2,"2017-12-31").
s63(alice_s1_a_1_pos_2,2017,140000).

% Test
:- s1_a(alice_s1_a_1_pos_2,2017,140000,35929).
:- halt.