% Text
% Alice has paid $2300 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Caracas, Venezuela. Alice and Bob are both American citizens.

% Question
% Section 3306(c)(1)(A)(i) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_1_A_i_neg).
person(bob_s3306_c_1_A_i_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name("caracas, venezuela").
country_name("venezuela").

finance(2300).

service_(alice_employer_s3306_c_1_A_i_neg).
patient_(alice_employer_s3306_c_1_A_i_neg,alice_s3306_c_1_A_i_neg).
agent_(alice_employer_s3306_c_1_A_i_neg,bob_s3306_c_1_A_i_neg).
start_(alice_employer_s3306_c_1_A_i_neg,"2017-02-01").
end_(alice_employer_s3306_c_1_A_i_neg,"2017-09-02").
location_(alice_employer_s3306_c_1_A_i_neg,"caracas, venezuela").
country_("caracas, venezuela", "venezuela").
purpose_(alice_employer_s3306_c_1_A_i_neg,"agricultural labor").
payment_(alice_pays_s3306_c_1_A_i_neg).
agent_(alice_pays_s3306_c_1_A_i_neg,alice_s3306_c_1_A_i_neg).
patient_(alice_pays_s3306_c_1_A_i_neg,bob_s3306_c_1_A_i_neg).
start_(alice_pays_s3306_c_1_A_i_neg,"2017-09-02").
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
