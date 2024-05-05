% Text
% Alice was paid $3200 in 2017 for services performed for Johns Hopkins School of Nursing. Alice was enrolled at Johns Hopkins School of Nursing and attending classes from August 29, 2015 to May 30th, 2019.

% Question
% Section 3306(c)(13) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_13_pos).

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
location_name("johns hopkins school of nursing").

finance(3200).

service_(alice_employed_s3306_c_13_pos).
patient_(alice_employed_s3306_c_13_pos,"johns hopkins school of nursing").
agent_(alice_employed_s3306_c_13_pos,alice_s3306_c_13_pos).
start_(alice_employed_s3306_c_13_pos,"2017-01-01").
end_(alice_employed_s3306_c_13_pos,"2017-12-31").
location_(alice_employed_s3306_c_13_pos,baltimore).
location_(alice_employed_s3306_c_13_pos,maryland).
location_(alice_employed_s3306_c_13_pos,usa).
payment_(alice_is_paid_s3306_c_13_pos).
agent_(alice_is_paid_s3306_c_13_pos,"johns hopkins school of nursing").
patient_(alice_is_paid_s3306_c_13_pos,alice_s3306_c_13_pos).
start_(alice_is_paid_s3306_c_13_pos,"2017-12-31").
purpose_(alice_is_paid_s3306_c_13_pos,alice_employed_s3306_c_13_pos).
amount_(alice_is_paid_s3306_c_13_pos,3200).
nurses_training_school_(hopkins_is_a_nursing_school_s3306_c_13_pos).
agent_(hopkins_is_a_nursing_school_s3306_c_13_pos,"johns hopkins school of nursing").
enrollment_(alice_goes_to_hopkins_s3306_c_13_pos).
agent_(alice_goes_to_hopkins_s3306_c_13_pos,alice_s3306_c_13_pos).
patient_(alice_goes_to_hopkins_s3306_c_13_pos,"johns hopkins school of nursing").
start_(alice_goes_to_hopkins_s3306_c_13_pos,"2015-08-29").
end_(alice_goes_to_hopkins_s3306_c_13_pos,"2019-05-30").
attending_classes_(alice_goes_to_class_s3306_c_13_pos).
agent_(alice_goes_to_class_s3306_c_13_pos,alice_s3306_c_13_pos).
location_(alice_goes_to_class_s3306_c_13_pos,"johns hopkins school of nursing").
start_(alice_goes_to_class_s3306_c_13_pos,"2015-08-29").
end_(alice_goes_to_class_s3306_c_13_pos,"2019-05-30").

% Test
:- s3306_c_13(alice_employed_s3306_c_13_pos,"johns hopkins school of nursing",alice_s3306_c_13_pos,"2017-01-01").
:- halt.
