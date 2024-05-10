% Text
% alice_s1_a_iii_pos is married under section 7703 for the year 2017. alice_s1_a_iii_pos files a joint return with her spouse_s1_a_iii_pos for 2017. alice_s1_a_iii_pos's and her spouse_s1_a_iii_pos's taxable income for the year 2017 is $103272.

% Question
% alice_s1_a_iii_pos and her spouse_s1_a_iii_pos have to pay $24543 in taxes for the year 2017 under section 1(a)(iii). Entailment

% Facts
person(alice_s1_a_1_iii_pos).
person(spouse_s1_a_1_iii_pos).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(103272).
finance(24543).

s7703(alice_s1_a_1_iii_pos,spouse_s1_a_1_iii_pos,alice_and_spouse_s1_a_1_iii_pos,2017).
s7703_short(alice_s1_a_1_iii_pos,spouse_s1_a_1_iii_pos,2017).
marriage_(alice_and_spouse_s1_a_1_iii_pos).
joint_return_(joint_return_s1_a_1_iii_pos).
agent_(joint_return_s1_a_1_iii_pos,alice_s1_a_1_iii_pos).
agent_(joint_return_s1_a_1_iii_pos,spouse_s1_a_1_iii_pos).
start_(joint_return_s1_a_1_iii_pos,"2017-01-01").
end_(joint_return_s1_a_1_iii_pos,"2017-12-31").
s63(alice_s1_a_1_iii_pos,2017,103272).

% Test
:- s1_a_iii(103272,24543).
:- halt.
