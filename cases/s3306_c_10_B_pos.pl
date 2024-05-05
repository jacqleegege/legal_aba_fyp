% Text
% Alice was paid $200 in March 2017 for services performed at Johns Hopkins Hospital in March 2017. Alice was a patient at Johns Hopkins Hospital from March 15th, 2017 to April 2nd, 2017.

% Question
% Section 3306(c)(10)(B) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_10_B_pos).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).
date("2017-03-31").
date_split("2017-03-31", 2017, 3, 31).
date("2017-03-15").
date_split("2017-03-15", 2017, 3, 15).
date("2017-04-02").
date_split("2017-04-02", 2017, 4, 2).

location_name("baltimore").
location_name("maryland").
location_name("usa").

finance(200).

hospital_(hopkins_is_a_hospital_s3306_c_10_B_pos).
agent_(hopkins_is_a_hospital_s3306_c_10_B_pos,"johns hopkins hospital_s3306_c_10_B_pos").
service_(alice_employed_s3306_c_10_B_pos).
patient_(alice_employed_s3306_c_10_B_pos,"johns hopkins hospital_s3306_c_10_B_pos").
agent_(alice_employed_s3306_c_10_B_pos,alice_s3306_c_10_B_pos).
start_(alice_employed_s3306_c_10_B_pos,"2017-03-15").
end_(alice_employed_s3306_c_10_B_pos,"2017-03-31").
location_(alice_employed_s3306_c_10_B_pos,"baltimore").
location_(alice_employed_s3306_c_10_B_pos,"maryland").
location_(alice_employed_s3306_c_10_B_pos,"usa").
payment_(alice_is_paid_s3306_c_10_B_pos).
agent_(alice_is_paid_s3306_c_10_B_pos,"johns hopkins hospital_s3306_c_10_B_pos").
patient_(alice_is_paid_s3306_c_10_B_pos,alice_s3306_c_10_B_pos).
start_(alice_is_paid_s3306_c_10_B_pos,"2017-03-31").
purpose_(alice_is_paid_s3306_c_10_B_pos,alice_employed_s3306_c_10_B_pos).
amount_(alice_is_paid_s3306_c_10_B_pos,200).
medical_patient_(alice_goes_to_hopkins_s3306_c_10_B_pos).
agent_(alice_goes_to_hopkins_s3306_c_10_B_pos,alice_s3306_c_10_B_pos).
patient_(alice_goes_to_hopkins_s3306_c_10_B_pos,"johns hopkins hospital_s3306_c_10_B_pos").
start_(alice_goes_to_hopkins_s3306_c_10_B_pos,"2017-03-15").
end_(alice_goes_to_hopkins_s3306_c_10_B_pos,"2017-04-02").

% Test
:- s3306_c_10_B(alice_employed_s3306_c_10_B_pos,"johns hopkins hospital_s3306_c_10_B_pos",alice_s3306_c_10_B_pos,"2017-03-15").
:- halt.
