% Text
% Alice has paid $3200 in cash to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017. Bob has paid $4200 in cash to Alice for domestic service in his home, done from Apr 1st, 2017 to Sep 2nd, 2018.

% Question
% Section 3306(a)(3) applies to Bob for the year 2018. Entailment

% Facts
person(alice_s3306_a_3_pos).
person(bob_s3306_a_3_pos).

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

finance(3200).
finance(4200).

medium("cash").
location_name("private home_s3306_a_3_pos").

service_(alice_employer_s3306_a_3_pos).
patient_(alice_employer_s3306_a_3_pos,alice_s3306_a_3_pos).
agent_(alice_employer_s3306_a_3_pos,bob_s3306_a_3_pos).
start_(alice_employer_s3306_a_3_pos,"2017-02-01").
end_(alice_employer_s3306_a_3_pos,"2017-09-02").
purpose_(alice_employer_s3306_a_3_pos,"agricultural labor").
payment_(alice_pays_s3306_a_3_pos).
agent_(alice_pays_s3306_a_3_pos,alice_s3306_a_3_pos).
patient_(alice_pays_s3306_a_3_pos,bob_s3306_a_3_pos).
start_(alice_pays_s3306_a_3_pos,"2017-09-02").
end_(alice_pays_s3306_a_3_pos,"2017-09-02").
purpose_(alice_pays_s3306_a_3_pos,alice_employer_s3306_a_3_pos).
amount_(alice_pays_s3306_a_3_pos,3200).
means_(alice_pays_s3306_a_3_pos,"cash").
s3306_b(3200,alice_pays_s3306_a_3_pos,alice_employer_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,"cash").
service_(bob_employer_s3306_a_3_pos).
patient_(bob_employer_s3306_a_3_pos,bob_s3306_a_3_pos).
agent_(bob_employer_s3306_a_3_pos,alice_s3306_a_3_pos).
start_(bob_employer_s3306_a_3_pos,"2017-04-01").
end_(bob_employer_s3306_a_3_pos,"2018-09-02").
purpose_(bob_employer_s3306_a_3_pos, "domestic service").
location_(bob_employer_s3306_a_3_pos, "private home_s3306_a_3_pos").
payment_(bob_pays_s3306_a_3_pos).
agent_(bob_pays_s3306_a_3_pos,bob_s3306_a_3_pos).
patient_(bob_pays_s3306_a_3_pos,alice_s3306_a_3_pos).
start_(bob_pays_s3306_a_3_pos,"2018-09-02").
end_(bob_pays_s3306_a_3_pos,"2018-09-02").
purpose_(bob_pays_s3306_a_3_pos,bob_employer_s3306_a_3_pos).
amount_(bob_pays_s3306_a_3_pos,4200).
means_(bob_pays_s3306_a_3_pos,"cash").
s3306_b(4200,bob_pays_s3306_a_3_pos,bob_employer_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,bob_s3306_a_3_pos,alice_s3306_a_3_pos,"cash").

% Test
:- s3306_a_3(bob_s3306_a_3_pos,4200,2018).
:- halt.
