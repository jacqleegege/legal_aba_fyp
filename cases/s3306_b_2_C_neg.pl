% Text
% Alice has paid $45252 to Bob for work done in the year 2017. In 2017, Alice has also paid $9832 into a retirement fund for Bob, and $5322 into life insurance for Charlie, who is Alice's father and has retired in 2016.

% Question
% Section 3306(b)(2)(C) applies to the payment Alice made to the retirement fund for the year 2017. Contradiction

% Facts
person(alice_s3306_b_2_C_neg).
person(charlie_s3306_b_2_C_neg).
person(bob_s3306_b_2_C_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

finance(45252).
finance(9832).
finance(5322).

service_(alice_employer_s3306_b_2_C_neg).
patient_(alice_employer_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
agent_(alice_employer_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_employer_s3306_b_2_C_neg,"2017-01-01").
end_(alice_employer_s3306_b_2_C_neg,"2017-12-31").
payment_(alice_pays_bob_s3306_b_2_C_neg).
agent_(alice_pays_bob_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_bob_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_pays_bob_s3306_b_2_C_neg,"2017-01-01").
end_(alice_pays_bob_s3306_b_2_C_neg,"2017-12-31").
purpose_(alice_pays_bob_s3306_b_2_C_neg,alice_employer_s3306_b_2_C_neg).
amount_(alice_pays_bob_s3306_b_2_C_neg,45252).
payment_(alice_pays_retirement_s3306_b_2_C_neg).
agent_(alice_pays_retirement_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_retirement_s3306_b_2_C_neg,retirement_fund_s3306_b_2_C_neg).
purpose_(alice_pays_retirement_s3306_b_2_C_neg,"make provisions for employees in case of retirement").
beneficiary_(alice_pays_retirement_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_pays_retirement_s3306_b_2_C_neg,"2017-01-01").
end_(alice_pays_retirement_s3306_b_2_C_neg,"2017-12-31").
amount_(alice_pays_retirement_s3306_b_2_C_neg,9832).
payment_(alice_pays_insurance_s3306_b_2_C_neg).
agent_(alice_pays_insurance_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_insurance_s3306_b_2_C_neg,life_insurance_fund_s3306_b_2_C_neg).
purpose_(alice_pays_insurance_s3306_b_2_C_neg,"make provisions in case of death").
beneficiary_(alice_pays_insurance_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
start_(alice_pays_insurance_s3306_b_2_C_neg,"2017-01-01").
end_(alice_pays_insurance_s3306_b_2_C_neg,"2017-12-31").
amount_(alice_pays_insurance_s3306_b_2_C_neg,5322).
father_(alice_and_charlie_s3306_b_2_C_neg).
agent_(alice_and_charlie_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
patient_(alice_and_charlie_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
retirement_(charlie_retires_s3306_b_2_C_neg).
agent_(charlie_retires_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
start_(charlie_retires_s3306_b_2_C_neg,"2016-01-01").

% Test
:- \+ s3306_b_2_C(retirement_fund_s3306_b_2_C_neg).
:- halt.
