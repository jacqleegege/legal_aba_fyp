% Text
% Alice employed Bob for agricultural labor from Feb 1st, 2011 to November 19th, 2019. On November 25th, Bob died from a heart attack. On December 20th, 2019, Alice paid Charlie, Bob's surviving spouse, Bob's outstanding wages of $1200.

% Question
% Section 3306(b)(15) applies to the payment that Alice made to Charlie in 2019. Contradiction

% Facts
person(alice_s3306_b_15_neg).
person(bob_s3306_b_15_neg).
person(charlie_s3306_b_15_neg).

year(2011).
date("2011-01-01").
date_split("2011-01-01", 2011, 1, 1).
date("2011-02-01").
date_split("2011-02-01", 2011, 2, 1).
date("2011-12-31").
date_split("2011-12-31", 2011, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-11-19").
date_split("2019-11-19", 2019, 11, 19).
date("2019-11-25").
date_split("2019-11-25", 2019, 11, 25).
date("2019-12-20").
date_split("2019-12-20", 2019, 12, 20).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).

finance(1200).

s3306_c(alice_employer_s3306_b_15_neg,alice_s3306_b_15_neg,bob_s3306_b_15_neg,Day,Year) :-
    date_split(Day,Year,_,_),
    is_before("2011-02-01",Day),
    is_before(Day,"2019-11-19").

purpose_(alice_employer_s3306_b_15_neg,"agricultural labor").
death_(bob_dies_s3306_b_15_neg).
agent_(bob_dies_s3306_b_15_neg,bob_s3306_b_15_neg).
start_(bob_dies_s3306_b_15_neg,"2019-11-25").
end_(bob_dies_s3306_b_15_neg,"2019-11-25").
marriage_(bob_and_charlie_s3306_b_15_neg).
agent_(bob_and_charlie_s3306_b_15_neg,bob_s3306_b_15_neg).
agent_(bob_and_charlie_s3306_b_15_neg,charlie_s3306_b_15_neg).
payment_(alice_pays_s3306_b_15_neg).
agent_(alice_pays_s3306_b_15_neg,alice_s3306_b_15_neg).
patient_(alice_pays_s3306_b_15_neg,charlie_s3306_b_15_neg).
start_(alice_pays_s3306_b_15_neg,"2019-12-20").
end_(alice_pays_s3306_b_15_neg,"2019-12-20").
purpose_(alice_pays_s3306_b_15_neg,alice_employer_s3306_b_15_neg).
amount_(alice_pays_s3306_b_15_neg,1200).

% Test
:- \+ s3306_b_15(alice_pays_s3306_b_15_neg,alice_s3306_b_15_neg,charlie_s3306_b_15_neg,bob_s3306_b_15_neg,2019).
:- halt.
