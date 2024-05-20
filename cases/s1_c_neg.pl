% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $17330.

% Question
% Alice and her spouse have to pay $2600 in taxes for the year 2017 under section 1(c). Contradiction

% Facts
person(alice_s1_c_neg).
person(spouse_s1_c_neg).
year(2017).
date(d2017_01_01).
date(d2017_12_31).
date_split(d2017_01_01,2017,1,1).
date_split(d2017_12_31,2017,12,31).
finance(17330).
finance(2600).

marriage_(alice_and_spouse_s1_c_neg).
s7703(alice_s1_c_neg,spouse_s1_c_neg,alice_and_spouse_s1_c_neg,2017).
joint_return_(joint_return_s1_c_neg).
agent_(joint_return_s1_c_neg,alice_s1_c_neg).
agent_(joint_return_s1_c_neg,spouse_s1_c_neg).
start_(joint_return_s1_c_neg,d2017_01_01).
end_(joint_return_s1_c_neg,d2017_12_31).
s63(alice_s1_c_neg,2017,17330).

% Test
:- \+ s1_c(alice_s1_c_neg,2017,17330,2600).
:- halt.
