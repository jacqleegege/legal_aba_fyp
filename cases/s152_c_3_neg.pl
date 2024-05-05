% Text
% Alice was born January 10th, 1992. Bob was born January 31st, 1984. Alice adopted Bob on March 4th, 2018.

% Question
% Bob satisfies section 152(c)(3) with Alice claiming Bob as a qualifying child for the year 2019. Contradiction

% Facts
person(alice_s152_c_3_neg).
person(bob_s152_c_3_neg).

year(1992).
date("1992-01-10").
date_split("1992-01-10", 1992, 1, 10).
date("1992-01-01").
date_split("1992-01-01", 1992, 1, 1).
date("1992-12-31").
date_split("1992-12-31", 1992, 12, 31).

year(1984).
date("1984-01-31").
date_split("1984-01-31", 1984, 1, 31).
date("1984-01-01").
date_split("1984-01-01", 1984, 1, 1).
date("1984-12-31").
date_split("1984-12-31", 1984, 12, 31).

year(2018).
date("2018-03-04").
date_split("2018-03-04", 2018, 3, 4).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

birth_(alice_is_born_s152_c_3_neg).
agent_(alice_is_born_s152_c_3_neg,alice_s152_c_3_neg).
start_(alice_is_born_s152_c_3_neg,"1992-01-10").
end_(alice_is_born_s152_c_3_neg,"1992-01-10").
birth_(bob_is_born_s152_c_3_neg).
agent_(bob_is_born_s152_c_3_neg,bob_s152_c_3_neg).
start_(bob_is_born_s152_c_3_neg,"1984-01-31").
end_(bob_is_born_s152_c_3_neg,"1984-01-31").
son_(alice_and_bob_s152_c_3_neg).
agent_(alice_and_bob_s152_c_3_neg,bob_s152_c_3_neg).
patient_(alice_and_bob_s152_c_3_neg,alice_s152_c_3_neg).
start_(alice_and_bob_s152_c_3_neg,"2018-03-04").

% Test
:- \+ s152_c_3(bob_s152_c_3_neg,alice_s152_c_3_neg,2019).
:- halt.
