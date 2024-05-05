% Text
% Alice was paid $73200 in 2017 as an employee of Bertha's Mussels in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(7) applies to Alice's employment situation in 2017. Contradiction

% Facts
person(alice_s3306_c_7_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).

finance(73200).

service_(alice_employed_s3306_c_7_neg).
patient_(alice_employed_s3306_c_7_neg,"bertha's mussels").
agent_(alice_employed_s3306_c_7_neg,alice_s3306_c_7_neg).
start_(alice_employed_s3306_c_7_neg,"2017-01-01").
end_(alice_employed_s3306_c_7_neg,"2017-12-31").
location_(alice_employed_s3306_c_7_neg,baltimore).
location_(alice_employed_s3306_c_7_neg,maryland).
location_(alice_employed_s3306_c_7_neg,usa).
payment_(alice_is_paid_s3306_c_7_neg).
agent_(alice_is_paid_s3306_c_7_neg,"bertha's mussels").
patient_(alice_is_paid_s3306_c_7_neg,alice_s3306_c_7_neg).
start_(alice_is_paid_s3306_c_7_neg,"2017-12-31").
purpose_(alice_is_paid_s3306_c_7_neg,alice_employed_s3306_c_7_neg).
amount_(alice_is_paid_s3306_c_7_neg,73200).

% Test
:- \+ s3306_c_7(alice_employed_s3306_c_7_neg,alice_s3306_c_7_neg).
:- halt.
