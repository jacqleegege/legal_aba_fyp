% Text
% In 2016, Alice's income was $310192. Alice is a surviving spouse for the year 2016. Alice is allowed itemized deductions of $60000 under section 63.

% Question
% Section 68(a)(1) prescribes a reduction of Alice's itemized deductions for the year 2016 by $306. Entailment

% Facts
person(alice).
person(spouse).
finance(310192).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

income_(alice_is_paid).
agent_(alice_is_paid,alice).
start_(alice_is_paid,"2016-12-31").
amount_(alice_is_paid,310192).
s2_a(alice,spouse,2016).
pos_s68_b(Applicable_amount,Gross_income):-
    s68_b(alice,Applicable_amount,2016),
    gross_income(alice,2016,Gross_income),
    s68_a_1(Gross_income,Applicable_amount,306).

% Test
:- pos_s68_b(300000,310192).
:- halt.
