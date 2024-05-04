% Text
% Alice has paid wages of $6771, $6954, $6872 to Bob, Charlie and Dan respectively for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4520 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(2)(A) make Alice an employer for the year 2017. Entailment

% Facts
person(alice).
person(bob).
person(charlie).
person(dan).

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
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-09-02").
date_split("2018-09-02", 2018, 9, 2).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

finance(4520).
finance(6771).
finance(6954).
finance(6872).

service_(alice_employer_bob).
patient_(alice_employer_bob,alice).
agent_(alice_employer_bob,bob).
start_(alice_employer_bob,"2017-02-01").
end_(alice_employer_bob,"2017-09-02").
purpose_(alice_employer_bob,"agricultural labor").
payment_(alice_pays_bob).
agent_(alice_pays_bob,alice).
patient_(alice_pays_bob,bob).
start_(alice_pays_bob,"2017-09-02").
purpose_(alice_pays_bob,alice_employer_bob).
amount_(alice_pays_bob,6771).
s3306_b(6771,alice_pays_bob,alice_employer_bob,alice,bob,alice,bob,_).
service_(alice_employer_charlie).
patient_(alice_employer_charlie,alice).
agent_(alice_employer_charlie,charlie).
start_(alice_employer_charlie,"2017-02-01").
end_(alice_employer_charlie,"2017-09-02").
purpose_(alice_employer_charlie,"agricultural labor").
payment_(alice_pays_charlie).
agent_(alice_pays_charlie,alice).
patient_(alice_pays_charlie,charlie).
start_(alice_pays_charlie,"2017-09-02").
purpose_(alice_pays_charlie,alice_employer_charlie).
amount_(alice_pays_charlie,6954).
s3306_b(6954,alice_pays_charlie,alice_employer_charlie,alice,charlie,alice,charlie,_).
service_(alice_employer_dan).
patient_(alice_employer_dan,alice).
agent_(alice_employer_dan,dan).
start_(alice_employer_dan,"2017-02-01").
end_(alice_employer_dan,"2017-09-02").
purpose_(alice_employer_dan,"agricultural labor").
payment_(alice_pays_dan).
agent_(alice_pays_dan,alice).
patient_(alice_pays_dan,dan).
start_(alice_pays_dan,"2017-09-02").
purpose_(alice_pays_dan,alice_employer_dan).
amount_(alice_pays_dan,6872).
s3306_b(6872,alice_pays_dan,alice_employer_dan,alice,dan,alice,dan,_).
service_(bob_employer).
patient_(bob_employer,bob).
agent_(bob_employer,alice).
start_(bob_employer,"2017-04-01").
end_(bob_employer,"2018-09-02").
payment_(bob_pays).
agent_(bob_pays,bob).
patient_(bob_pays,alice).
start_(bob_pays,"2018-09-02").
end_(bob_pays,"2018-09-02").
purpose_(bob_pays,bob_employer).
amount_(bob_pays,4520).
s3306_b(4520,bob_pays,bob_employer,bob,alice,bob,alice,"cash").

% Test
:- s3306_a_2_A(alice,2017,6771,alice_employer_bob),s3306_a_2_A(alice,2017,6954,alice_employer_charlie),s3306_a_2_A(alice,2017,6872,alice_employer_dan).
:- halt.
