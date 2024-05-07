% Text
% Alice has employed Bob, Cameron, Dan, Emily, Fred and George for agricultural labor on various occasions during the year 2017:
% - Jan 24: B, C, D, E and F
% - Feb 4: B, C and F
% - Mar 3: B, C, D, E and F
% - Mar 19: C, D, E, F and G
% - Apr 2: B, C, D, F and G
% - May 9: C, D, E, F and G
% - Oct 15: B, C, D, E and G
% - Oct 25: B, E, F and G
% - Nov 8: B, C, E, F and G
% - Nov 22: B, C, D, E and F
% - Dec 1: B, C, D, E and G
% - Dec 3: B, C, D, E and G

% Question
% Section 3306(a)(2)(B) applies to Alice for the year 2017. Contradiction

% Facts
person(alice_s3306_a_2_B_neg).
person(bob_s3306_a_2_B_neg).
person(cameron_s3306_a_2_B_neg).
person(dan_s3306_a_2_B_neg).
person(emily_s3306_a_2_B_neg).
person(fred_s3306_a_2_B_neg).
person(george_s3306_a_2_B_neg).

year(2017).
date("2017-01-01").
date_split("2017-01-01", 2017, 1, 1).
date("2017-12-31").
date_split("2017-12-31", 2017, 12, 31).
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

s3306_c(alice_employer_2017-s3306_a_2_B_neg01-24,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-01-24",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg01-24,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-01-24",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg01-24,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-01-24",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg01-24,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-01-24",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg01-24,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-01-24",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg02-04,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-02-04",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg02-04,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-02-04",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg02-04,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-02-04",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg03-03,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-03-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-03,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-03-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-03,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-03-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-03,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-03-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-03,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-03-03",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg03-19,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-03-19",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-19,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-03-19",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-19,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-03-19",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-19,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-03-19",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg03-19,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-03-19",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg04-02,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-04-02",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg04-02,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-04-02",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg04-02,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-04-02",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg04-02,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-04-02",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg04-02,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-04-02",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg05-09,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-05-09",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg05-09,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-05-09",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg05-09,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-05-09",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg05-09,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-05-09",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg05-09,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-05-09",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg10-15,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-10-15",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-15,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-10-15",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-15,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-10-15",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-15,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-10-15",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-15,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-10-15",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg10-25,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-10-25",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-25,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-10-25",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-25,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-10-25",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg10-25,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-10-25",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg11-08,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-11-08",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-08,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-11-08",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-08,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-11-08",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-08,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-11-08",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-08,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-11-08",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg11-22,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-11-22",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-22,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-11-22",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-22,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-11-22",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-22,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-11-22",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg11-22,alice_s3306_a_2_B_neg,fred_s3306_a_2_B_neg,"2017-11-22",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg12-01,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-12-01",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-01,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-12-01",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-01,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-12-01",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-01,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-12-01",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-01,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-12-01",2017).

s3306_c(alice_employer_2017-s3306_a_2_B_neg12-03,alice_s3306_a_2_B_neg,bob_s3306_a_2_B_neg,"2017-12-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-03,alice_s3306_a_2_B_neg,cameron_s3306_a_2_B_neg,"2017-12-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-03,alice_s3306_a_2_B_neg,dan_s3306_a_2_B_neg,"2017-12-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-03,alice_s3306_a_2_B_neg,emily_s3306_a_2_B_neg,"2017-12-03",2017).
s3306_c(alice_employer_2017-s3306_a_2_B_neg12-03,alice_s3306_a_2_B_neg,george_s3306_a_2_B_neg,"2017-12-03",2017).

% s3306_c(Service_event,alice,Employee,Day,_) :-
%     member(Day, ["2017-01-24","2017-02-04","2017-03-03","2017-03-19","2017-04-02","2017-05-09","2017-10-15","2017-10-25","2017-11-08","2017-11-22","2017-12-01","2017-12-03"]),
%     (
%         (
%             Day == "2017-01-24",
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == "2017-02-04",
%             member(Employee, [bob,cameron,fred])
%         );
%         (
%             Day == "2017-03-03",
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == "2017-03-19",
%             member(Employee, [cameron,dan,emily,fred,george])
%         );
%         (
%             Day == "2017-04-02",
%             member(Employee, [bob,cameron,dan,fred,george])
%         );
%         (
%             Day == "2017-05-09",
%             member(Employee, [cameron,dan,emily,fred,george])
%         );
%         (
%             Day == "2017-10-15",
%             member(Employee, [bob,cameron,dan,emily,george])
%         );
%         (
%             Day == "2017-10-25",
%             member(Employee, [bob,emily,fred,george])
%         );
%         (
%             Day == "2017-11-08",
%             member(Employee, [bob,cameron,emily,fred,george])
%         );
%         (
%             Day == "2017-11-22",
%             member(Employee, [bob,cameron,dan,emily,fred])
%         );
%         (
%             Day == "2017-12-01",
%             member(Employee, [bob,cameron,dan,emily,george])
%         );
%         (
%             Day == "2017-12-03",
%             member(Employee, [bob,cameron,dan,emily,george])
%         )
%     ),
%     atom_concat("alice_employer_",Day,Service_event).
purpose_(alice_employer_2017-s3306_a_2_B_neg01-24,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg02-04,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg03-03,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg03-19,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg04-02,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg05-09,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg10-15,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg10-25,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg11-08,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg11-22,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg12-01,"agricultural labor").
purpose_(alice_employer_2017-s3306_a_2_B_neg12-03,"agricultural labor").% all that's mentioned here is agricultural labor

% Test
:- \+ s3306_a_2_B(alice_s3306_a_2_B_neg,2017).
:- halt.
