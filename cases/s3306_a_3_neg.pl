% Text
% Alice has paid $3200 in cash to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid $4200 in cash to Alice for domestic service done from Apr 1st, 2017 to Sep 2nd, 2018 in his home.

% Question
% Section 3306(a)(3) applies to Alice for the year 2017. Contradiction

% Facts
person(alice_s3306_a_3_neg).
person(bob_s3306_a_3_neg).

year(2017).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-04-01").
date_split("2017-04-01", 2017, 4, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-09-02").
date_split("2018-09-02", 2018, 9, 2).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

finance(3200).
finance(4200).

medium("cash").
location_name("private home_s3306_a_3_neg").

service_(alice_employer_s3306_a_3_neg).
patient_(alice_employer_s3306_a_3_neg,alice_s3306_a_3_neg).
agent_(alice_employer_s3306_a_3_neg,bob_s3306_a_3_neg).
start_(alice_employer_s3306_a_3_neg,"2017-02-01").
end_(alice_employer_s3306_a_3_neg,"2017-09-02").
purpose_(alice_employer_s3306_a_3_neg,"agricultural labor").
payment_(alice_pays_s3306_a_3_neg).
agent_(alice_pays_s3306_a_3_neg,alice_s3306_a_3_neg).
patient_(alice_pays_s3306_a_3_neg,bob_s3306_a_3_neg).
start_(alice_pays_s3306_a_3_neg,"2017-09-02").
purpose_(alice_pays_s3306_a_3_neg,alice_employer_s3306_a_3_neg).
amount_(alice_pays_s3306_a_3_neg,3200).
means_(alice_pays_s3306_a_3_neg,"cash").
s3306_b(3200,alice_pays_s3306_a_3_neg,alice_employer_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,"cash").
service_(bob_employer_s3306_a_3_neg).
patient_(bob_employer_s3306_a_3_neg,bob_s3306_a_3_neg).
agent_(bob_employer_s3306_a_3_neg,alice_s3306_a_3_neg).
start_(bob_employer_s3306_a_3_neg,"2017-04-01").
end_(bob_employer_s3306_a_3_neg,"2018-09-02").
purpose_(bob_employer_s3306_a_3_neg, "domestic service").
location_(bob_employer_s3306_a_3_neg, "private home_s3306_a_3_neg").
payment_(bob_pays_s3306_a_3_neg).
agent_(bob_pays_s3306_a_3_neg,bob_s3306_a_3_neg).
patient_(bob_pays_s3306_a_3_neg,alice_s3306_a_3_neg).
start_(bob_pays_s3306_a_3_neg,"2018-09-02").
purpose_(bob_pays_s3306_a_3_neg,bob_employer_s3306_a_3_neg).
amount_(bob_pays_s3306_a_3_neg,4200).
means_(bob_pays_s3306_a_3_neg,"cash").
s3306_b(4200,bob_pays_s3306_a_3_neg,bob_employer_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,"cash").

% Test
:- \+ s3306_a_3(alice_s3306_a_3_neg,3200,2017).
:- halt.
