% Text
% Alice has employed Bob from Jan 2nd, 2011 to Oct 10, 2019. On Oct 10, 2019 Bob was diagnosed as disabled and retired. Alice paid Bob $12980 because she had to terminate their contract due to Bob's disability, using the disability plan set up for all of Alice's employees.

% Question
% Section 3306(b)(10)(B) applies to the payment of $12980 that Alice made in 2019. Entailment

% Facts
person(alice_s3306_b_10_B_pos).
person(bob_s3306_b_10_B_pos).

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

service_(alice_employer_s3306_b_10_B_pos).
patient_(alice_employer_s3306_b_10_B_pos,alice_s3306_b_10_B_pos).
agent_(alice_employer_s3306_b_10_B_pos,bob_s3306_b_10_B_pos).
start_(alice_employer_s3306_b_10_B_pos,"2011-01-02").
end_(alice_employer_s3306_b_10_B_pos,"2019-10-10").
disability_(bob_is_disabled_s3306_b_10_B_pos).
agent_(bob_is_disabled_s3306_b_10_B_pos,bob_s3306_b_10_B_pos).
start_(bob_is_disabled_s3306_b_10_B_pos,"2019-10-10").
termination_(alice_lays_bob_off_s3306_b_10_B_pos).
agent_(alice_lays_bob_off_s3306_b_10_B_pos,alice_s3306_b_10_B_pos).
patient_(alice_lays_bob_off_s3306_b_10_B_pos,alice_employer_s3306_b_10_B_pos).
reason_(alice_lays_bob_off_s3306_b_10_B_pos,bob_is_disabled_s3306_b_10_B_pos).
retirement_(bob_retires_s3306_b_10_B_pos).
agent_(bob_retires_s3306_b_10_B_pos,bob_s3306_b_10_B_pos).
start_(bob_retires_s3306_b_10_B_pos,"2019-10-10").
reason_(bob_retires_s3306_b_10_B_pos,disability).
payment_(alice_pays_s3306_b_10_B_pos).
agent_(alice_pays_s3306_b_10_B_pos,alice_s3306_b_10_B_pos).
patient_(alice_pays_s3306_b_10_B_pos,bob_s3306_b_10_B_pos).
start_(alice_pays_s3306_b_10_B_pos,"2019-10-10").
purpose_(alice_pays_s3306_b_10_B_pos,alice_lays_bob_off_s3306_b_10_B_pos).
amount_(alice_pays_s3306_b_10_B_pos,12980).
means_(alice_pays_s3306_b_10_B_pos,disability_plan_s3306_b_10_B_pos).
plan_(disability_plan_s3306_b_10_B_pos).
agent_(disability_plan_s3306_b_10_B_pos,alice_s3306_b_10_B_pos).
purpose_(disability_plan_s3306_b_10_B_pos,"make provisions for employees or dependents").


% Test
:- s3306_b_10_B(alice_s3306_b_10_B_pos,alice_pays_s3306_b_10_B_pos,disability_plan_s3306_b_10_B_pos).
:- halt.
