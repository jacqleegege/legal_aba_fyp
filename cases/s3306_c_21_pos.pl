% Text
% Alice was paid $200 in 2017 for services performed in jail. Alice was committed to jail from January 24, 2015 to May 5th, 2019.

% Question
% Section 3306(c)(21) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_21_pos).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-01-24").
date_split("2015-01-24", 2015, 1, 24).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-05-05").
date_split("2019-05-05", 2019, 5, 5).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

finance(200).

service_(alice_employed_s3306_c_21_pos).
patient_(alice_employed_s3306_c_21_pos,jail_s3306_c_21_pos).
agent_(alice_employed_s3306_c_21_pos,alice_s3306_c_21_pos).
start_(alice_employed_s3306_c_21_pos,"2017-01-01").
end_(alice_employed_s3306_c_21_pos,"2017-12-31").
payment_(alice_is_paid_s3306_c_21_pos).
agent_(alice_is_paid_s3306_c_21_pos,jail_s3306_c_21_pos).
patient_(alice_is_paid_s3306_c_21_pos,alice_s3306_c_21_pos).
start_(alice_is_paid_s3306_c_21_pos,"2017-12-31").
purpose_(alice_is_paid_s3306_c_21_pos,alice_employed_s3306_c_21_pos).
amount_(alice_is_paid_s3306_c_21_pos,200).
penal_institution_(jail_is_a_penal_institution_s3306_c_21_pos).
agent_(jail_is_a_penal_institution_s3306_c_21_pos,jail_s3306_c_21_pos).
incarceration_(alice_goes_to_jail_s3306_c_21_pos).
agent_(alice_goes_to_jail_s3306_c_21_pos,alice_s3306_c_21_pos).
patient_(alice_goes_to_jail_s3306_c_21_pos,jail_s3306_c_21_pos).
start_(alice_goes_to_jail_s3306_c_21_pos,"2015-01-24").
end_(alice_goes_to_jail_s3306_c_21_pos,"2019-05-05").

% Test
:- s3306_c_21(alice_employed_s3306_c_21_pos,alice_s3306_c_21_pos,jail_s3306_c_21_pos,"2017-01-01").
:- halt.
