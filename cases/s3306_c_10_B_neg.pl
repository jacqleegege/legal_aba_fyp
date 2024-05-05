% Text
% Alice was paid $200 in March 2017 for services performed at Johns Hopkins Hospital in March 2017. Alice was a patient at Johns Hopkins Hospital from January 12th, 2017 to February 20th, 2017.

% Question
% Section 3306(c)(10)(B) applies to Alice's employment situation in 2017. Contradiction

% Facts
person(alice_s3306_c_10_B_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).
date("2017-03-01").
date_split("2017-03-01", 2017, 3, 1).
date("2017-03-31").
date_split("2017-03-31", 2017, 3, 31).
date("2017-01-12").
date_split("2017-01-12", 2017, 1, 12).
date("2017-02-20").
date_split("2017-02-20", 2017, 2, 20).

location_name(baltimore).
location_name(maryland).
location_name(usa).

finance(200).

hospital_(hopkins_is_a_hospital_s3306_c_10_B_neg).
agent_(hopkins_is_a_hospital_s3306_c_10_B_neg,"johns hopkins hospital_s3306_c_10_B_neg").
service_(alice_employed_s3306_c_10_B_neg).
patient_(alice_employed_s3306_c_10_B_neg,"johns hopkins hospital_s3306_c_10_B_neg").
agent_(alice_employed_s3306_c_10_B_neg,alice_s3306_c_10_B_neg).
start_(alice_employed_s3306_c_10_B_neg,"2017-03-01").
end_(alice_employed_s3306_c_10_B_neg,"2017-03-31").
location_(alice_employed_s3306_c_10_B_neg,baltimore).
location_(alice_employed_s3306_c_10_B_neg,maryland).
location_(alice_employed_s3306_c_10_B_neg,usa).
payment_(alice_is_paid_s3306_c_10_B_neg).
agent_(alice_is_paid_s3306_c_10_B_neg,"johns hopkins hospital_s3306_c_10_B_neg").
patient_(alice_is_paid_s3306_c_10_B_neg,alice_s3306_c_10_B_neg).
start_(alice_is_paid_s3306_c_10_B_neg,"2017-03-31").
purpose_(alice_is_paid_s3306_c_10_B_neg,alice_employed_s3306_c_10_B_neg).
amount_(alice_is_paid_s3306_c_10_B_neg,200).
medical_patient_(alice_goes_to_hopkins_s3306_c_10_B_neg).
agent_(alice_goes_to_hopkins_s3306_c_10_B_neg,alice_s3306_c_10_B_neg).
patient_(alice_goes_to_hopkins_s3306_c_10_B_neg,"johns hopkins hospital_s3306_c_10_B_neg").
start_(alice_goes_to_hopkins_s3306_c_10_B_neg,"2017-01-12").
end_(alice_goes_to_hopkins_s3306_c_10_B_neg,"2017-02-20").

% Test
:- \+ s3306_c_10_B(alice_employed_s3306_c_10_B_neg,"johns hopkins hospital_s3306_c_10_B_neg",alice_s3306_c_10_B_neg,"2017-03-01").
:- halt.
