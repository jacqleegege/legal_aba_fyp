% Text
% Alice has paid $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Stanley, Wisconsin, USA. Alice is an american citizen, and Bob is a Mexican citizen who was admitted to the USA to perform agricultural labor pursuant to sections 214(c) and 101(a)(15)(H) of the Immigration and Nationality Act.

% Question
% Section 3306(c)(1)(B) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_1_B_neg).
person(bob_s3306_c_1_B_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name("stanley, wisconsin, usa").
country_name("usa").

finance(3200).

service_(alice_employer_s3306_c_1_B_neg).
patient_(alice_employer_s3306_c_1_B_neg,alice_s3306_c_1_B_neg).
agent_(alice_employer_s3306_c_1_B_neg,bob_s3306_c_1_B_neg).
start_(alice_employer_s3306_c_1_B_neg,"2017-02-01").
end_(alice_employer_s3306_c_1_B_neg,"2017-09-02").
location_(alice_employer_s3306_c_1_B_neg,"stanley, wisconsin, usa").
country_("stanley, wisconsin, usa","usa").
purpose_(alice_employer_s3306_c_1_B_neg,"agricultural labor").
payment_(alice_pays_s3306_c_1_B_neg).
agent_(alice_pays_s3306_c_1_B_neg,alice_s3306_c_1_B_neg).
patient_(alice_pays_s3306_c_1_B_neg,bob_s3306_c_1_B_neg).
start_(alice_pays_s3306_c_1_B_neg,"2017-09-02").
purpose_(alice_pays_s3306_c_1_B_neg,alice_employer_s3306_c_1_B_neg).
amount_(alice_pays_s3306_c_1_B_neg,3200).
citizenship_(alice_is_american_s3306_c_1_B_neg).
agent_(alice_is_american_s3306_c_1_B_neg,alice_s3306_c_1_B_neg).
patient_(alice_is_american_s3306_c_1_B_neg,"usa").
citizenship_(bob_is_mexican_s3306_c_1_B_neg).
agent_(bob_is_mexican_s3306_c_1_B_neg,bob_s3306_c_1_B_neg).
patient_(bob_is_mexican_s3306_c_1_B_neg,mexico).
migration_(bob_migrates_to_usa_s3306_c_1_B_neg).
destination_(bob_migrates_to_usa_s3306_c_1_B_neg,"usa").
agent_(bob_migrates_to_usa_s3306_c_1_B_neg,bob_s3306_c_1_B_neg).
purpose_(bob_migrates_to_usa_s3306_c_1_B_neg,"agricultural labor").

% Test
:- \+ s3306_c_1_B(alice_employer_s3306_c_1_B_neg,bob_s3306_c_1_B_neg).
:- halt.
