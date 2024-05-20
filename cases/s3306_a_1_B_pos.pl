% Text
% Alice has employed Bob on various occasions during the year 2017:
% - Jan 24
% - Feb 4
% - Mar 3
% - Mar 19
% - Apr 2
% - May 9
% - Oct 15
% - Oct 25
% - Nov 8
% - Nov 22
% - Dec 1
% - Dec 3

% Question
% Section 3306(a)(1)(B) applies to Alice for the year 2017. Entailment

% Facts
person(alice_s3306_a_1_B_pos).
person(bob_s3306_a_1_B_pos).

year(2017).
date(d2017_01_24).
date_split(d2017_01_24, 2017, 1, 24).
date(d2017_02_04).
date_split(d2017_02_04, 2017, 2, 4).
date(d2017_03_03).
date_split(d2017_03_03, 2017, 3, 3).
date(d2017_03_19).
date_split(d2017_03_19, 2017, 3, 19).
date(d2017_04_02).
date_split(d2017_04_02, 2017, 4, 2).
date(d2017_05_09).
date_split(d2017_05_09, 2017, 5, 9).
date(d2017_10_15).
date_split(d2017_10_15, 2017, 10, 15).
date(d2017_10_25).
date_split(d2017_10_25, 2017, 10, 25).
date(d2017_11_08).
date_split(d2017_11_08, 2017, 11, 8).
date(d2017_11_22).
date_split(d2017_11_22, 2017, 11, 22).
date(d2017_12_01).
date_split(d2017_12_01, 2017, 12, 1).
date(d2017_12_03).
date_split(d2017_12_03, 2017, 12, 3).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).

s3306_c("alice_employer_2017-s3306_a_1_B_pos01-24", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_01_24, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos02-04", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_02_04, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos03-03", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_03_03, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos03-19", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_03_19, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos04-02", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_04_02, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos05-09", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_05_09, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos10-15", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_10_15, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos10-25", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_10_25, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos11-08", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_11_08, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos11-22", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_11_22, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos12-01", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_12_01, 2017).
s3306_c("alice_employer_2017-s3306_a_1_B_pos12-03", alice_s3306_a_1_B_pos, bob_s3306_a_1_B_pos, d2017_12_03, 2017).

% s3306_c(Employment_event,alice,bob,Day,_) :-
%     member(Day, [d2017_01_24, "2017-02-04", "2017-03-03", "2017-03-19","2017-04-02","2017-05-09","2017-10-15","2017-10-25","2017-11-08","2017-11-22","2017-12-01","2017-12-03"]),
%     atom_concat("alice_employer_",Day,Employment_event).

% Test
:- s3306_a_1_B(alice_s3306_a_1_B_pos,2017).
:- halt.
