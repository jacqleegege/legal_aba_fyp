% Text
% Alice was paid $73200 in 2017 as an employee of the Canadian Government.

% Question
% Section 3306(c)(11) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_11_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name("toronto").
location_name("ontario").
location_name("canada").

finance(73200).

service_(alice_employed_s3306_c_11_pos).
patient_(alice_employed_s3306_c_11_pos,"canadian government").
agent_(alice_employed_s3306_c_11_pos,alice_s3306_c_11_pos).
start_(alice_employed_s3306_c_11_pos,d2017_01_01).
end_(alice_employed_s3306_c_11_pos,d2017_12_31).
location_(alice_employed_s3306_c_11_pos,"toronto").
location_(alice_employed_s3306_c_11_pos,"ontario").
location_(alice_employed_s3306_c_11_pos,"canada").
payment_(alice_is_paid_s3306_c_11_pos).
agent_(alice_is_paid_s3306_c_11_pos,"canadian government").
patient_(alice_is_paid_s3306_c_11_pos,alice_s3306_c_11_pos).
start_(alice_is_paid_s3306_c_11_pos,d2017_12_31).
purpose_(alice_is_paid_s3306_c_11_pos,alice_employed_s3306_c_11_pos).
amount_(alice_is_paid_s3306_c_11_pos,73200).

% Test
:- s3306_c_11(alice_employed_s3306_c_11_pos,"canadian government").
:- halt.
