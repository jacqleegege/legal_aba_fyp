% Text
% Alice has paid wages of $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4520 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(2)(A) make Alice an employer for the year 2017. Contradiction

% Facts
person(alice_s3306_a_2_A_neg).
person(bob_s3306_a_2_A_neg).

year(2017).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_04_01).
date_split(d2017_04_01, 2017, 4, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

% year(2019).
% date(d2019_01_01).
% date_split(d2019_01_01, 2019, 1, 1).
% date(d2019_09_02).
% date_split(d2019_09_02, 2019, 9, 2).
% date(d2019_12_31).
% date_split(d2019_12_31, 2019, 12, 31).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_09_02).
date_split(d2018_09_02, 2018, 9, 2).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

finance(3200).
finance(4520).

service_(alice_employer_s3306_a_2_A_neg).
patient_(alice_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
agent_(alice_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
start_(alice_employer_s3306_a_2_A_neg,d2017_02_01).
end_(alice_employer_s3306_a_2_A_neg,d2017_09_02).
purpose_(alice_employer_s3306_a_2_A_neg,"agricultural labor").
payment_(alice_pays_s3306_a_2_A_neg).
agent_(alice_pays_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
patient_(alice_pays_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
start_(alice_pays_s3306_a_2_A_neg,d2017_09_02).
purpose_(alice_pays_s3306_a_2_A_neg,alice_employer_s3306_a_2_A_neg).
amount_(alice_pays_s3306_a_2_A_neg,3200).
s3306_b(3200,alice_pays_s3306_a_2_A_neg,alice_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,"cash").
service_(bob_employer_s3306_a_2_A_neg).
patient_(bob_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
agent_(bob_employer_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
start_(bob_employer_s3306_a_2_A_neg,d2017_04_01).
end_(bob_employer_s3306_a_2_A_neg,d2018_09_02).
payment_(bob_pays_s3306_a_2_A_neg).
agent_(bob_pays_s3306_a_2_A_neg,bob_s3306_a_2_A_neg).
patient_(bob_pays_s3306_a_2_A_neg,alice_s3306_a_2_A_neg).
start_(bob_pays_s3306_a_2_A_neg,d2018_09_02).
purpose_(bob_pays_s3306_a_2_A_neg,bob_employer_s3306_a_2_A_neg).
amount_(bob_pays_s3306_a_2_A_neg,4520).
s3306_b(4520,bob_pays_s3306_a_2_A_neg,bob_employer_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,bob_s3306_a_2_A_neg,alice_s3306_a_2_A_neg,"cash").

% Test
:- \+ s3306_a_2_A(alice_s3306_a_2_A_neg,2017,3200,alice_employer_s3306_a_2_A_neg).
:- halt.
