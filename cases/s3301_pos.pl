% Text
% Alice is an employer under section 3306(a) for the year 2015 and 2016, and she has paid $453009 in total wages in 2015, and $443870 in 2016.

% Question
% Alice has to pay $27181 in excise tax for the year 2015 under section 3301. Entailment

% Facts
person(alice_s3301_pos).
finance(453009).
finance(443870).

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

s3306_a(alice_s3301_pos,Year) :- between(2015,2016,Year).
total_wages_employer(alice_s3301_pos,453009,_,_,d2015_01_01,"2015-12-31").
total_wages_employer(alice_s3301_pos,443870,_,_,d2016_01_01,"2016-12-31").

% Test
:- s3301(alice_s3301_pos,2015,_,_,_,27181).
:- halt.
