% Text
% Alice has paid $3200 to Bob for domestic service done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid $4500 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Alice is an employer under section 3306(a)(1) for the year 2018. Contradiction

% Facts
person(alice_s3306_a_1_neg).
person(bob_s3306_a_1_neg).

year(2017).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_09_02).
date_split(d2019_09_02, 2019, 9, 2).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_09_02).
date_split(d2018_09_02, 2018, 9, 2).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

finance(3200).
finance(4500).

service_(alice_employer_s3306_a_1_neg).
patient_(alice_employer_s3306_a_1_neg,alice_s3306_a_1_neg).
agent_(alice_employer_s3306_a_1_neg,bob_s3306_a_1_neg).
start_(alice_employer_s3306_a_1_neg,d2017_02_01).
end_(alice_employer_s3306_a_1_neg,d2017_09_02).
purpose_(alice_employer_s3306_a_1_neg,domestic_service).
payment_(alice_pays_s3306_a_1_neg).
agent_(alice_pays_s3306_a_1_neg,alice_s3306_a_1_neg).
patient_(alice_pays_s3306_a_1_neg,bob_s3306_a_1_neg).
start_(alice_pays_s3306_a_1_neg,d2019_09_02).
purpose_(alice_pays_s3306_a_1_neg,alice_employer_s3306_a_1_neg).
amount_(alice_pays_s3306_a_1_neg,3200).
s3306_b(3200,alice_pays_s3306_a_1_neg,alice_employer_s3306_a_1_neg,alice_s3306_a_1_neg,bob_s3306_a_1_neg,alice_s3306_a_1_neg,bob_s3306_a_1_neg,_).
service_(bob_employer_s3306_a_1_neg).
patient_(bob_employer_s3306_a_1_neg,bob_s3306_a_1_neg).
agent_(bob_employer_s3306_a_1_neg,alice_s3306_a_1_neg).
start_(bob_employer_s3306_a_1_neg,d2017_02_01).
end_(bob_employer_s3306_a_1_neg,d2017_09_02).
payment_(bob_pays_s3306_a_1_neg).
agent_(bob_pays_s3306_a_1_neg,bob_s3306_a_1_neg).
patient_(bob_pays_s3306_a_1_neg,alice_s3306_a_1_neg).
start_(bob_pays_s3306_a_1_neg,d2018_09_02).
purpose_(bob_pays_s3306_a_1_neg,bob_employer_s3306_a_1_neg).
amount_(bob_pays_s3306_a_1_neg,4500).
s3306_b(4500,bob_pays_s3306_a_1_neg,bob_employer_s3306_a_1_neg,bob_s3306_a_1_neg,alice_s3306_a_1_neg,bob_s3306_a_1_neg,alice_s3306_a_1_neg,_).

% Test
:- \+ s3306_a_1(alice_s3306_a_1_neg,2018).
:- halt.
