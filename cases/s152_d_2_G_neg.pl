% Text
% Alice and Bob started living together on April 15th, 2014. Alice and Bob are not related, nor do they have relatives married to one another.

% Question
% Alice bears a relationship to Bob under section 152(d)(2)(G) for the year 2018. Contradiction

% Facts
person(alice_s152_d_2_G_neg).
person(bob_s152_d_2_G_neg).

year(2014).
date(d2014_04_15).
date_split(d2014_04_15, 2014, 4, 15).
date(d2014_01_01).
date_split(d2014_01_01, 2014, 1, 1).
date(d2014_12_31).
date_split(d2014_12_31, 2014, 12, 31).

year(2100).
date(d2100_01_01).
date_split(d2100_01_01, 2100, 1, 1).

residence_(alice_and_bob_s152_d_2_G_neg).
agent_(alice_and_bob_s152_d_2_G_neg,alice_s152_d_2_G_neg).
agent_(alice_and_bob_s152_d_2_G_neg,bob_s152_d_2_G_neg).
start_(alice_and_bob_s152_d_2_G_neg,d2014_04_15).
patient_(alice_and_bob_s152_d_2_G_neg,home_s152_d_2_G_neg).

% Test
:- \+ s152_d_2_G(alice_s152_d_2_G_neg,bob_s152_d_2_G_neg,d2014_04_15,"2100-01-01").
:- halt.
