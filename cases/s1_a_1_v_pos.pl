% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $684642.

% Question
% Alice and her spouse have to pay $247647 in taxes for the year 2017 under section 1(a)(v). Entailment

% Facts
person(alice_s1_a_1_v_pos).
person(spouse_s1_a_1_v_pos).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(684642).
finance(247647).

marriage_(alice_and_spouse_s1_a_1_v_pos).
s7703(alice_s1_a_1_v_pos,spouse_s1_a_1_v_pos,alice_and_spouse_s1_a_1_v_pos,2017).
joint_return_(joint_return_s1_a_1_v_pos).
agent_(joint_return_s1_a_1_v_pos,alice_s1_a_1_v_pos).
agent_(joint_return_s1_a_1_v_pos,spouse_s1_a_1_v_pos).
start_(joint_return_s1_a_1_v_pos,d2017_01_01).
end_(joint_return_s1_a_1_v_pos,d2017_12_31).
s63(alice_s1_a_1_v_pos,2017,684642).

% Test
:- s1_a_v(684642,247647).
:- halt.
