% Text
% Alice is an employer under section 3306(a) for the year 2015 and 2016, and she has paid $453009 in total wages in 2015, and $443870 in 2016.

% Question
% Alice has to pay $26362 in excise tax for the year 2016 under section 3301. Contradiction

% Facts
person(alice_s3301_neg).
finance(453009).
finance(443870).
finance(26362).


year(2015).
date(d2015_01_01).
date_split(d2015_01_01, 2015, 1, 1).
date(d2015_12_31).
date_split(d2015_12_31, 2015, 12, 31).

year(2016).
date(d2016_01_01).
date_split(d2016_01_01, 2016, 1, 1).
date(d2016_12_31).
date_split(d2016_12_31, 2016, 12, 31).

s3306_a(alice_s3301_neg,2015).
s3306_a(alice_s3301_neg,2016).
total_wages_employer(alice_s3301_neg,453009,alice_s3301_neg,service,d2015_01_01,d2015_12_31).
total_wages_employer(alice_s3301_neg,443870,alice_s3301_neg,service,d2016_01_01,d2016_12_31).

% Test
:- \+ s3301(alice_s3301_neg,2016,_,_,_,26362).
:- halt.
