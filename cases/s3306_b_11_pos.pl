% Text
% Alice has paid $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Alice paid Bob with eggs, grapes and hay.

% Question
% Section 3306(b)(11) applies to the payment that Alice made to Bob for the year 2017. Entailment

% Facts
person(alice_s3306_b_11_pos).
person(bob_s3306_b_11_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

finance(3200).
medium(kind).

service_(alice_employer_s3306_b_11_pos).
patient_(alice_employer_s3306_b_11_pos,alice_s3306_b_11_pos).
agent_(alice_employer_s3306_b_11_pos,bob_s3306_b_11_pos).
start_(alice_employer_s3306_b_11_pos,d2017_02_01).
end_(alice_employer_s3306_b_11_pos,d2017_09_02).
purpose_(alice_employer_s3306_b_11_pos,agricultural_labor).
payment_(alice_pays_s3306_b_11_pos).
agent_(alice_pays_s3306_b_11_pos,alice_s3306_b_11_pos).
patient_(alice_pays_s3306_b_11_pos,bob_s3306_b_11_pos).
start_(alice_pays_s3306_b_11_pos,d2017_09_02).
purpose_(alice_pays_s3306_b_11_pos,alice_employer_s3306_b_11_pos).
amount_(alice_pays_s3306_b_11_pos,3200).
means_(alice_pays_s3306_b_11_pos,kind).

% Test
:- s3306_b_11(alice_pays_s3306_b_11_pos,alice_employer_s3306_b_11_pos,kind).
:- halt.
