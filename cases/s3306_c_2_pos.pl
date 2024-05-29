% Text
% Alice has paid wages of $300 to Bob for domestic service done from Feb 1st, 2017 to Sep 2nd, 2017, in Baltimore, Maryland, USA.

% Question
% Section 3306(c)(2) applies to Alice employing Bob for the year 2017. Entailment

% Facts
person(alice_s3306_c_2_pos).
person(bob_s3306_c_2_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_02_01).
date_split(d2017_02_01, 2017, 2, 1).
date(d2017_09_02).
date_split(d2017_09_02, 2017, 9, 2).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

location_name(baltimore).
location_name(maryland).
location_name(usa).
location_name(private_home_s3306_c_2_pos).

finance(300).

service_(alice_employer_s3306_c_2_pos).
patient_(alice_employer_s3306_c_2_pos,alice_s3306_c_2_pos).
agent_(alice_employer_s3306_c_2_pos,bob_s3306_c_2_pos).
start_(alice_employer_s3306_c_2_pos,d2017_02_01).
end_(alice_employer_s3306_c_2_pos,d2017_09_02).
location_(alice_employer_s3306_c_2_pos,baltimore).
location_(alice_employer_s3306_c_2_pos,maryland).
location_(alice_employer_s3306_c_2_pos,usa).
purpose_(alice_employer_s3306_c_2_pos,domestic_service).
location_(alice_employer_s3306_c_2_pos,private_home_s3306_c_2_pos).
payment_(alice_pays_s3306_c_2_pos).
agent_(alice_pays_s3306_c_2_pos,alice_s3306_c_2_pos).
patient_(alice_pays_s3306_c_2_pos,bob_s3306_c_2_pos).
start_(alice_pays_s3306_c_2_pos,d2017_09_02).
purpose_(alice_pays_s3306_c_2_pos,alice_employer_s3306_c_2_pos).
amount_(alice_pays_s3306_c_2_pos,300).
s3306_b(300,alice_pays_s3306_c_2_pos,alice_employer_s3306_c_2_pos,alice_s3306_c_2_pos,bob_s3306_c_2_pos,alice_s3306_c_2_pos,bob_s3306_c_2_pos,cash).

% Test
% :- s3306_c_2(alice_employer_s3306_c_2_pos,_,2017).
:- s3306_c_2(alice_employer_s3306_c_2_pos,baltimore,2017).
:- s3306_c_2(alice_employer_s3306_c_2_pos,maryland,2017).
:- s3306_c_2(alice_employer_s3306_c_2_pos,usa,2017).
:- s3306_c_2(alice_employer_s3306_c_2_pos,private_home_s3306_c_2_pos,2017).
:- halt.
