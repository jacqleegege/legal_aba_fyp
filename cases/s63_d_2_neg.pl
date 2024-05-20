% Text
% In 2017, Alice was paid $33200 in remuneration. She is allowed deductions under section 63(c)(3) of $1200 for the year 2017.

% Question
% Alice's deduction for 2017 falls under section 63(d)(2). Contradiction

% Facts
person(alice_s63_d_2_neg).
finance(33200).
finance(1200).

year(2017).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2019).
date(d2019_02_03).
date_split(d2019_02_03, 2019, 2, 3).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

payment_(alice_is_paid_s63_d_2_neg).
patient_(alice_is_paid_s63_d_2_neg,alice_s63_d_2_neg).
start_(alice_is_paid_s63_d_2_neg,d2017_12_31).
amount_(alice_is_paid_s63_d_2_neg,33200).
s63_c_3(alice_s63_d_2_neg,1200,2017).

% Test
:- \+ s63_d_2(alice_s63_d_2_neg,1200,2017).
:- halt.
