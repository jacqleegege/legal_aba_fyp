% Text
% In 2016, Alice's income was $267192. Alice is a head of household for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(1) prescribes a reduction of Alice's itemized deductions for the year 2016 by $306. Contradiction

% Facts
person(alice).
finance(267192).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2016-12-31").
amount_(alice_is_paid,267192).
s2_b(alice,_,2016).
neg_s68_b(Applicable_amount,Gross_income):-
    s68_b(alice,Applicable_amount,2016),
    gross_income(alice,2016,Gross_income),
    s68_a_1(Gross_income,Applicable_amount,306).

% Test
:- \+ neg_s68_b(275,000,267192).
:- halt.