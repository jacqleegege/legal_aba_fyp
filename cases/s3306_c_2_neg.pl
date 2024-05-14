% Text
% Alice has paid wages of $3200 to Bob for domestic service done in her home from Feb 1st, 2017 to Sep 2nd, 2017, in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(2) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_2_neg).
person(bob_s3306_c_2_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).
location_name("private home_s3306_c_2_neg").

finance(3200).

service_(alice_employer_s3306_c_2_neg).
patient_(alice_employer_s3306_c_2_neg,alice_s3306_c_2_neg).
agent_(alice_employer_s3306_c_2_neg,bob_s3306_c_2_neg).
start_(alice_employer_s3306_c_2_neg,"2017-02-01").
end_(alice_employer_s3306_c_2_neg,"2017-09-02").
location_(alice_employer_s3306_c_2_neg,baltimore).
location_(alice_employer_s3306_c_2_neg,maryland).
location_(alice_employer_s3306_c_2_neg,usa).
purpose_(alice_employer_s3306_c_2_neg,"domestic service").
location_(alice_employer_s3306_c_2_neg,"private home_s3306_c_2_neg").
payment_(alice_pays_s3306_c_2_neg).
agent_(alice_pays_s3306_c_2_neg,alice_s3306_c_2_neg).
patient_(alice_pays_s3306_c_2_neg,bob_s3306_c_2_neg).
start_(alice_pays_s3306_c_2_neg,"2017-09-02").
purpose_(alice_pays_s3306_c_2_neg,alice_employer_s3306_c_2_neg).
amount_(alice_pays_s3306_c_2_neg,3200).
s3306_b(3200,alice_pays_s3306_c_2_neg,alice_employer_s3306_c_2_neg,alice_s3306_c_2_neg,bob_s3306_c_2_neg,alice_s3306_c_2_neg,bob_s3306_c_2_neg,"cash").

% Test
:- \+ s3306_c_2(alice_employer_s3306_c_2_neg,baltimore,2017).
:- \+ s3306_c_2(alice_employer_s3306_c_2_neg,maryland,2017).
:- \+ s3306_c_2(alice_employer_s3306_c_2_neg,usa,2017).
:- \+ s3306_c_2(alice_employer_s3306_c_2_neg,"private home_s3306_c_2_neg",2017).
:- halt.
