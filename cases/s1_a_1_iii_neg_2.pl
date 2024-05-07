% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $120000.

% Question
% Alice and her spouse have to pay $37200 in taxes for the year 2017 under section 1(a)(iii). Contradiction

% Facts
person(alice_s1_a_iii_neg).
person(spouse_s1_a_iii_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(120000).
finance(37200).

s7703(alice_s1_a_iii_neg,spouse_s1_a_iii_neg,alice_and_spouse_s1_a_iii_neg,2017).
marriage_(alice_and_spouse_s1_a_iii_neg).
joint_return_(joint_return_s1_a_iii_neg).
agent_(joint_return_s1_a_iii_neg,alice_s1_a_iii_neg).
agent_(joint_return_s1_a_iii_neg,spouse_s1_a_iii_neg).
start_(joint_return_s1_a_iii_neg,"2017-01-01").
end_(joint_return_s1_a_iii_neg,"2017-12-31").
s63(alice_s1_a_iii_neg,2017,120000).

% Test
:- \+ s1_a_iii(120000,37200).
:- halt.