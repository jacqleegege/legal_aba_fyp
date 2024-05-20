% Text
% Alice has paid wages of $3200 to Bob for domestic service done from Feb 1st, 2017 to Sep 2nd, 2017. In 2018, Bob has paid wages of $4500 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Bob is an employer under section 3306(a)(1) for the year 2018. Entailment

% Facts
person(alice_s3306_a_1_pos).
person(bob_s3306_a_1_pos).

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

service_(alice_employer_s3306_a_1_pos).
patient_(alice_employer_s3306_a_1_pos,alice_s3306_a_1_pos).
agent_(alice_employer_s3306_a_1_pos,bob_s3306_a_1_pos).
start_(alice_employer_s3306_a_1_pos,d2017_02_01).
end_(alice_employer_s3306_a_1_pos,d2017_09_02).
purpose_(alice_employer_s3306_a_1_pos,"domestic service").
payment_(alice_pays_s3306_a_1_pos).
agent_(alice_pays_s3306_a_1_pos,alice_s3306_a_1_pos).
patient_(alice_pays_s3306_a_1_pos,bob_s3306_a_1_pos).
start_(alice_pays_s3306_a_1_pos,d2019_09_02).
purpose_(alice_pays_s3306_a_1_pos,alice_employer_s3306_a_1_pos).
amount_(alice_pays_s3306_a_1_pos,3200).
s3306_b(3200,alice_pays_s3306_a_1_pos,alice_employer_s3306_a_1_pos,alice_s3306_a_1_pos,bob_s3306_a_1_pos,alice_s3306_a_1_pos,bob_s3306_a_1_pos,"cash").
service_(bob_employer_s3306_a_1_pos).
patient_(bob_employer_s3306_a_1_pos,bob_s3306_a_1_pos).
agent_(bob_employer_s3306_a_1_pos,alice_s3306_a_1_pos).
start_(bob_employer_s3306_a_1_pos,d2017_02_01).
end_(bob_employer_s3306_a_1_pos,d2017_09_02).
payment_(bob_pays_s3306_a_1_pos).
agent_(bob_pays_s3306_a_1_pos,bob_s3306_a_1_pos).
patient_(bob_pays_s3306_a_1_pos,alice_s3306_a_1_pos).
start_(bob_pays_s3306_a_1_pos,d2018_09_02).
end_(bob_pays_s3306_a_1_pos,d2018_09_02).
purpose_(bob_pays_s3306_a_1_pos,bob_employer_s3306_a_1_pos).
amount_(bob_pays_s3306_a_1_pos,4500).
s3306_b(4500,bob_pays_s3306_a_1_pos,bob_employer_s3306_a_1_pos,bob_s3306_a_1_pos,alice_s3306_a_1_pos,bob_s3306_a_1_pos,alice_s3306_a_1_pos,"cash").

% Test
:- s3306_a_1(bob_s3306_a_1_pos,2018).
:- halt.
