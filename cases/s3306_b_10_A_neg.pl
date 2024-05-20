% Text
% Alice has employed Bob from Jan 2nd, 2011 to Oct 10, 2019. On Oct 10, 2019 Bob retired because he reached age 65. Alice paid Bob $12980 as a retirement bonus.

% Question
% Section 3306(b)(10)(A) applies to the payment of $12980 that Alice made in 2019. Contradiction

% Facts
person(alice_s3306_b_10_A_neg).
person(bob_s3306_b_10_A_neg).

year(2011).
date(d2011_01_01).
date_split(d2011_01_01, 2011, 1, 1).
date(d2011_01_02).
date_split(d2011_01_02, 2011, 1, 2).
date(d2011_12_31).
date_split(d2011_12_31, 2011, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_10_10).
date_split(d2019_10_10, 2019, 10, 10).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

finance(12980).

service_(alice_employer_s3306_b_10_A_neg).
patient_(alice_employer_s3306_b_10_A_neg,alice_s3306_b_10_A_neg).
agent_(alice_employer_s3306_b_10_A_neg,bob_s3306_b_10_A_neg).
start_(alice_employer_s3306_b_10_A_neg,d2011_01_02).
end_(alice_employer_s3306_b_10_A_neg,d2019_10_10).
termination_(alice_lays_bob_off_s3306_b_10_A_neg).
agent_(alice_lays_bob_off_s3306_b_10_A_neg,alice_s3306_b_10_A_neg).
patient_(alice_lays_bob_off_s3306_b_10_A_neg,alice_employer_s3306_b_10_A_neg).
retirement_(bob_retires_s3306_b_10_A_neg).
agent_(bob_retires_s3306_b_10_A_neg,bob_s3306_b_10_A_neg).
start_(bob_retires_s3306_b_10_A_neg,d2019_10_10).
reason_(bob_retires_s3306_b_10_A_neg,"reached age 65").
payment_(alice_pays_s3306_b_10_A_neg).
agent_(alice_pays_s3306_b_10_A_neg,alice_s3306_b_10_A_neg).
patient_(alice_pays_s3306_b_10_A_neg,bob_s3306_b_10_A_neg).
start_(alice_pays_s3306_b_10_A_neg,d2019_10_10).
purpose_(alice_pays_s3306_b_10_A_neg,alice_lays_bob_off_s3306_b_10_A_neg).
amount_(alice_pays_s3306_b_10_A_neg,12980).

% Test
:- \+ s3306_b_10_A(alice_pays_s3306_b_10_A_neg,alice_employer_s3306_b_10_A_neg,bob_s3306_b_10_A_neg,alice_s3306_b_10_A_neg,alice_lays_bob_off_s3306_b_10_A_neg,bob_retires_s3306_b_10_A_neg).
:- halt.
