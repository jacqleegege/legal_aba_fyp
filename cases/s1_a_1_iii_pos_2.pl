% Text
% alice_s1_a_iii_pos is married under section 7703 for the year 2017. alice_s1_a_iii_pos files a joint return with her spouse_s1_a_iii_pos for 2017. alice_s1_a_iii_pos's and her spouse_s1_a_iii_pos's taxable income for the year 2017 is $127500.

% Question
% alice_s1_a_iii_pos and her spouse_s1_a_iii_pos have to pay $33385 in taxes for the year 2017 under section 1(a)(iii). Entailment

% Facts
person(alice_s1_a_1_iii_pos_2).
person(spouse_s1_a_1_iii_pos_2).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(127500).
finance(33385).

s7703(alice_s1_a_1_iii_pos_2,spouse_s1_a_1_iii_pos_2,alice_and_spouse_s1_a_1_iii_pos_2_2_2,2017).
s7703_short(alice_s1_a_1_iii_pos_2,spouse_s1_a_1_iii_pos_2,2017).
marriage_(alice_and_spouse_s1_a_1_iii_pos_2_2_2).
joint_return_(joint_return_s1_a_1_iii_pos_2).
agent_(joint_return_s1_a_1_iii_pos_2,alice_s1_a_1_iii_pos_2).
agent_(joint_return_s1_a_1_iii_pos_2,spouse_s1_a_1_iii_pos_2).
start_(joint_return_s1_a_1_iii_pos_2,"2017-01-01").
end_(joint_return_s1_a_1_iii_pos_2,"2017-12-31").
s63(alice_s1_a_1_iii_pos_2,2017,127500).

% Test
:- s1_a_iii(127500,33385).
:- halt.