% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $22360.

% Question
% Alice and her spouse have to pay $3354 in taxes for the year 2017 under section 1(a)(i). Entailment

% Facts
person(alice_s1_a_i_pos_2).
person(spouse_s1_a_i_pos_2).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(22360).
finance(3354).
s7703(alice_s1_a_i_pos_2,spouse_s1_a_i_pos_2,alice_and_spouse_s1_a_i_pos_2,2017).
marriage_(alice_and_spouse_s1_a_i_pos_2).
joint_return_(joint_return_s1_a_i_pos_2).
agent_(joint_return_s1_a_i_pos_2,alice_s1_a_i_pos_2).
agent_(joint_return_s1_a_i_pos_2,spouse_s1_a_i_pos_2).
start_(joint_return_s1_a_i_pos_2,"2017-01-01").
end_(joint_return_s1_a_i_pos_2,"2017-12-31").
s63(alice_s1_a_i_pos_2,2017,22360).

% Test
:- s1_a_i(22360,3354).
:- halt.