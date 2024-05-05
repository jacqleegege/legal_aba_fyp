% Text
% Over the year 2018, Alice has paid $2325 in cash to Bob for walking her dog.

% Question
% Section 3306(b) applies to the money paid by Alice to Bob for the year 2018. Entailment

% Facts
person(alice_s3306_b_pos).
person(bob_s3306_b_pos).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

finance(2325).
medium("cash").

service_(alice_employer_s3306_b_pos).
patient_(alice_employer_s3306_b_pos,alice_s3306_b_pos).
agent_(alice_employer_s3306_b_pos,bob_s3306_b_pos).
start_(alice_employer_s3306_b_pos,"2018-01-01").
end_(alice_employer_s3306_b_pos,"2018-12-31").
purpose_(alice_employer_s3306_b_pos,"walking her dog").
payment_(alice_pays_s3306_b_pos).
agent_(alice_pays_s3306_b_pos,alice_s3306_b_pos).
patient_(alice_pays_s3306_b_pos,bob_s3306_b_pos).
start_(alice_pays_s3306_b_pos,"2018-01-01").
end_(alice_pays_s3306_b_pos,"2018-12-31").
purpose_(alice_pays_s3306_b_pos,alice_employer_s3306_b_pos).
amount_(alice_pays_s3306_b_pos,2325).
means_(alice_pays_s3306_b_pos,"cash").

% Test
:- s3306_b(2325,alice_pays_s3306_b_pos,alice_employer_s3306_b_pos,alice_s3306_b_pos,bob_s3306_b_pos,alice_s3306_b_pos,bob_s3306_b_pos,"cash").
:- halt.
