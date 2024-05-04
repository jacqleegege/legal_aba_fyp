% Text
% Alice is married under section 7703 for the year 2017. Alice files a joint return with her spouse for 2017. Alice's and her spouse's taxable income for the year 2017 is $684642.

% Question
% Alice and her spouse have to pay $247647 in taxes for the year 2017 under section 1(a)(v). Entailment

% Facts
person(alice).
person(spouse).
year(2017).
date("2017-01-01").
date("2017-12-31").
date_split("2017-01-01",2017,1,1).
date_split("2017-12-31",2017,12,31).
finance(684642).
marriage_(alice_and_spouse).
s7703(alice,spouse,alice_and_spouse,2017).
joint_return_(joint_return).
agent_(joint_return,alice).
agent_(joint_return,spouse).
start_(joint_return,"2017-01-01").
end_(joint_return,"2017-12-31").
s63(alice,2017,684642).

% Test
:- s1_a_v(684642,247647).
:- halt.
