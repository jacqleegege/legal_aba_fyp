% Text
% Alice has paid wages of $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4500 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(1)(A) make Alice an employer for the year 2017. Entailment

% Facts
person(alice_s3306_a_1_A_pos).
person(bob_s3306_a_1_A_pos).
finance(3200).
finance(4500).

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
date(d2018_09_02).
date_split(d2018_09_02, 2018, 9, 2).
date(d2018_01_01).
date_split(d2018_01_01, 2018, 1, 1).
date(d2018_12_31).
date_split(d2018_12_31, 2018, 12, 31).


s3306_b(3200,3200,bob_works_s3306_a_1_A_pos,alice_s3306_a_1_A_pos,bob_s3306_a_1_A_pos,alice_s3306_a_1_A_pos,bob_s3306_a_1_A_pos,"cash").
start_(bob_works_s3306_a_1_A_pos,d2017_02_01).
end_(bob_works_s3306_a_1_A_pos,d2017_09_02).
s3306_b(4500,4500,alice_works_s3306_a_1_A_pos,bob_s3306_a_1_A_pos,alice_s3306_a_1_A_pos,bob_s3306_a_1_A_pos,alice_s3306_a_1_A_pos,"cash").
start_(alice_works_s3306_a_1_A_pos,d2017_04_01).
end_(alice_works_s3306_a_1_A_pos,d2018_09_02).

% Test
:- s3306_a_1_A(alice_s3306_a_1_A_pos,2017,3200).
:- halt.
