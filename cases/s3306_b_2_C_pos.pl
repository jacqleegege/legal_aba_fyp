% Text
% Alice has paid $45252 to Bob for work done in the year 2017. In 2017, Alice has also paid $9832 into a retirement fund for Bob, and $5322 into life insurance for Bob.

% Question
% Section 3306(b)(2)(C) applies to the payment Alice made to the life insurance fund for the year 2017. Entailment

% Facts
person(alice).
person(bob).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).


finance(45252).
finance(9832).
finance(5322).

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2017-01-01").
end_(alice_employer,"2017-12-31").
payment_(alice_pays_bob).
agent_(alice_pays_bob,alice).
patient_(alice_pays_bob,bob).
start_(alice_pays_bob,"2017-01-01").
end_(alice_pays_bob,"2017-12-31").
purpose_(alice_pays_bob,alice_employer).
amount_(alice_pays_bob,45252).
payment_(alice_pays_retirement).
agent_(alice_pays_retirement,alice).
patient_(alice_pays_retirement,retirement_fund).
plan_(retirement_fund).
purpose_(retirement_fund,"make provisions for employees in case of retirement").
beneficiary_(retirement_fund,bob).
start_(alice_pays_retirement,"2017-01-01").
end_(alice_pays_retirement,"2017-12-31").
amount_(alice_pays_retirement,9832).
payment_(alice_pays_insurance).
agent_(alice_pays_insurance,alice).
patient_(alice_pays_insurance,life_insurance_fund).
plan_(life_insurance_fund).
purpose_(life_insurance_fund,"make provisions for employees in case of death").
beneficiary_(life_insurance_fund,bob).
start_(alice_pays_insurance,"2017-01-01").
end_(alice_pays_insurance,"2017-12-31").
amount_(alice_pays_insurance,5322).

% Test
:- s3306_b_2_C(life_insurance_fund).
:- halt.
