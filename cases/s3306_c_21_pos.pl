% Text
% Alice was paid $200 in 2017 for services performed in jail. Alice was committed to jail from January 24, 2015 to May 5th, 2019.

% Question
% Section 3306(c)(21) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice_s3306_c_21_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_01_24).
date_split(d2015_01_24, 2015, 1, 24).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_05_05).
date_split(d2019_05_05, 2019, 5, 5).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

finance(200).

service_(alice_employed_s3306_c_21_pos).
patient_(alice_employed_s3306_c_21_pos,jail_s3306_c_21_pos).
agent_(alice_employed_s3306_c_21_pos,alice_s3306_c_21_pos).
start_(alice_employed_s3306_c_21_pos,d2017_01_01).
end_(alice_employed_s3306_c_21_pos,d2017_12_31).
payment_(alice_is_paid_s3306_c_21_pos).
agent_(alice_is_paid_s3306_c_21_pos,jail_s3306_c_21_pos).
patient_(alice_is_paid_s3306_c_21_pos,alice_s3306_c_21_pos).
start_(alice_is_paid_s3306_c_21_pos,d2017_12_31).
purpose_(alice_is_paid_s3306_c_21_pos,alice_employed_s3306_c_21_pos).
amount_(alice_is_paid_s3306_c_21_pos,200).
penal_institution_(jail_is_a_penal_institution_s3306_c_21_pos).
agent_(jail_is_a_penal_institution_s3306_c_21_pos,jail_s3306_c_21_pos).
incarceration_(alice_goes_to_jail_s3306_c_21_pos).
agent_(alice_goes_to_jail_s3306_c_21_pos,alice_s3306_c_21_pos).
patient_(alice_goes_to_jail_s3306_c_21_pos,jail_s3306_c_21_pos).
start_(alice_goes_to_jail_s3306_c_21_pos,d2015_01_24).
end_(alice_goes_to_jail_s3306_c_21_pos,d2019_05_05).

% Test
:- s3306_c_21(alice_employed_s3306_c_21_pos,alice_s3306_c_21_pos,jail_s3306_c_21_pos,d2017_01_01).
:- halt.
