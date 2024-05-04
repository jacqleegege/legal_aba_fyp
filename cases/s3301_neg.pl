% Text
% Alice is an employer under section 3306(a) for the year 2015 and 2016, and she has paid $453009 in total wages in 2015, and $443870 in 2016.

% Question
% Alice has to pay $26362 in excise tax for the year 2016 under section 3301. Contradiction

% Facts
person(alice).
finance(453009).
finance(443870).


year(2015).
date("2015-01-01").
date_split("2015-01-01", 2015, 1, 1).
date("2015-12-31").
date_split("2015-12-31", 2015, 12, 31).

year(2016).
date("2016-01-01").
date_split("2016-01-01", 2016, 1, 1).
date("2016-12-31").
date_split("2016-12-31", 2016, 12, 31).

s3306_a(alice,2015).
s3306_a(alice,2016).
total_wages_employer(alice,453009,alice,service,"2015-01-01","2015-12-31").
total_wages_employer(alice,443870,alice,service,"2016-01-01","2016-12-31").

% Test
:- \+ s3301(alice,2016,_,_,_,26362).
:- halt.
