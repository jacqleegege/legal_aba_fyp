% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice was born March 2nd, 1950 and Bob was born March 3rd, 1955.

% Question
% Section 63(f)(1)(A) applies to Bob in 2017. Contradiction

% Facts
person(alice).
person(bob).
finance(33200).

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(1950).
date("1950-03-02").
date_split("1950-03-02", 1950, 3, 2).
date("1950-01-01").
date_split("1950-01-01", 1950, 1, 1).
date("1950-12-31").
date_split("1950-12-31", 1950, 12, 31).

year(1955).
date("1955-03-03").
date_split("1955-03-03", 1955, 3, 3).
date("1955-01-01").
date_split("1955-01-01", 1955, 1, 1).
date("1955-12-31").
date_split("1955-12-31", 1955, 12, 31).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2017-02-03").
birth_(alice_is_born).
agent_(alice_is_born,alice).
start_(alice_is_born,"1950-03-02").
end_(alice_is_born,"1950-03-02").
birth_(bob_is_born).
agent_(bob_is_born,bob).
start_(bob_is_born,"1955-03-03").
end_(bob_is_born,"1955-03-03").

% Test
:- \+ s63_f_1_A(bob,2017).
:- halt.
