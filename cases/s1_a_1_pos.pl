% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her husband's taxable income for the year 2017 is $17330.

% Question
% Alice and her husband have to pay $2600 in taxes for the year 2017 under section 1(a). Entailment

% Facts
person(alice_s1_a_1_pos).
person(spouse_s1_a_1_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(17330).
s7703(alice_s1_a_1_pos,spouse_s1_a_1_pos,alice_and_spouse_s1_a_1_pos,2017).
marriage_(alice_and_spouse_s1_a_1_pos).
joint_return_(joint_return_s1_a_1_pos).
agent_(joint_return_s1_a_1_pos,alice_s1_a_1_pos).
agent_(joint_return_s1_a_1_pos,spouse_s1_a_1_pos).
start_(joint_return_s1_a_1_pos,"2017-01-01").
end_(joint_return_s1_a_1_pos,"2017-12-31").
s63(alice_s1_a_1_pos,2017,17330).

% Test
:- s1_a(alice_s1_a_1_pos,2017,17330,2600).
:- halt.
