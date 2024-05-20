% Text
% Alice has paid $2300 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Caracas, Venezuela. Alice and Bob are both American citizens.

% Question
% Section 3306(c)(1)(A)(i) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_1_A_i_neg).
person(bob_s3306_c_1_A_i_neg).

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

finance(2300).

service_(alice_employer_s3306_c_1_A_i_neg).
patient_(alice_employer_s3306_c_1_A_i_neg,alice_s3306_c_1_A_i_neg).
agent_(alice_employer_s3306_c_1_A_i_neg,bob_s3306_c_1_A_i_neg).
start_(alice_employer_s3306_c_1_A_i_neg,d2017_02_01).
end_(alice_employer_s3306_c_1_A_i_neg,d2017_09_02).
location_(alice_employer_s3306_c_1_A_i_neg,"caracas, venezuela").
country_("caracas, venezuela", "venezuela").
purpose_(alice_employer_s3306_c_1_A_i_neg,"agricultural labor").
payment_(alice_pays_s3306_c_1_A_i_neg).
agent_(alice_pays_s3306_c_1_A_i_neg,alice_s3306_c_1_A_i_neg).
patient_(alice_pays_s3306_c_1_A_i_neg,bob_s3306_c_1_A_i_neg).
start_(alice_pays_s3306_c_1_A_i_neg,d2017_09_02).
purpose_(alice_pays_s3306_c_1_A_i_neg,alice_employer_s3306_c_1_A_i_neg).
amount_(alice_pays_s3306_c_1_A_i_neg,2300).
citizenship_(alice_is_american_s3306_c_1_A_i_neg).
agent_(alice_is_american_s3306_c_1_A_i_neg,alice_s3306_c_1_A_i_neg).
patient_(alice_is_american_s3306_c_1_A_i_neg,"usa").
citizenship_(bob_is_american_s3306_c_1_A_i_neg).
agent_(bob_is_american_s3306_c_1_A_i_neg,bob_s3306_c_1_A_i_neg).
patient_(bob_is_american_s3306_c_1_A_i_neg,"usa").

% Test
:- \+ s3306_c_1_A_i(alice_s3306_c_1_A_i_neg,2300,bob_s3306_c_1_A_i_neg,alice_employer_s3306_c_1_A_i_neg,2017).
:- halt.
