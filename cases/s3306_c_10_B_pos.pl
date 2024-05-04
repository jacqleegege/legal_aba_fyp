% Text
% Alice was paid $200 in March 2017 for services performed at Johns Hopkins Hospital in March 2017. Alice was a patient at Johns Hopkins Hospital from March 15th, 2017 to April 2nd, 2017.

% Question
% Section 3306(c)(10)(B) applies to Alice's employment situation in 2017. Entailment

% Facts
person(alice).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).
date("2017-03-31").
date_split("2017-03-31", 2017, 3, 31).
date("2017-03-15").
date_split("2017-03-15", 2017, 3, 15).
date("2017-04-02").
date_split("2017-04-02", 2017, 4, 2).

location_name("baltimore").
location_name("maryland").
location_name("usa").

finance(200).

hospital_(hopkins_is_a_hospital).
agent_(hopkins_is_a_hospital,"johns hopkins hospital").
service_(alice_employed).
patient_(alice_employed,"johns hopkins hospital").
agent_(alice_employed,alice).
start_(alice_employed,"2017-03-15").
end_(alice_employed,"2017-03-31").
location_(alice_employed,"baltimore").
location_(alice_employed,"maryland").
location_(alice_employed,"usa").
payment_(alice_is_paid).
agent_(alice_is_paid,"johns hopkins hospital").
patient_(alice_is_paid,alice).
start_(alice_is_paid,"2017-03-31").
purpose_(alice_is_paid,alice_employed).
amount_(alice_is_paid,200).
medical_patient_(alice_goes_to_hopkins).
agent_(alice_goes_to_hopkins,alice).
patient_(alice_goes_to_hopkins,"johns hopkins hospital").
start_(alice_goes_to_hopkins,"2017-03-15").
end_(alice_goes_to_hopkins,"2017-04-02").

% Test
:- s3306_c_10_B(alice_employed,"johns hopkins hospital",alice,"2017-03-15").
:- halt.
