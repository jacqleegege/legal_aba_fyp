% Text
% Alice has paid wages of $3200 to Bob for work done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4500 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(1)(A) make Alice an employer for the year 2017. Entailment

% Facts
person(alice).
person(bob).
finance(3200).
finance(4500).

year(2017).
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


s3306_b(3200,3200,bob_works,alice,bob,alice,bob,"cash").
start_(bob_works,"2017-02-01").
end_(bob_works,"2017-09-02").
s3306_b(4500,4500,alice_works,bob,alice,bob,alice,"cash").
start_(alice_works,"2017-04-01").
end_(alice_works,"2018-09-02").

% Test
:- s3306_a_1_A(alice,2017,3200).
:- halt.
