% Text
% Over the year 2018, Alice has paid $2325 in cash to Bob for walking her dog.

% Question
% Section 3306(b) applies to the money paid by Alice to Bob for the year 2018. Entailment

% Facts
person(alice_s3306_b_pos).
person(bob_s3306_b_pos).

year(2018).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).

finance(2325).
medium(cash).

service_(alice_employer_s3306_b_pos).
patient_(alice_employer_s3306_b_pos,alice_s3306_b_pos).
agent_(alice_employer_s3306_b_pos,bob_s3306_b_pos).
start_(alice_employer_s3306_b_pos,d2018_01_01).
end_(alice_employer_s3306_b_pos,d2018_12_31).
purpose_(alice_employer_s3306_b_pos,walking_her_dog).
payment_(alice_pays_s3306_b_pos).
agent_(alice_pays_s3306_b_pos,alice_s3306_b_pos).
patient_(alice_pays_s3306_b_pos,bob_s3306_b_pos).
start_(alice_pays_s3306_b_pos,d2018_01_01).
end_(alice_pays_s3306_b_pos,d2018_12_31).
purpose_(alice_pays_s3306_b_pos,alice_employer_s3306_b_pos).
amount_(alice_pays_s3306_b_pos,2325).
means_(alice_pays_s3306_b_pos,cash).

% Test
:- s3306_b(2325,alice_pays_s3306_b_pos,alice_employer_s3306_b_pos,alice_s3306_b_pos,bob_s3306_b_pos,alice_s3306_b_pos,bob_s3306_b_pos,cash).
:- halt.
