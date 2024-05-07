% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $270000.

% Question
% Alice and her spouse have to pay $83429 in taxes for the year 2017 under section 1(a)(v). Entailment

% Facts
person(alice_s1_a_1_v_pos).
person(spouse_s1_a_1_v_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(270000).
finance(83429).

marriage_(alice_and_spouse_s1_a_1_v_pos).
s7703(alice_s1_a_1_v_pos,spouse_s1_a_1_v_pos,alice_and_spouse_s1_a_1_v_pos,2017).
joint_return_(joint_return_s1_a_1_v_pos).
agent_(joint_return_s1_a_1_v_pos,alice_s1_a_1_v_pos).
agent_(joint_return_s1_a_1_v_pos,spouse_s1_a_1_v_pos).
start_(joint_return_s1_a_1_v_pos,"2017-01-01").
end_(joint_return_s1_a_1_v_pos,"2017-12-31").
s63(alice_s1_a_1_v_pos,2017,270000).

% Test
:- s1_a_v(270000,83429).
:- halt.