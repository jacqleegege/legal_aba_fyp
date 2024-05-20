% Text
% Alice has paid $45252 to Bob for work done in the year 2017. In 2017, Alice has also paid $9832 into a retirement fund for Bob, and $5322 into life insurance for Bob.

% Question
% Section 3306(b)(2)(C) applies to the payment Alice made to the life insurance fund for the year 2017. Entailment

% Facts
person(alice_s3306_b_2_C_pos).
person(bob_s3306_b_2_C_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).


finance(45252).
finance(9832).
finance(5322).

service_(alice_employer_s3306_b_2_C_pos).
patient_(alice_employer_s3306_b_2_C_pos,alice_s3306_b_2_C_pos).
agent_(alice_employer_s3306_b_2_C_pos,bob_s3306_b_2_C_pos).
start_(alice_employer_s3306_b_2_C_pos,d2017_01_01).
end_(alice_employer_s3306_b_2_C_pos,d2017_12_31).
payment_(alice_pays_bob_s3306_b_2_C_pos).
agent_(alice_pays_bob_s3306_b_2_C_pos,alice_s3306_b_2_C_pos).
patient_(alice_pays_bob_s3306_b_2_C_pos,bob_s3306_b_2_C_pos).
start_(alice_pays_bob_s3306_b_2_C_pos,d2017_01_01).
end_(alice_pays_bob_s3306_b_2_C_pos,d2017_12_31).
purpose_(alice_pays_bob_s3306_b_2_C_pos,alice_employer_s3306_b_2_C_pos).
amount_(alice_pays_bob_s3306_b_2_C_pos,45252).
payment_(alice_pays_retirement_s3306_b_2_C_pos).
agent_(alice_pays_retirement_s3306_b_2_C_pos,alice_s3306_b_2_C_pos).
patient_(alice_pays_retirement_s3306_b_2_C_pos,retirement_fund_s3306_b_2_C_pos).
plan_(retirement_fund_s3306_b_2_C_pos).
purpose_(retirement_fund_s3306_b_2_C_pos,"make provisions for employees in case of retirement").
beneficiary_(retirement_fund_s3306_b_2_C_pos,bob_s3306_b_2_C_pos).
start_(alice_pays_retirement_s3306_b_2_C_pos,d2017_01_01).
end_(alice_pays_retirement_s3306_b_2_C_pos,d2017_12_31).
amount_(alice_pays_retirement_s3306_b_2_C_pos,9832).
payment_(alice_pays_insurance_s3306_b_2_C_pos).
agent_(alice_pays_insurance_s3306_b_2_C_pos,alice_s3306_b_2_C_pos).
patient_(alice_pays_insurance_s3306_b_2_C_pos,life_insurance_fund_s3306_b_2_C_pos).
plan_(life_insurance_fund_s3306_b_2_C_pos).
purpose_(life_insurance_fund_s3306_b_2_C_pos,"make provisions for employees in case of death").
beneficiary_(life_insurance_fund_s3306_b_2_C_pos,bob_s3306_b_2_C_pos).
start_(alice_pays_insurance_s3306_b_2_C_pos,d2017_01_01).
end_(alice_pays_insurance_s3306_b_2_C_pos,d2017_12_31).
amount_(alice_pays_insurance_s3306_b_2_C_pos,5322).

% Test
:- s3306_b_2_C(life_insurance_fund_s3306_b_2_C_pos).
:- halt.
