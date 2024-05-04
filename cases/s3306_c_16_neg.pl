% Text
% Alice was paid $73200 in 2017 as an employee of the United States Government in Arlington, Virginia, USA.

% Question
% Section 3306(c)(16) applies to Alice's employment situation in 2017. Contradiction

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name(arlington).
location_name(virginia).
location_name(usa).

finance(73200).

service_(alice_employed).
patient_(alice_employed,"united states government").
agent_(alice_employed,alice).
start_(alice_employed,"2017-01-01").
end_(alice_employed,"2017-12-31").
location_(alice_employed,arlington).
location_(alice_employed,virginia).
location_(alice_employed,usa).
payment_(alice_is_paid).
agent_(alice_is_paid,"united states government").
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
purpose_(alice_is_paid,alice_employed).
amount_(alice_is_paid,73200).

% Test
:- \+ s3306_c_16(alice_employed,"united states government").
:- halt.
