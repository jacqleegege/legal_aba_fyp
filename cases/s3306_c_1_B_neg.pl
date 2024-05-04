% Text
% Alice has paid $3200 to Bob for agricultural labor done from Feb 1st, 2017 to Sep 2nd, 2017, in Stanley, Wisconsin, USA. Alice is an american citizen, and Bob is a Mexican citizen who was admitted to the USA to perform agricultural labor pursuant to sections 214(c) and 101(a)(15)(H) of the Immigration and Nationality Act.

% Question
% Section 3306(c)(1)(B) applies to Alice employing Bob for the year 2017. Contradiction

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

location_name("stanley, wisconsin, usa").
country_name("usa").

finance(3200).

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2017-02-01").
end_(alice_employer,"2017-09-02").
location_(alice_employer,"stanley, wisconsin, usa").
country_("stanley, wisconsin, usa","usa").
purpose_(alice_employer,"agricultural labor").
payment_(alice_pays).
agent_(alice_pays,alice).
patient_(alice_pays,bob).
start_(alice_pays,"2017-09-02").
purpose_(alice_pays,alice_employer).
amount_(alice_pays,3200).
citizenship_(alice_is_american).
agent_(alice_is_american,alice).
patient_(alice_is_american,"usa").
citizenship_(bob_is_mexican).
agent_(bob_is_mexican,bob).
patient_(bob_is_mexican,mexico).
migration_(bob_migrates_to_usa).
destination_(bob_migrates_to_usa,"usa").
agent_(bob_migrates_to_usa,bob).
purpose_(bob_migrates_to_usa,"agricultural labor").

% Test
:- \+ s3306_c_1_B(alice_employer,bob).
:- halt.
