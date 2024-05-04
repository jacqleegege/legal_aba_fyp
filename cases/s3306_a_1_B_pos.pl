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
person(alice).
person(bob).

year(2017).
date("2017-01-24").
date_split("2017-01-24", 2017, 1, 24).
date("2017-02-04").
date_split("2017-02-04", 2017, 2, 4).
date("2017-03-03").
date_split("2017-03-03", 2017, 3, 3).
date("2017-03-19").
date_split("2017-03-19", 2017, 3, 19).
date("2017-04-02").
date_split("2017-04-02", 2017, 4, 2).
date("2017-05-09").
date_split("2017-05-09", 2017, 5, 9).
date("2017-10-15").
date_split("2017-10-15", 2017, 10, 15).
date("2017-10-25").
date_split("2017-10-25", 2017, 10, 25).
date("2017-11-08").
date_split("2017-11-08", 2017, 11, 8).
date("2017-11-22").
date_split("2017-11-22", 2017, 11, 22).
date("2017-12-01").
date_split("2017-12-01", 2017, 12, 1).
date("2017-12-03").
date_split("2017-12-03", 2017, 12, 3).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).

s3306_c("alice_employer_2017-01-24", alice, bob, "2017-01-24", 2017).
s3306_c("alice_employer_2017-02-04", alice, bob, "2017-02-04", 2017).
s3306_c("alice_employer_2017-03-03", alice, bob, "2017-03-03", 2017).
s3306_c("alice_employer_2017-03-19", alice, bob, "2017-03-19", 2017).
s3306_c("alice_employer_2017-04-02", alice, bob, "2017-04-02", 2017).
s3306_c("alice_employer_2017-05-09", alice, bob, "2017-05-09", 2017).
s3306_c("alice_employer_2017-10-15", alice, bob, "2017-10-15", 2017).
s3306_c("alice_employer_2017-10-25", alice, bob, "2017-10-25", 2017).
s3306_c("alice_employer_2017-11-08", alice, bob, "2017-11-08", 2017).
s3306_c("alice_employer_2017-11-22", alice, bob, "2017-11-22", 2017).
s3306_c("alice_employer_2017-12-01", alice, bob, "2017-12-01", 2017).
s3306_c("alice_employer_2017-12-03", alice, bob, "2017-12-03", 2017).

% s3306_c(Employment_event,alice,bob,Day,_) :-
%     member(Day, ["2017-01-24", "2017-02-04", "2017-03-03", "2017-03-19","2017-04-02","2017-05-09","2017-10-15","2017-10-25","2017-11-08","2017-11-22","2017-12-01","2017-12-03"]),
%     atom_concat("alice_employer_",Day,Employment_event).

% Test
:- s3306_a_1_B(alice,2017).
:- halt.
