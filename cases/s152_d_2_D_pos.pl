% Text
% Charlie is Bob's father since April 15th, 1995. Dorothy is Bob's mother. Alice married Charlie on August 8th, 2018.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(D) for the year 2019. Entailment

% Facts
person(alice_s152_d_2_D_pos).
person(bob_s152_d_2_D_pos).
person(charlie_s152_d_2_D_pos).
person(dorothy_s152_d_2_D_pos).

year(1995).
date("1995-04-15").
date_split("1995-04-15", 1995, 4, 15).
date("1995-01-01").
date_split("1995-01-01", 1995, 1, 1).
date("1995-12-31").
date_split("1995-12-31", 1995, 12, 31).

year(2018).
date("2018-08-08").
date_split("2018-08-08", 2018, 8, 8).
date("2018-01-01").
date_split("2018-01-01", 2018, 1, 1).
date("2018-12-31").
date_split("2018-12-31", 2018, 12, 31).

year(2019).
date("2019-01-01").
date_split("2019-01-01", 2019, 1, 1).
date("2019-12-31").
date_split("2019-12-31", 2019, 12, 31).
date("2100-01-01").
date_split("2100-01-01", 2100, 1, 1).

father_(charlie_and_bob_s152_d_2_D_pos).
agent_(charlie_and_bob_s152_d_2_D_pos,charlie_s152_d_2_D_pos).
patient_(charlie_and_bob_s152_d_2_D_pos,bob_s152_d_2_D_pos).
start_(charlie_and_bob_s152_d_2_D_pos,"1995-04-15").
mother_(dorothy_and_bob_s152_d_2_D_pos).
agent_(dorothy_and_bob_s152_d_2_D_pos,dorothy_s152_d_2_D_pos).
patient_(dorothy_and_bob_s152_d_2_D_pos,bob_s152_d_2_D_pos).
start_(dorothy_and_bob_s152_d_2_D_pos,"1995-04-15").
marriage_(alice_and_charlie_s152_d_2_D_pos).
agent_(alice_and_charlie_s152_d_2_D_pos,alice_s152_d_2_D_pos).
agent_(alice_and_charlie_s152_d_2_D_pos,charlie_s152_d_2_D_pos).
start_(alice_and_charlie_s152_d_2_D_pos,"2018-08-08").
% pos_s152_d_2_D():-
%     s152_d_2_D(alice,bob,Start_relationship,End_relationship),
%     first_day_year(2019,First_day),
%     is_before(Start_relationship,First_day).

% Test
:- s152_d_2_D(alice_s152_d_2_D_pos,bob_s152_d_2_D_pos,"2018-08-08","2100-01-01").
:- halt.
