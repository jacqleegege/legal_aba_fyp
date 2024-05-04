% Text
% In 2017, Alice was paid $33200. For the year 2017, Alice is allowed a basic standard deduction under section 63(c)(2) of $2000 and an additional standard deduction of $3000 under section 63(c)(3) for the year 2017.

% Question
% Under section 63(c)(1), Alice's standard deduction in 2017 is equal to $4000. Contradiction

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01",2017,1,1).
date("2017-12-31").
date_split("2017-12-31",2017,12,31).

finance(33200).
finance(2000).
finance(3000).

payment_(alice_is_paid).
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-12-31").
amount_(alice_is_paid,33200).
s63_c_2(alice,2017,2000).
s63_c_3(alice,3000,2017).


% Test
:- \+ s63_c_1(alice,2017,4000).
:- halt.
