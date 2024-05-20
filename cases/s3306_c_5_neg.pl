% Text
% Alice has paid $3200 to her brother Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017, in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(5) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_5_neg).
person(bob_s3306_c_5_neg).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).

finance(3200).

service_(alice_employer_s3306_c_5_neg).
patient_(alice_employer_s3306_c_5_neg,alice_s3306_c_5_neg).
agent_(alice_employer_s3306_c_5_neg,bob_s3306_c_5_neg).
start_(alice_employer_s3306_c_5_neg,d2017_02_01).
end_(alice_employer_s3306_c_5_neg,d2017_09_02).
location_(alice_employer_s3306_c_5_neg,baltimore).
location_(alice_employer_s3306_c_5_neg,maryland).
location_(alice_employer_s3306_c_5_neg,usa).
payment_(alice_pays_s3306_c_5_neg).
agent_(alice_pays_s3306_c_5_neg,alice_s3306_c_5_neg).
patient_(alice_pays_s3306_c_5_neg,bob_s3306_c_5_neg).
start_(alice_pays_s3306_c_5_neg,d2017_09_02).
purpose_(alice_pays_s3306_c_5_neg,alice_employer_s3306_c_5_neg).
amount_(alice_pays_s3306_c_5_neg,3200).
sibling_(bob_brother_of_alice_s3306_c_5_neg).
agent_(bob_brother_of_alice_s3306_c_5_neg,bob_s3306_c_5_neg).
patient_(bob_brother_of_alice_s3306_c_5_neg,alice_s3306_c_5_neg).

% Test
:- \+ s3306_c_5(alice_employer_s3306_c_5_neg,alice_s3306_c_5_neg,bob_s3306_c_5_neg,d2017_02_01).
:- halt.
