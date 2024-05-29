% Text
% Alice has been running a typewriter factory since February 1st, 2016. Bob is an employee at the typewriter factory. On October 2nd 2017, Alice has paid Bob $323 for painting her house.

% Question
% Section 3306(b)(7) applies to the payment Alice made to Bob. Contradiction

% Facts
person(alice_s3306_b_7_neg).
person(bob_s3306_b_7_neg).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_02_01).
date_split(d2016_02_01, 2016, 2, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_06_01).
date_split(d2017_06_01, 2017, 6, 1).
date(d2017_08_31).
date_split(d2017_08_31, 2017, 8, 31).
date(d2017_10_02).
date_split(d2017_10_02, 2017, 10, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

finance(323).
medium(cash).

business_(alice_runs_a_factory_s3306_b_7_neg).
agent_(alice_runs_a_factory_s3306_b_7_neg,alice_s3306_b_7_neg).
type_(alice_runs_a_factory_s3306_b_7_neg,manufacturing).
start_(alice_runs_a_factory_s3306_b_7_neg,d2016_02_01).
service_(alice_employer_s3306_b_7_neg).
patient_(alice_employer_s3306_b_7_neg,alice_s3306_b_7_neg).
agent_(alice_employer_s3306_b_7_neg,bob_s3306_b_7_neg).
start_(alice_employer_s3306_b_7_neg,d2017_06_01).
end_(alice_employer_s3306_b_7_neg,d2017_08_31).
type_(alice_employer_s3306_b_7_neg,painting_Alices_house).
payment_(alice_pays_bob_s3306_b_7_neg).
agent_(alice_pays_bob_s3306_b_7_neg,alice_s3306_b_7_neg).
patient_(alice_pays_bob_s3306_b_7_neg,bob_s3306_b_7_neg).
start_(alice_pays_bob_s3306_b_7_neg,d2017_10_02).
end_(alice_pays_bob_s3306_b_7_neg,d2017_10_02).
purpose_(alice_pays_bob_s3306_b_7_neg,alice_employer_s3306_b_7_neg).
amount_(alice_pays_bob_s3306_b_7_neg,323).
means_(alice_pays_bob_s3306_b_7_neg,cash).
s3306_c(alice_employer_s3306_b_7_neg,alice_s3306_b_7_neg,bob_s3306_b_7_neg,Day,2017) :-
    is_before(d2017_06_01,Day),
    is_before(Day,d2017_08_31).

% Test
:- \+ s3306_b_7(alice_pays_bob_s3306_b_7_neg,alice_employer_s3306_b_7_neg,alice_s3306_b_7_neg,bob_s3306_b_7_neg,cash,manufacturing).
:- halt.
