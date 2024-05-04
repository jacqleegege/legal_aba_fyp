% Text
% Alice has paid wages of $3200 to Bob for domestic service done in her home from Feb 1st, 2017 to Sep 2nd, 2017, in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(2) applies to Alice employing Bob for the year 2017. Contradiction

% Facts
person(alice).
person(bob).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-02-01").
date_split("2017-02-01", 2017, 2, 1).
date("2017-09-02").
date_split("2017-09-02", 2017, 9, 2).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).
location_name("private home").

finance(3200).

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2017-02-01").
end_(alice_employer,"2017-09-02").
location_(alice_employer,baltimore).
location_(alice_employer,maryland).
location_(alice_employer,usa).
purpose_(alice_employer,"domestic service").
location_(alice_employer,"private home").
payment_(alice_pays).
agent_(alice_pays,alice).
patient_(alice_pays,bob).
start_(alice_pays,"2017-09-02").
purpose_(alice_pays,alice_employer).
amount_(alice_pays,3200).
s3306_b(3200,alice_pays,alice_employer,alice,bob,alice,bob,"cash")

% Test
:- \+ s3306_c_2(alice_employer,baltimore,2017).
:- \+ s3306_c_2(alice_employer,maryland,2017).
:- \+ s3306_c_2(alice_employer,usa,2017).
:- \+ s3306_c_2(alice_employer,"private home",2017).
:- halt.
