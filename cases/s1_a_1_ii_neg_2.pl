% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse_s1_a_ii_neg's taxable income for the year 2017 is $72000.

% Question
% Alice and her spouse have to pay $10800 in taxes for the year 2017 under section 1(a)(ii). Contradiction

% Facts
person(alice_s1_a_ii_neg).
person(spouse_s1_a_ii_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(72000).
finance(10800).

s7703(alice_s1_a_ii_neg,spouse_s1_a_ii_neg,alice_and_spouse_s1_a_ii_neg,2017).
marriage_(alice_and_spouse_s1_a_ii_neg).
joint_return_(joint_return_s1_a_ii_neg).
agent_(joint_return_s1_a_ii_neg,alice_s1_a_ii_neg).
agent_(joint_return_s1_a_ii_neg,spouse_s1_a_ii_neg).
start_(joint_return_s1_a_ii_neg,"2017-01-01").
end_(joint_return_s1_a_ii_neg,"2017-12-31").
s63(alice_s1_a_ii_neg,2017,72000).

% Test
:- \+ s1_a_ii(72000,10800).
:- halt.