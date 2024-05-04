% Text
% In 2017, Alice was paid $33200. She is allowed a deduction under $1200 for the year 2017 for donating cash to charity.

% Question
% Alice's deduction for 2017 falls under section 63(d). Entailment

% Facts
person(alice).
finance(33200).
finance(1200).

year(2017).
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
deduction_(deduction_alice_2017).
agent_(deduction_alice_2017,alice).
start_(deduction_alice_2017,"2017-12-31").
amount_(deduction_alice_2017,1200).

% Test
:- s63_d(alice,1200,1200,2017).
:- halt.
