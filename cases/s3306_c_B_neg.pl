% Text
% Alice has paid $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017, in Caracas, Venezuela. Alice is a citizen of Venezuela, and Bob is an American citizen.

% Question
% Section 3306(c)(B) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_B_neg).
person(bob_s3306_c_B_neg).

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
finance(3200).

service_(alice_employer_s3306_c_B_neg).
patient_(alice_employer_s3306_c_B_neg,alice_s3306_c_B_neg).
agent_(alice_employer_s3306_c_B_neg,bob_s3306_c_B_neg).
start_(alice_employer_s3306_c_B_neg,"2017-02-01").
end_(alice_employer_s3306_c_B_neg,"2017-09-02").
location_(alice_employer_s3306_c_B_neg,"caracas, venezuela").
country_("caracas, venezuela","venezuela").
payment_(alice_pays_s3306_c_B_neg).
agent_(alice_pays_s3306_c_B_neg,alice_s3306_c_B_neg).
patient_(alice_pays_s3306_c_B_neg,bob_s3306_c_B_neg).
start_(alice_pays_s3306_c_B_neg,"2017-09-02").
purpose_(alice_pays_s3306_c_B_neg,alice_employer_s3306_c_B_neg).
amount_(alice_pays_s3306_c_B_neg,3200).
citizenship_(alice_is_venezuelan_s3306_c_B_neg).
agent_(alice_is_venezuelan_s3306_c_B_neg,alice_s3306_c_B_neg).
patient_(alice_is_venezuelan_s3306_c_B_neg,"venezuela").
citizenship_(bob_is_american_s3306_c_B_neg).
agent_(bob_is_american_s3306_c_B_neg,bob_s3306_c_B_neg).
patient_(bob_is_american_s3306_c_B_neg,"usa").

% Test
:- \+ s3306_c_B(alice_employer_s3306_c_B_neg,alice_s3306_c_B_neg,bob_s3306_c_B_neg,"caracas, venezuela").
:- halt.
