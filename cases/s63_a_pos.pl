% Text
% In 2017, Alice was paid $33200. She is allowed deductions under section 151 of $2000 for the year 2017. She is allowed an itemized deduction of $4252 in 2017.

% Question
% Under section 63(a), Alice's taxable income in 2017 is equal to $26948. Entailment

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(2000).
finance(4252).
finance(6252).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s151(alice,2000,alice,0,2017).
deduction_(itemized_deduction).
agent_(itemized_deduction,alice).
start_(itemized_deduction,"2017-12-31").
amount_(itemized_deduction,4252).

% Test
:- s63_a(alice,2017,26948,33200,6252).
:- halt.
