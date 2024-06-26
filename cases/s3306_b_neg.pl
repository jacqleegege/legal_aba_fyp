% Text
% Over the year 2018, Alice has paid $2325 in hay to Bob for agricultural labor.

% Question
% Section 3306(b) applies to the hay paid by Alice to Bob for the year 2018. Contradiction

% Facts
person(alice_s3306_b_neg).
person(bob_s3306_b_neg).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

finance(2325).
medium(kind).

service_(alice_employer_s3306_b_neg).
patient_(alice_employer_s3306_b_neg,alice_s3306_b_neg).
agent_(alice_employer_s3306_b_neg,bob_s3306_b_neg).
start_(alice_employer_s3306_b_neg,d2018_01_01).
end_(alice_employer_s3306_b_neg,d2018_12_31).
purpose_(alice_employer_s3306_b_neg,agricultural_labor).
payment_(alice_pays_s3306_b_neg).
agent_(alice_pays_s3306_b_neg,alice_s3306_b_neg).
patient_(alice_pays_s3306_b_neg,bob_s3306_b_neg).
start_(alice_pays_s3306_b_neg,d2018_01_01).
end_(alice_pays_s3306_b_neg,d2018_12_31).
purpose_(alice_pays_s3306_b_neg,alice_employer_s3306_b_neg).
amount_(alice_pays_s3306_b_neg,2325).
means_(alice_pays_s3306_b_neg,kind).

% Test
:- \+ s3306_b(2325,alice_pays_s3306_b_neg,alice_employer_s3306_b_neg,alice_s3306_b_neg,bob_s3306_b_neg,alice_s3306_b_neg,bob_s3306_b_neg,kind).
:- halt.
