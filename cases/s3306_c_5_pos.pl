% Text
% Alice has paid $3200 to her father Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017, in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(5) applies to Alice employing Bob for the year 2017. Entailment

% Facts
person(alice_s3306_c_5_pos).
person(bob_s3306_c_5_pos).

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

service_(alice_employer_s3306_c_5_pos).
patient_(alice_employer_s3306_c_5_pos,alice_s3306_c_5_pos).
agent_(alice_employer_s3306_c_5_pos,bob_s3306_c_5_pos).
start_(alice_employer_s3306_c_5_pos,d2017_02_01).
end_(alice_employer_s3306_c_5_pos,d2017_09_02).
location_(alice_employer_s3306_c_5_pos,baltimore).
location_(alice_employer_s3306_c_5_pos,maryland).
location_(alice_employer_s3306_c_5_pos,usa).
payment_(alice_pays_s3306_c_5_pos).
agent_(alice_pays_s3306_c_5_pos,alice_s3306_c_5_pos).
patient_(alice_pays_s3306_c_5_pos,bob_s3306_c_5_pos).
start_(alice_pays_s3306_c_5_pos,d2017_09_02).
purpose_(alice_pays_s3306_c_5_pos,alice_employer_s3306_c_5_pos).
amount_(alice_pays_s3306_c_5_pos,3200).
father_(bob_father_of_alice_s3306_c_5_pos).
agent_(bob_father_of_alice_s3306_c_5_pos,bob_s3306_c_5_pos).
patient_(bob_father_of_alice_s3306_c_5_pos,alice_s3306_c_5_pos).

% Test
:- s3306_c_5(alice_employer_s3306_c_5_pos,alice_s3306_c_5_pos,bob_s3306_c_5_pos,d2017_02_01).
:- halt.
