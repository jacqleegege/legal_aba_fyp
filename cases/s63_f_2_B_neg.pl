% Text
% In 2017, Alice was paid $33200. Alice and Bob have been married since Feb 3rd, 2017. Alice has been blind since October 4, 2013. In addition, Alice is allowed an exemption for Bob under section 151(b) for the year 2017.

% Question
% Section 63(f)(2)(B) applies to Alice in 2017. Contradiction

% Facts
person(alice).
person(bob).
finance(33200).

year(2013).
date("2013-10-04").
date_split("2013-10-04", 2013, 10, 4).
date("2013-01-01").
date_split("2013-01-01", 2013, 1, 1).
date("2013-12-31").
date_split("2013-12-31", 2013, 12, 31).

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
marriage_(alice_and_bob).
agent_(alice_and_bob,alice).
agent_(alice_and_bob,bob).
start_(alice_and_bob,"2017-02-03").
blindness_(alice_is_blind).
agent_(alice_is_blind,alice).
start_(alice_is_blind,"2013-10-04").
s151_b_applies(alice,bob,2017).

% Test
:- \+ s63_f_2_B(alice,bob,2017).
:- halt.
