% Text
% Alice has paid $2300 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Caracas, Venezuela. Alice and Bob are both American citizens.

% Question
% Section 3306(c)(1)(A)(i) applies to Alice employing Bob for the year 2017. Contradiction

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

location_name("caracas, venezuela").
country_name("venezuela").

finance(2300).

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2017-02-01").
end_(alice_employer,"2017-09-02").
location_(alice_employer,"caracas, venezuela").
country_("caracas, venezuela", "venezuela").
purpose_(alice_employer,"agricultural labor").
payment_(alice_pays).
agent_(alice_pays,alice).
patient_(alice_pays,bob).
start_(alice_pays,"2017-09-02").
purpose_(alice_pays,alice_employer).
amount_(alice_pays,2300).
citizenship_(alice_is_american).
agent_(alice_is_american,alice).
patient_(alice_is_american,"usa").
citizenship_(bob_is_american).
agent_(bob_is_american,bob).
patient_(bob_is_american,"usa").

% Test
:- \+ s3306_c_1_A_i(alice,2300,bob,alice_employer,2017).
:- halt.
