% Text
% Alice was paid $3200 in 2017 for services performed for Johns Hopkins University. Alice was enrolled at Johns Hopkins University and attending classes from August 27, 2011 to May 29th, 2016.

% Question
% Section 3306(c)(10)(A)(i) applies to Alice's employment situation in 2017. Contradiction

% Facts
person(alice_s3306_c_10_A_i_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2011).
date(d2011_01_01).
date_split(d2011_01_01, 2011, 1, 1).
date(d2011_08_27).
date_split(d2011_08_27, 2011, 8, 27).
date(d2011_12_31).
date_split(d2011_12_31, 2011, 12, 31).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_05_29).
date_split(d2016_05_29, 2016, 5, 29).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).

finance(3200).

educational_institution_(hopkins_is_a_university_s3306_c_10_A_i_neg).
agent_(hopkins_is_a_university_s3306_c_10_A_i_neg,"johns hopkins university").
service_(alice_employed_s3306_c_10_A_i_neg).
patient_(alice_employed_s3306_c_10_A_i_neg,"johns hopkins university").
agent_(alice_employed_s3306_c_10_A_i_neg,alice_s3306_c_10_A_i_neg).
start_(alice_employed_s3306_c_10_A_i_neg,d2017_01_01).
end_(alice_employed_s3306_c_10_A_i_neg,d2017_12_31).
location_(alice_employed_s3306_c_10_A_i_neg,baltimore).
location_(alice_employed_s3306_c_10_A_i_neg,maryland).
location_(alice_employed_s3306_c_10_A_i_neg,usa).
payment_(alice_is_paid_s3306_c_10_A_i_neg).
agent_(alice_is_paid_s3306_c_10_A_i_neg,"johns hopkins university").
patient_(alice_is_paid_s3306_c_10_A_i_neg,alice_s3306_c_10_A_i_neg).
start_(alice_is_paid_s3306_c_10_A_i_neg,d2017_12_31).
purpose_(alice_is_paid_s3306_c_10_A_i_neg,alice_employed_s3306_c_10_A_i_neg).
amount_(alice_is_paid_s3306_c_10_A_i_neg,3200).
enrollment_(alice_goes_to_hopkins_s3306_c_10_A_i_neg).
agent_(alice_goes_to_hopkins_s3306_c_10_A_i_neg,alice_s3306_c_10_A_i_neg).
patient_(alice_goes_to_hopkins_s3306_c_10_A_i_neg,"johns hopkins university").
start_(alice_goes_to_hopkins_s3306_c_10_A_i_neg,d2011_08_27).
end_(alice_goes_to_hopkins_s3306_c_10_A_i_neg,d2016_05_29).
attending_classes_(alice_goes_to_class_s3306_c_10_A_i_neg).
agent_(alice_goes_to_class_s3306_c_10_A_i_neg,alice_s3306_c_10_A_i_neg).
location_(alice_goes_to_class_s3306_c_10_A_i_neg,"johns hopkins university").
start_(alice_goes_to_class_s3306_c_10_A_i_neg,d2011_08_27).
end_(alice_goes_to_class_s3306_c_10_A_i_neg,d2016_05_29).

% Test
:- \+ s3306_c_10_A_i(alice_s3306_c_10_A_i_neg,"johns hopkins university",d2017_01_01).
:- halt.
