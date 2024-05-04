% Text
% Alice was paid $73200 in 2017 as an employee of the Canadian Government.

% Question
% Section 3306(c)(11) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name("toronto").
location_name("ontario").
location_name("canada").

finance(73200).

service_(alice_employed).
patient_(alice_employed,"canadian government").
agent_(alice_employed,alice).
start_(alice_employed,"2017-01-01").
end_(alice_employed,"2017-12-31").
location_(alice_employed,"toronto").
location_(alice_employed,"ontario").
location_(alice_employed,"canada").
payment_(alice_is_paid).
agent_(alice_is_paid,"canadian government").
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
purpose_(alice_is_paid,alice_employed).
amount_(alice_is_paid,73200).

% Test
:- s3306_c_11(alice_employed,"canadian government").
:- halt.