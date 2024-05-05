% Text
% In 2017, Alice was paid $33200. Alice was born March 2nd, 1950 and Bob was born March 3rd, 1955.

% Question
% Under section 63(f)(3), Alice's additional standard deduction in 2017 is equal to $750. Entailment

% Facts
person(alice_s63_f_3_pos).
person(bob_s63_f_3_pos).
finance(33200).
finance(750).

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

year(2017).
date("2017-02-03").
date_split("2017-02-03", 2017, 2, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

payment_(alice_is_paid_s63_f_3_pos).
patient_(alice_is_paid_s63_f_3_pos,alice_s63_f_3_pos).
start_(alice_is_paid_s63_f_3_pos,"2017-12-31").
amount_(alice_is_paid_s63_f_3_pos,33200).
birth_(alice_is_born_s63_f_3_pos).
agent_(alice_is_born_s63_f_3_pos,alice_s63_f_3_pos).
start_(alice_is_born_s63_f_3_pos,"1950-03-02").
end_(alice_is_born_s63_f_3_pos,"1950-03-02").
birth_(bob_is_born_s63_f_3_pos).
agent_(bob_is_born_s63_f_3_pos,bob_s63_f_3_pos).
start_(bob_is_born_s63_f_3_pos,"1955-03-03").
end_(bob_is_born_s63_f_3_pos,"1955-03-03").

% Test
:- s63_f_3(alice_s63_f_3_pos,2017,750).
:- halt.
