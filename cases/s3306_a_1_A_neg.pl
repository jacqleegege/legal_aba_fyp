% Text
% Alice has paid wages of $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4500 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(1)(A) make Alice an employer for the year 2019. Contradiction

% Facts
person(alice_s3306_a_1_A_neg).
person(bob_s3306_a_1_A_neg).
finance(3200).
finance(4500).

date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-04-01").
date_split("2017-04-01", 2017, 4, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2018).
date("2018-09-02").
date_split("2018-09-02", 2018, 9, 2).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

s3306_b(3200,3200,bob_works_s3306_a_1_A_neg,alice_s3306_a_1_A_neg,bob_s3306_a_1_A_neg,alice_s3306_a_1_A_neg,bob_s3306_a_1_A_neg,"cash").
start_(bob_works_s3306_a_1_A_neg,"2017-02-01").
end_(bob_works_s3306_a_1_A_neg,"2017-09-02").
s3306_b(4500,4500,alice_works_s3306_a_1_A_neg,bob_s3306_a_1_A_neg,alice_s3306_a_1_A_neg,bob_s3306_a_1_A_neg,alice_s3306_a_1_A_neg,"cash").
start_(alice_works_s3306_a_1_A_neg,"2017-04-01").
end_(alice_works_s3306_a_1_A_neg,"2018-09-02").

% Test
:- \+ s3306_a_1_A(alice_s3306_a_1_A_neg,2019,3200).
:- halt.
