% Text
% Alice has paid $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017, in Toronto, Ontario, Canada.

% Question
% Section 3306(c)(A) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice_s3306_c_A_neg).
person(bob_s3306_c_A_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name("toronto, ontario, canada").
country_name("canada").
finance(3200).

service_(alice_employer_s3306_c_A_neg).
patient_(alice_employer_s3306_c_A_neg,alice_s3306_c_A_neg).
agent_(alice_employer_s3306_c_A_neg,bob_s3306_c_A_neg).
start_(alice_employer_s3306_c_A_neg,"2017-02-01").
end_(alice_employer_s3306_c_A_neg,"2017-09-02").
location_(alice_employer_s3306_c_A_neg,"toronto, ontario, canada").
country_("toronto, ontario, canada","canada").
payment_(alice_pays_s3306_c_A_neg).
agent_(alice_pays_s3306_c_A_neg,alice_s3306_c_A_neg).
patient_(alice_pays_s3306_c_A_neg,bob_s3306_c_A_neg).
start_(alice_pays_s3306_c_A_neg,"2017-09-02").
purpose_(alice_pays_s3306_c_A_neg,alice_employer_s3306_c_A_neg).
amount_(alice_pays_s3306_c_A_neg,3200).

% Test
:- \+ s3306_c_A(alice_employer_s3306_c_A_neg,alice_s3306_c_A_neg,bob_s3306_c_A_neg).
:- halt.
