% Text
% Alice was paid $73200 in 2017 as an employee of Nando's Chicken in Arlington, Virginia, USA.

% Question
% Section 3306(c)(6) applies to Alice's employment situation in 2017. Contradiction

% Facts
person(alice_s3306_c_6_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name(arlington).
location_name(virginia).
location_name(usa).

finance(73200).

service_(alice_employed_s3306_c_6_neg).
patient_(alice_employed_s3306_c_6_neg,nandos_chicken).
agent_(alice_employed_s3306_c_6_neg,alice_s3306_c_6_neg).
start_(alice_employed_s3306_c_6_neg,d2017_01_01).
end_(alice_employed_s3306_c_6_neg,d2017_12_31).
location_(alice_employed_s3306_c_6_neg,arlington).
location_(alice_employed_s3306_c_6_neg,virginia).
location_(alice_employed_s3306_c_6_neg,usa).
payment_(alice_is_paid_s3306_c_6_neg).
agent_(alice_is_paid_s3306_c_6_neg,nandos_chicken).
patient_(alice_is_paid_s3306_c_6_neg,alice_s3306_c_6_neg).
start_(alice_is_paid_s3306_c_6_neg,d2017_12_31).
purpose_(alice_is_paid_s3306_c_6_neg,alice_employed_s3306_c_6_neg).
amount_(alice_is_paid_s3306_c_6_neg,73200).

% Test
:- \+ s3306_c_6(alice_employed_s3306_c_6_neg).
:- halt.
