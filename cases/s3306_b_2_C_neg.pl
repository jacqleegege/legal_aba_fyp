% Text
% Alice has paid $45252 to Bob for work done in the year 2017. In 2017, Alice has also paid $9832 into a retirement fund for Bob, and $5322 into life insurance for Charlie, who is Alice's father and has retired in 2016.

% Question
% Section 3306(b)(2)(C) applies to the payment Alice made to the retirement fund for the year 2017. Contradiction

% Facts
person(alice_s3306_b_2_C_neg).
person(charlie_s3306_b_2_C_neg).
person(bob_s3306_b_2_C_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

finance(45252).
finance(9832).
finance(5322).

service_(alice_employer_s3306_b_2_C_neg).
patient_(alice_employer_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
agent_(alice_employer_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_employer_s3306_b_2_C_neg,d2017_01_01).
end_(alice_employer_s3306_b_2_C_neg,d2017_12_31).
payment_(alice_pays_bob_s3306_b_2_C_neg).
agent_(alice_pays_bob_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_bob_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_pays_bob_s3306_b_2_C_neg,d2017_01_01).
end_(alice_pays_bob_s3306_b_2_C_neg,d2017_12_31).
purpose_(alice_pays_bob_s3306_b_2_C_neg,alice_employer_s3306_b_2_C_neg).
amount_(alice_pays_bob_s3306_b_2_C_neg,45252).
payment_(alice_pays_retirement_s3306_b_2_C_neg).
agent_(alice_pays_retirement_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_retirement_s3306_b_2_C_neg,retirement_fund_s3306_b_2_C_neg).
purpose_(alice_pays_retirement_s3306_b_2_C_neg,make_provisions_for_employees_in_case_of_retirement).
beneficiary_(alice_pays_retirement_s3306_b_2_C_neg,bob_s3306_b_2_C_neg).
start_(alice_pays_retirement_s3306_b_2_C_neg,d2017_01_01).
end_(alice_pays_retirement_s3306_b_2_C_neg,d2017_12_31).
amount_(alice_pays_retirement_s3306_b_2_C_neg,9832).
payment_(alice_pays_insurance_s3306_b_2_C_neg).
agent_(alice_pays_insurance_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
patient_(alice_pays_insurance_s3306_b_2_C_neg,life_insurance_fund_s3306_b_2_C_neg).
purpose_(alice_pays_insurance_s3306_b_2_C_neg,make_provisions_in_case_of_death).
beneficiary_(alice_pays_insurance_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
start_(alice_pays_insurance_s3306_b_2_C_neg,d2017_01_01).
end_(alice_pays_insurance_s3306_b_2_C_neg,d2017_12_31).
amount_(alice_pays_insurance_s3306_b_2_C_neg,5322).
father_(alice_and_charlie_s3306_b_2_C_neg).
agent_(alice_and_charlie_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
patient_(alice_and_charlie_s3306_b_2_C_neg,alice_s3306_b_2_C_neg).
retirement_(charlie_retires_s3306_b_2_C_neg).
agent_(charlie_retires_s3306_b_2_C_neg,charlie_s3306_b_2_C_neg).
start_(charlie_retires_s3306_b_2_C_neg,d2016_01_01).

% Test
:- \+ s3306_b_2_C(retirement_fund_s3306_b_2_C_neg).
:- halt.
