% Text
% Alice has paid $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017, in Toronto, Ontario, Canada.

% Question
% Section 3306(c)(A) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_A_neg).
person(bob_s3306_c_A_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name(toronto__ontario__canada).
country_name(canada).
finance(3200).

service_(alice_employer_s3306_c_A_neg).
patient_(alice_employer_s3306_c_A_neg,alice_s3306_c_A_neg).
agent_(alice_employer_s3306_c_A_neg,bob_s3306_c_A_neg).
start_(alice_employer_s3306_c_A_neg,d2017_02_01).
end_(alice_employer_s3306_c_A_neg,d2017_09_02).
location_(alice_employer_s3306_c_A_neg,toronto__ontario__canada).
country_(toronto__ontario__canada,canada).
payment_(alice_pays_s3306_c_A_neg).
agent_(alice_pays_s3306_c_A_neg,alice_s3306_c_A_neg).
patient_(alice_pays_s3306_c_A_neg,bob_s3306_c_A_neg).
start_(alice_pays_s3306_c_A_neg,d2017_09_02).
purpose_(alice_pays_s3306_c_A_neg,alice_employer_s3306_c_A_neg).
amount_(alice_pays_s3306_c_A_neg,3200).

% Test
:- \+ s3306_c_A(alice_employer_s3306_c_A_neg,alice_s3306_c_A_neg,bob_s3306_c_A_neg).
:- halt.
