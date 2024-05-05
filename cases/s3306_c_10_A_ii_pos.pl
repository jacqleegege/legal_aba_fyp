% Text
% Alice's husband, Bob, was paid $3200 in 2017 for services performed for Johns Hopkins University. Alice was enrolled at Johns Hopkins University and attending classes from August 29, 2015 to May 30th, 2019.

% Question
% Section 3306(c)(10)(A)(ii) applies to Bob's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_10_A_ii_pos).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-08-29").
date_split("2015-08-29", 2015, 8, 29).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-05-30").
date_split("2019-05-30", 2019, 5, 30).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).
location_name("johns hopkins university").

finance(3200).

educational_institution_(hopkins_is_a_university_s3306_c_10_A_ii_pos).
agent_(hopkins_is_a_university_s3306_c_10_A_ii_pos,"johns hopkins university").
marriage_(bob_and_alice_s3306_c_10_A_ii_pos).
agent_(bob_and_alice_s3306_c_10_A_ii_pos,bob_s3306_c_10_A_ii_pos).
agent_(bob_and_alice_s3306_c_10_A_ii_pos,alice_s3306_c_10_A_ii_pos).
service_(bob_employed_s3306_c_10_A_ii_pos).
patient_(bob_employed_s3306_c_10_A_ii_pos,"johns hopkins university").
agent_(bob_employed_s3306_c_10_A_ii_pos,bob_s3306_c_10_A_ii_pos).
start_(bob_employed_s3306_c_10_A_ii_pos,"2017-01-01").
end_(bob_employed_s3306_c_10_A_ii_pos,"2017-12-31").
location_(bob_employed_s3306_c_10_A_ii_pos,baltimore).
location_(bob_employed_s3306_c_10_A_ii_pos,maryland).
location_(bob_employed_s3306_c_10_A_ii_pos,usa).
payment_(bob_is_paid_s3306_c_10_A_ii_pos).
agent_(bob_is_paid_s3306_c_10_A_ii_pos,"johns hopkins university").
patient_(bob_is_paid_s3306_c_10_A_ii_pos,bob_s3306_c_10_A_ii_pos).
start_(bob_is_paid_s3306_c_10_A_ii_pos,"2017-12-31").
purpose_(bob_is_paid_s3306_c_10_A_ii_pos,bob_employed_s3306_c_10_A_ii_pos).
amount_(bob_is_paid_s3306_c_10_A_ii_pos,3200).
enrollment_(alice_goes_to_hopkins_s3306_c_10_A_ii_pos).
agent_(alice_goes_to_hopkins_s3306_c_10_A_ii_pos,alice_s3306_c_10_A_ii_pos).
patient_(alice_goes_to_hopkins_s3306_c_10_A_ii_pos,"johns hopkins university").
start_(alice_goes_to_hopkins_s3306_c_10_A_ii_pos,"2015-08-29").
end_(alice_goes_to_hopkins_s3306_c_10_A_ii_pos,"2019-05-30").
attending_classes_(alice_goes_to_class_s3306_c_10_A_ii_pos).
agent_(alice_goes_to_class_s3306_c_10_A_ii_pos,alice_s3306_c_10_A_ii_pos).
location_(alice_goes_to_class_s3306_c_10_A_ii_pos,"johns hopkins university").
start_(alice_goes_to_class_s3306_c_10_A_ii_pos,"2015-08-29").
end_(alice_goes_to_class_s3306_c_10_A_ii_pos,"2019-05-30").

% Test
:- s3306_c_10_A_ii(alice_s3306_c_10_A_ii_pos,bob_s3306_c_10_A_ii_pos,"2017-01-01").
:- halt.
