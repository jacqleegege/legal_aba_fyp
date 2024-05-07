% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $210000.

% Question
% Alice and her spouse have to pay $75600 in taxes for the year 2017 under section 1(a)(iv). Contradiction

% Facts
person(alice_s1_a_iv_neg).
person(spouse_s1_a_iv_neg).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(210000).
finance(75600).

s7703(alice_s1_a_iv_neg,spouse_s1_a_iv_neg,alice_and_spouse_s1_a_iv_neg,2017).
marriage_(alice_and_spouse_s1_a_iv_neg).
joint_return_(joint_return_s1_a_iv_neg).
agent_(joint_return_s1_a_iv_neg,alice_s1_a_iv_neg).
agent_(joint_return_s1_a_iv_neg,spouse_s1_a_iv_neg).
start_(joint_return_s1_a_iv_neg,"2017-01-01").
end_(joint_return_s1_a_iv_neg,"2017-12-31").
s63(alice_s1_a_iv_neg,2017,210000).

% Test
:- \+ s1_a_iv(210000,75600).
:- halt.