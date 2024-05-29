% Text
% Alice has paid $3200 in cash to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid $4200 in cash to Alice for domestic service done from Apr 1st, 2017 to Sep 2nd, 2018 in his home.

% Question
% Section 3306(a)(3) applies to Alice for the year 2017. Contradiction

% Facts
person(alice_s3306_a_3_neg).
person(bob_s3306_a_3_neg).

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

medium(cash).
location_name(private_home_s3306_a_3_neg).

service_(alice_employer_s3306_a_3_neg).
patient_(alice_employer_s3306_a_3_neg,alice_s3306_a_3_neg).
agent_(alice_employer_s3306_a_3_neg,bob_s3306_a_3_neg).
start_(alice_employer_s3306_a_3_neg,d2017_02_01).
end_(alice_employer_s3306_a_3_neg,d2017_09_02).
purpose_(alice_employer_s3306_a_3_neg,agricultural_labor).
payment_(alice_pays_s3306_a_3_neg).
agent_(alice_pays_s3306_a_3_neg,alice_s3306_a_3_neg).
patient_(alice_pays_s3306_a_3_neg,bob_s3306_a_3_neg).
start_(alice_pays_s3306_a_3_neg,d2017_09_02).
purpose_(alice_pays_s3306_a_3_neg,alice_employer_s3306_a_3_neg).
amount_(alice_pays_s3306_a_3_neg,3200).
means_(alice_pays_s3306_a_3_neg,cash).
s3306_b(3200,alice_pays_s3306_a_3_neg,alice_employer_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,cash).
service_(bob_employer_s3306_a_3_neg).
patient_(bob_employer_s3306_a_3_neg,bob_s3306_a_3_neg).
agent_(bob_employer_s3306_a_3_neg,alice_s3306_a_3_neg).
start_(bob_employer_s3306_a_3_neg,d2017_04_01).
end_(bob_employer_s3306_a_3_neg,d2018_09_02).
purpose_(bob_employer_s3306_a_3_neg, domestic_service).
location_(bob_employer_s3306_a_3_neg, private_home_s3306_a_3_neg).
payment_(bob_pays_s3306_a_3_neg).
agent_(bob_pays_s3306_a_3_neg,bob_s3306_a_3_neg).
patient_(bob_pays_s3306_a_3_neg,alice_s3306_a_3_neg).
start_(bob_pays_s3306_a_3_neg,d2018_09_02).
purpose_(bob_pays_s3306_a_3_neg,bob_employer_s3306_a_3_neg).
amount_(bob_pays_s3306_a_3_neg,4200).
means_(bob_pays_s3306_a_3_neg,cash).
s3306_b(4200,bob_pays_s3306_a_3_neg,bob_employer_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,bob_s3306_a_3_neg,alice_s3306_a_3_neg,cash).

% Test
:- \+ s3306_a_3(alice_s3306_a_3_neg,3200,2017).
:- halt.
