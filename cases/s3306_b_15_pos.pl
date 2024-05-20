% Text
% Alice employed Bob for agricultural labor from Feb 1st, 2011 to November 19th, 2019. On November 25th, Bob died from a heart attack. On January 20th, 2020, Alice paid Charlie, Bob's surviving spouse, Bob's outstanding wages of $1200.

% Question
% Section 3306(b)(15) applies to the payment that Alice made to Charlie in 2020. Entailment

% Facts
person(alice_s3306_b_15_pos).
person(bob_s3306_b_15_pos).
person(charlie_s3306_b_15_pos).

year(2011).
date(d2011_01_01).
date_split(d2011_01_01, 2011, 1, 1).
date(d2011_02_01).
date_split(d2011_02_01, 2011, 2, 1).
date(d2011_12_31).
date_split(d2011_12_31, 2011, 12, 31).

year(2019).
date(d2019_01_01).
date_split(d2019_01_01, 2019, 1, 1).
date(d2019_11_19).
date_split(d2019_11_19, 2019, 11, 19).
date(d2019_11_25).
date_split(d2019_11_25, 2019, 11, 25).
date(d2019_12_20).
date_split(d2019_12_20, 2019, 12, 20).
date(d2019_12_31).
date_split(d2019_12_31, 2019, 12, 31).

year(2020).
date(d2020_01_01).
date_split(d2020_01_01, 2020, 1, 1).
date(d2020_01_20).
date_split(d2020_01_20, 2020, 1, 20).
date(d2020_12_31).
date_split(d2020_12_31, 2020, 12, 31).

finance(1200).

s3306_c(alice_employer_s3306_b_15_pos,alice_s3306_b_15_pos,bob_s3306_b_15_pos,Day,Year) :-
    date_split(Day,Year,_,_),
    is_before(d2011_02_01,Day),
    is_before(Day,d2019_11_19).

purpose_(alice_employer_s3306_b_15_pos,"agricultural labor").
death_(bob_dies_s3306_b_15_pos).
agent_(bob_dies_s3306_b_15_pos,bob_s3306_b_15_pos).
start_(bob_dies_s3306_b_15_pos,d2019_11_25).
end_(bob_dies_s3306_b_15_pos,d2019_11_25).
marriage_(bob_and_charlie_s3306_b_15_pos).
agent_(bob_and_charlie_s3306_b_15_pos,bob_s3306_b_15_pos).
agent_(bob_and_charlie_s3306_b_15_pos,charlie_s3306_b_15_pos).
payment_(alice_pays_s3306_b_15_pos).
agent_(alice_pays_s3306_b_15_pos,alice_s3306_b_15_pos).
patient_(alice_pays_s3306_b_15_pos,charlie_s3306_b_15_pos).
start_(alice_pays_s3306_b_15_pos,d2020_01_20).
end_(alice_pays_s3306_b_15_pos,d2020_01_20).
purpose_(alice_pays_s3306_b_15_pos,alice_employer_s3306_b_15_pos).
amount_(alice_pays_s3306_b_15_pos,1200).

% Test
:- s3306_b_15(alice_pays_s3306_b_15_pos,alice_s3306_b_15_pos,charlie_s3306_b_15_pos,bob_s3306_b_15_pos,2020).
:- halt.
