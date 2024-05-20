% Text
% Alice has paid $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Caracas, Venezuela. Alice is an American employer.

% Question
% Section 3306(c)(1) applies to Alice employing Bob for the year 2017. Entailment

% Facts
person(alice_s3306_c_1_pos).
person(bob_s3306_c_1_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name("caracas, venezuela").
country_name("venezuela").

finance(3200).

service_(alice_employer_s3306_c_1_pos).
patient_(alice_employer_s3306_c_1_pos,alice_s3306_c_1_pos).
agent_(alice_employer_s3306_c_1_pos,bob_s3306_c_1_pos).
start_(alice_employer_s3306_c_1_pos,d2017_02_01).
end_(alice_employer_s3306_c_1_pos,d2017_09_02).
location_(alice_employer_s3306_c_1_pos,"caracas, venezuela").
country_("caracas, venezuela", "venezuela").
purpose_(alice_employer_s3306_c_1_pos,"agricultural labor").
payment_(alice_pays_s3306_c_1_pos).
agent_(alice_pays_s3306_c_1_pos,alice_s3306_c_1_pos).
patient_(alice_pays_s3306_c_1_pos,bob_s3306_c_1_pos).
start_(alice_pays_s3306_c_1_pos,d2017_09_02).
purpose_(alice_pays_s3306_c_1_pos,alice_employer_s3306_c_1_pos).
amount_(alice_pays_s3306_c_1_pos,3200).
american_employer_(alice_is_american_employer_s3306_c_1_pos).
agent_(alice_is_american_employer_s3306_c_1_pos,alice_s3306_c_1_pos).
citizenship_(bob_is_american_s3306_c_1_pos).
agent_(bob_is_american_s3306_c_1_pos,bob_s3306_c_1_pos).
patient_(bob_is_american_s3306_c_1_pos,"usa").

% Test
:- s3306_c_1(alice_employer_s3306_c_1_pos,2017).
:- halt.
