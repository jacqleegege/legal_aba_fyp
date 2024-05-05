% Text
% Alice has paid wages of $6771, $6954, $6872 to Bob, Charlie and Dan respectively for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid wages of $4520 to Alice for work done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(2)(A) make Alice an employer for the year 2017. Entailment

% Facts
person(alice_s3306_a_2_A_pos).
person(bob_s3306_a_2_A_pos).
person(charlie_s3306_a_2_A_pos).
person(dan_s3306_a_2_A_pos).

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
medium("cash").

service_(alice_employer_bob_s3306_a_2_A_pos).
patient_(alice_employer_bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
agent_(alice_employer_bob_s3306_a_2_A_pos,bob_s3306_a_2_A_pos).
start_(alice_employer_bob_s3306_a_2_A_pos,"2017-02-01").
end_(alice_employer_bob_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_employer_bob_s3306_a_2_A_pos,"agricultural labor").
payment_(alice_pays_bob_s3306_a_2_A_pos).
agent_(alice_pays_bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
patient_(alice_pays_bob_s3306_a_2_A_pos,bob_s3306_a_2_A_pos).
start_(alice_pays_bob_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_pays_bob_s3306_a_2_A_pos,alice_employer_bob_s3306_a_2_A_pos).
amount_(alice_pays_bob_s3306_a_2_A_pos,6771).
s3306_b(6771,alice_pays_bob_s3306_a_2_A_pos,alice_employer_bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,bob_s3306_a_2_A_pos,"cash").
service_(alice_employer_charlie_s3306_a_2_A_pos).
patient_(alice_employer_charlie_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
agent_(alice_employer_charlie_s3306_a_2_A_pos,charlie_s3306_a_2_A_pos).
start_(alice_employer_charlie_s3306_a_2_A_pos,"2017-02-01").
end_(alice_employer_charlie_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_employer_charlie_s3306_a_2_A_pos,"agricultural labor").
payment_(alice_pays_charlie_s3306_a_2_A_pos).
agent_(alice_pays_charlie_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
patient_(alice_pays_charlie_s3306_a_2_A_pos,charlie_s3306_a_2_A_pos).
start_(alice_pays_charlie_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_pays_charlie_s3306_a_2_A_pos,alice_employer_charlie_s3306_a_2_A_pos).
amount_(alice_pays_charlie_s3306_a_2_A_pos,6954).
s3306_b(6954,alice_pays_charlie_s3306_a_2_A_pos,alice_employer_charlie_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,charlie_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,charlie_s3306_a_2_A_pos,_).
service_(alice_employer_dan_s3306_a_2_A_pos).
patient_(alice_employer_dan_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
agent_(alice_employer_dan_s3306_a_2_A_pos,dan_s3306_a_2_A_pos).
start_(alice_employer_dan_s3306_a_2_A_pos,"2017-02-01").
end_(alice_employer_dan_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_employer_dan_s3306_a_2_A_pos,"agricultural labor").
payment_(alice_pays_dan_s3306_a_2_A_pos).
agent_(alice_pays_dan_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
patient_(alice_pays_dan_s3306_a_2_A_pos,dan_s3306_a_2_A_pos).
start_(alice_pays_dan_s3306_a_2_A_pos,"2017-09-02").
purpose_(alice_pays_dan_s3306_a_2_A_pos,alice_employer_dan_s3306_a_2_A_pos).
amount_(alice_pays_dan_s3306_a_2_A_pos,6872).
s3306_b(6872,alice_pays_dan_s3306_a_2_A_pos,alice_employer_dan_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,dan_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,dan_s3306_a_2_A_pos,_).
service_(bob_employer_s3306_a_2_A_pos).
patient_(bob_employer_s3306_a_2_A_pos,bob_s3306_a_2_A_pos).
agent_(bob_employer_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
start_(bob_employer_s3306_a_2_A_pos,"2017-04-01").
end_(bob_employer_s3306_a_2_A_pos,"2018-09-02").
payment_(bob_pays_s3306_a_2_A_pos).
agent_(bob_pays_s3306_a_2_A_pos,bob_s3306_a_2_A_pos).
patient_(bob_pays_s3306_a_2_A_pos,alice_s3306_a_2_A_pos).
start_(bob_pays_s3306_a_2_A_pos,"2018-09-02").
end_(bob_pays_s3306_a_2_A_pos,"2018-09-02").
purpose_(bob_pays_s3306_a_2_A_pos,bob_employer_s3306_a_2_A_pos).
amount_(bob_pays_s3306_a_2_A_pos,4520).
s3306_b(4520,bob_pays_s3306_a_2_A_pos,bob_employer_s3306_a_2_A_pos,bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,bob_s3306_a_2_A_pos,alice_s3306_a_2_A_pos,"cash").

% Test
:- s3306_a_2_A(alice_s3306_a_2_A_pos,2017,6771,alice_employer_bob_s3306_a_2_A_pos),s3306_a_2_A(alice_s3306_a_2_A_pos,2017,6954,alice_employer_charlie_s3306_a_2_A_pos),s3306_a_2_A(alice_s3306_a_2_A_pos,2017,6872,alice_employer_dan_s3306_a_2_A_pos).
:- halt.
