% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $51232.

% Question
% Alice and her spouse have to pay $7685 in taxes for the year 2017 under section 1(a)(i). Contradiction

% Facts
person(alice_s1_a_1_i_neg_2).
person(spouse_s1_a_1_i_neg_2).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(51232).
finance(7685).
s7703(alice_s1_a_1_i_neg_2,spouse_s1_a_1_i_neg_2,alice_and_spouse_s1_a_1_i_neg_2,2017).
marriage_(alice_and_spouse_s1_a_1_i_neg_2).
joint_return_(joint_return_s1_a_1_i_neg_2).
agent_(joint_return_s1_a_1_i_neg_2,alice_s1_a_1_i_neg_2).
agent_(joint_return_s1_a_1_i_neg_2,spouse_s1_a_1_i_neg_2).
start_(joint_return_s1_a_1_i_neg_2,"2017-01-01").
end_(joint_return_s1_a_1_i_neg_2,"2017-12-31").
s63(alice_s1_a_1_i_neg_2,2017,51232).

% Test
:- \+ s1_a_i(51232,7685).
:- halt.
