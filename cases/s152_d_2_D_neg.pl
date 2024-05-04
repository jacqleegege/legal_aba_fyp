% Text
% Charlie is Alice's father since April 15th, 2014. Bob is Charlie's brother since October 12th, 1992.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(D) for the year 2018. Contradiction

% Facts
person(alice).
person(bob).
person(charlie).

year(1992).
date("1992-10-12").
date_split("1992-10-12", 1992, 10, 12).
date("1992-01-01").
date_split("1992-01-01", 1992, 1, 1).
date("1992-12-31").
date_split("1992-12-31", 1992, 12, 31).

year(2014).
date("2014-04-15").
date_split("2014-04-15", 2014, 4, 15).
date("2014-01-01").
date_split("2014-01-01", 2014, 1, 1).
date("2014-12-31").
date_split("2014-12-31", 2014, 12, 31).

year(2018).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

father_(alice_and_bob).
agent_(alice_and_bob,bob).
patient_(alice_and_bob,alice).
start_(alice_and_bob,"2014-04-15").
brother_(bob_and_charlie).
agent_(bob_and_charlie,bob).
patient_(bob_and_charlie,charlie).
start_(bob_and_charlie,"1992-10-12").
% neg_s152_d_2_D():-
%     s152_d_2_D(alice,bob,Start_relationship,End_relationship),
%     first_day_year(2018,First_day),
%     is_before(Start_relationship,First_day).

% Test
:- \+ s152_d_2_D(alice,bob,"2014-04-15","2100-01-01").
:- halt.