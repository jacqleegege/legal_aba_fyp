% Text
% Alice has employed Bob from Jan 2nd, 2011 to Oct 10, 2019. On Oct 10, 2019 Bob retired because he reached age 65. Alice paid Bob $12980 as a retirement bonus.

% Question
% Section 3306(b)(10)(A) applies to the payment of $12980 that Alice made in 2019. Contradiction

% Facts
person(alice).
person(bob).

year(2011).
date("2011-01-01").
date_split("2011-01-01", 2011, 1, 1).
date("2011-01-02").
date_split("2011-01-02", 2011, 1, 2).
date("2011-12-31").
date_split("2011-12-31", 2011, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-10-10").
date_split("2019-10-10", 2019, 10, 10).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

finance(12980).

service_(alice_employer).
patient_(alice_employer,alice).
agent_(alice_employer,bob).
start_(alice_employer,"2011-01-02").
end_(alice_employer,"2019-10-10").
termination_(alice_lays_bob_off).
agent_(alice_lays_bob_off,alice).
patient_(alice_lays_bob_off,alice_employer).
retirement_(bob_retires).
agent_(bob_retires,bob).
start_(bob_retires,"2019-10-10").
reason_(bob_retires,"reached age 65").
payment_(alice_pays).
agent_(alice_pays,alice).
patient_(alice_pays,bob).
start_(alice_pays,"2019-10-10").
purpose_(alice_pays,alice_lays_bob_off).
amount_(alice_pays,12980).

% Test
:- \+ s3306_b_10_A(alice_pays,alice_employer,bob,alice,alice_lays_bob_off,bob_retires).
:- halt.
