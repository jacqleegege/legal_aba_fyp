% Text
% Alice has paid $3200 in cash to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid $4200 in cash to Alice for domestic service in his home, done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(3) applies to Bob for the year 2018. Entailment

% Facts
person(alice_s3306_a_3_pos).
person(bob_s3306_a_3_pos).

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

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_09_02).
date_split(d2018_09_02, 2018, 9, 2).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

finance(3200).
finance(4200).

medium("cash").
location_name("private home_s3306_a_3_pos").

service_(alice_employer_s3306_a_3_pos).
patient_(alice_employer_s3306_a_3_pos,alice_s3306_a_3_pos).
agent_(alice_employer_s3306_a_3_pos,bob_s3306_a_3_pos).
start_(alice_employer_s3306_a_3_pos,d2017_02_01).
end_(alice_employer_s3306_a_3_pos,d2017_09_02).
purpose_(alice_employer_s3306_a_3_pos,"agricultural labor").
payment_(alice_pays_s3306_a_3_pos).
agent_(alice_pays_s3306_a_3_pos,alice_s3306_a_3_pos).
patient_(alice_pays_s3306_a_3_pos,bob_s3306_a_3_pos).
start_(alice_pays_s3306_a_3_pos,d2017_09_02).
end_(alice_pays_s3306_a_3_pos,d2017_09_02).
purpose_(alice_pays_s3306_a_3_pos,alice_employer_s3306_a_3_pos).
amount_(alice_pays_s3306_a_3_pos,3200).
means_(alice_pays_s3306_a_3_pos,"cash").
s3306_b(3200,alice_pays_s3306_a_3_pos,alice_employer_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,"cash").
service_(bob_employer_s3306_a_3_pos).
patient_(bob_employer_s3306_a_3_pos,bob_s3306_a_3_pos).
agent_(bob_employer_s3306_a_3_pos,alice_s3306_a_3_pos).
start_(bob_employer_s3306_a_3_pos,d2017_04_01).
end_(bob_employer_s3306_a_3_pos,d2018_09_02).
purpose_(bob_employer_s3306_a_3_pos, "domestic service").
location_(bob_employer_s3306_a_3_pos, "private home_s3306_a_3_pos").
payment_(bob_pays_s3306_a_3_pos).
agent_(bob_pays_s3306_a_3_pos,bob_s3306_a_3_pos).
patient_(bob_pays_s3306_a_3_pos,alice_s3306_a_3_pos).
start_(bob_pays_s3306_a_3_pos,d2018_09_02).
end_(bob_pays_s3306_a_3_pos,d2018_09_02).
purpose_(bob_pays_s3306_a_3_pos,bob_employer_s3306_a_3_pos).
amount_(bob_pays_s3306_a_3_pos,4200).
means_(bob_pays_s3306_a_3_pos,"cash").
s3306_b(4200,bob_pays_s3306_a_3_pos,bob_employer_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,"cash").

% Test
:- s3306_a_3(bob_s3306_a_3_pos,4200,2018).
:- halt.
