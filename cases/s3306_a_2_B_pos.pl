% Text
% Alice has employed Bob, Cameron, Dan, Emily, Fred and George for agricultural labor on various occasions during the year 2017:
% - Jan 24: B, C, D, E and F
% - Feb 4: B, C, D, E and F
% - Mar 3: B, C, D, E and F
% - Mar 19: C, D, E, F and G
% - Apr 2: B, C, D, F and G
% - May 9: C, D, E, F and G
% - Oct 15: B, C, D, E and G
% - Oct 25: B, C, D, E, F and G
% - Nov 8: B, C, E, F and G
% - Nov 22: B, C, D, E and F
% - Dec 1: B, C, D, E and G
% - Dec 3: B, C, D, E and G

% Question
% Section 3306(a)(2)(B) applies to Alice for the year 2017. Entailment

% Facts
person(alice_s3306_a_2_B_pos).
person(bob_s3306_a_2_B_pos).
person(cameron_s3306_a_2_B_pos).
person(dan_s3306_a_2_B_pos).
person(emily_s3306_a_2_B_pos).
person(fred_s3306_a_2_B_pos).
person(george_s3306_a_2_B_pos).

year(2017).
date(d2017_01_01).
date_split(d2017_01_01, 2017, 1, 1).
date(d2017_12_31).
date_split(d2017_12_31, 2017, 12, 31).
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


s3306_c(alice_employer_2017-s3306_a_2_B_pos01-24,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_01_24,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos01-24,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_01_24,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos01-24,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_01_24,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos01-24,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_01_24,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos01-24,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_01_24,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos02-04,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_02_04,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos02-04,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_02_04,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos02-04,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_02_04,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos02-04,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_02_04,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos02-04,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_02_04,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos03-03,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_03_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-03,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_03_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-03,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_03_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-03,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_03_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-03,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_03_03,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos03-19,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_03_19,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-19,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_03_19,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-19,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_03_19,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-19,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_03_19,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos03-19,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_03_19,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos04-02,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_04_02,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos04-02,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_04_02,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos04-02,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_04_02,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos04-02,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_04_02,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos04-02,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_04_02,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos05-09,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_05_09,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos05-09,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_05_09,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos05-09,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_05_09,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos05-09,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_05_09,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos05-09,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_05_09,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos10-15,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_10_15,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-15,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_10_15,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-15,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_10_15,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-15,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_10_15,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-15,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_10_15,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_10_25,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_10_25,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_10_25,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_10_25,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_10_25,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos10-25,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_10_25,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos11-08,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_11_08,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-08,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_11_08,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-08,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_11_08,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-08,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_11_08,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-08,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_11_08,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos11-22,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_11_22,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-22,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_11_22,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-22,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_11_22,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-22,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_11_22,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos11-22,alice_s3306_a_2_B_pos,fred_s3306_a_2_B_pos,d2017_11_22,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos12-01,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_12_01,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-01,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_12_01,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-01,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_12_01,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-01,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_12_01,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-01,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_12_01,2017).

s3306_c(alice_employer_2017-s3306_a_2_B_pos12-03,alice_s3306_a_2_B_pos,bob_s3306_a_2_B_pos,d2017_12_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-03,alice_s3306_a_2_B_pos,cameron_s3306_a_2_B_pos,d2017_12_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-03,alice_s3306_a_2_B_pos,dan_s3306_a_2_B_pos,d2017_12_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-03,alice_s3306_a_2_B_pos,emily_s3306_a_2_B_pos,d2017_12_03,2017).
s3306_c(alice_employer_2017-s3306_a_2_B_pos12-03,alice_s3306_a_2_B_pos,george_s3306_a_2_B_pos,d2017_12_03,2017).

% s3306_c(Service_event,alice,Employee,Day,_) :-
%     member(Day, [d2017_01_24,"2017-02-04","2017-03-03","2017-03-19","2017-04-02","2017-05-09","2017-10-15","2017-10-25","2017-11-08","2017-11-22","2017-12-01","2017-12-03"]),
%     (
%         (
%             Day == d2017_01_24,
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == d2017_02_04,
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == d2017_03_03,
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == d2017_03_19,
%             member(Employee, [cameron,dan,emily,fred,george])
%         );
%         (
%             Day == d2017_04_02,
%             member(Employee, [bob,cameron,dan,fred,george])
%         );
%         (
%             Day == d2017_05_09,
%             member(Employee, [cameron,dan,emily,fred,george])
%         );
%         (
%             Day == d2017_10_15,
%             member(Employee, [bob,cameron,dan,emily,george])
%         );
%         (
%             Day == d2017_10_25,
%             member(Employee, [bob,cameron,dan,emily,fred,george])
%         );
%         (
%             Day == d2017_11_08,
%             member(Employee, [bob,cameron,emily,fred,george])
%         );
%         (
%             Day == d2017_11_22,
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == d2017_12_01,
%             member(Employee, [bob,cameron,dan,emily,george])
%         );
%         (
%             Day == d2017_12_03,
%             member(Employee, [bob,cameron,dan,emily,george])
%         )
%     ),
%     atom_concat("alice_employer_",Day,Service_event).
purpose_(alice_employer_2017-s3306_a_2_B_pos01-24,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos02-04,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos03-03,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos03-19,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos04-02,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos05-09,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos10-15,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos10-25,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos11-08,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos11-22,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos12-01,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_pos12-03,"agricultural labor"). % all that's mentioned here is agricultural labor

% Test
:- s3306_a_2_B(alice_s3306_a_2_B_pos,2017).
:- halt.
