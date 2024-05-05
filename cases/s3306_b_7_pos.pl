% Text
% Alice has been running a typewriter factory since February 1st, 2016. Bob is an employee at the typewriter factory. On October 2nd 2017, Alice has given a typewriter of value $323 to Bob in exchange for Bob painting Alice's house.

% Question
% Section 3306(b)(7) applies to the payment Alice made to Bob. Entailment

% Facts
person(alice_s3306_b_7_pos).
person(bob_s3306_b_7_pos).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-02-01").
date_split("2016-02-01", 2016, 2, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-06-01").
date_split("2017-06-01", 2017, 6, 1).
date("2017-08-31").
date_split("2017-08-31", 2017, 8, 31).
date("2017-10-02").
date_split("2017-10-02", 2017, 10, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

finance(323).
medium("goods").

business_(alice_runs_a_factory_s3306_b_7_pos).
agent_(alice_runs_a_factory_s3306_b_7_pos,alice_s3306_b_7_pos).
type_(alice_runs_a_factory_s3306_b_7_pos,"manufacturing").
start_(alice_runs_a_factory_s3306_b_7_pos,"2016-02-01").
service_(alice_employer_s3306_b_7_pos).
patient_(alice_employer_s3306_b_7_pos,alice_s3306_b_7_pos).
agent_(alice_employer_s3306_b_7_pos,bob_s3306_b_7_pos).
start_(alice_employer_s3306_b_7_pos,"2017-06-01").
end_(alice_employer_s3306_b_7_pos,"2017-08-31").
type_(alice_employer_s3306_b_7_pos,"painting Alice's house").
payment_(alice_pays_bob_s3306_b_7_pos).
agent_(alice_pays_bob_s3306_b_7_pos,alice_s3306_b_7_pos).
patient_(alice_pays_bob_s3306_b_7_pos,bob_s3306_b_7_pos).
start_(alice_pays_bob_s3306_b_7_pos,"2017-10-02").
end_(alice_pays_bob_s3306_b_7_pos,"2017-10-02").
purpose_(alice_pays_bob_s3306_b_7_pos,alice_employer_s3306_b_7_pos).
amount_(alice_pays_bob_s3306_b_7_pos,323).
means_(alice_pays_bob_s3306_b_7_pos,"goods").
s3306_c(alice_employer_s3306_b_7_pos,alice_s3306_b_7_pos,bob_s3306_b_7_pos,Day,2017) :-
    is_before("2017-06-01",Day),
    is_before(Day,"2017-08-31").

% Test
:- s3306_b_7(alice_pays_bob_s3306_b_7_pos,alice_employer_s3306_b_7_pos,alice_s3306_b_7_pos,bob_s3306_b_7_pos,"goods","manufacturing").
:- halt.
