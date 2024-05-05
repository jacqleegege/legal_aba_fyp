% Text
% Alice has paid wages of $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4520 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(2)(A) make Alice an employer for the year 2017. Contradiction

% Facts
person(alice_s3306_a_2_A_neg).
person(bob_s3306_a_2_A_neg).

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

% year(2019).
% date("2019-01-01").
% date_split("2019-01-01", 2019, 1, 1).
% date("2019-09-02").
% date_split("2019-09-02", 2019, 9, 2).
% date("2019-12-31").
% date_split("2019-12-31", 2019, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-09-02").
date_split("2018-09-02", 2018, 9, 2).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

finance(3200).
finance(4520).

service_(alice_employer_s3306_a_2_A_neg).
patient_(alice_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
agent_(alice_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
start_(alice_employer_s3306_a_2_A_neg,"2017-02-01").
end_(alice_employer_s3306_a_2_A_neg,"2017-09-02").
purpose_(alice_employer_s3306_a_2_A_neg,"agricultural labor").
payment_(alice_pays_s3306_a_2_A_neg).
agent_(alice_pays_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
patient_(alice_pays_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
start_(alice_pays_s3306_a_2_A_neg,"2017-09-02").
purpose_(alice_pays_s3306_a_2_A_neg,alice_employer_s3306_a_2_A_neg).
amount_(alice_pays_s3306_a_2_A_neg,3200).
s3306_b(3200,alice_pays_s3306_a_2_A_neg,alice_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,"cash").
service_(bob_employer_s3306_a_2_A_neg).
patient_(bob_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
agent_(bob_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
start_(bob_employer_s3306_a_2_A_neg,"2017-04-01").
end_(bob_employer_s3306_a_2_A_neg,"2018-09-02").
payment_(bob_pays_s3306_a_2_A_neg).
agent_(bob_pays_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
patient_(bob_pays_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
start_(bob_pays_s3306_a_2_A_neg,"2018-09-02").
purpose_(bob_pays_s3306_a_2_A_neg,bob_employer_s3306_a_2_A_neg).
amount_(bob_pays_s3306_a_2_A_neg,4520).
s3306_b(4520,bob_pays_s3306_a_2_A_neg,bob_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,"cash").

% Test
:- \+ s3306_a_2_A(alice_s3306_a_2_A_neg,2017,3200,alice_employer_s3306_a_2_A_neg).
:- halt.
