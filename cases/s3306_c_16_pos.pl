% Text
% Alice was paid $73200 in 2017 as an employee of the International Monetary Fund in Washington, D.C., USA.

% Question
% Section 3306(c)(16) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_16_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name(washington_dc).
location_name(usa).

finance(73200).

international_organization_(imf_is_an_international_organization_s3306_c_16_pos).
agent_(imf_is_an_international_organization_s3306_c_16_pos,international_monetary_fund).
service_(alice_employed_s3306_c_16_pos).
patient_(alice_employed_s3306_c_16_pos,international_monetary_fund).
agent_(alice_employed_s3306_c_16_pos,alice_s3306_c_16_pos).
start_(alice_employed_s3306_c_16_pos,d2017_01_01).
end_(alice_employed_s3306_c_16_pos,d2017_12_31).
location_(alice_employed_s3306_c_16_pos,washington_dc).
location_(alice_employed_s3306_c_16_pos,usa).
payment_(alice_is_paid_s3306_c_16_pos).
agent_(alice_is_paid_s3306_c_16_pos,international_monetary_fund).
patient_(alice_is_paid_s3306_c_16_pos,alice_s3306_c_16_pos).
start_(alice_is_paid_s3306_c_16_pos,d2017_12_31).
purpose_(alice_is_paid_s3306_c_16_pos,alice_employed_s3306_c_16_pos).
amount_(alice_is_paid_s3306_c_16_pos,73200).

% Test
:- s3306_c_16(alice_employed_s3306_c_16_pos,international_monetary_fund).
:- halt.
