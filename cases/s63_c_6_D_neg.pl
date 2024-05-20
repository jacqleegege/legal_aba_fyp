% Text
% From 1973 to 2019, the Walter Brown Family Trust II was considered to be a business trust.

% Question
% Section 63(c)(6)(D) applies to the Walter Brown Family Trust II for 2021. Contradiction

% Facts
year(1973).
date(d1973_01_01).
date_split(d1973_01_01,1973,1,1).
date(d1973_12_31).
date_split(d1973_12_31,1973,12,31).
year(2019).
date(d2019_01_01).
date_split(d2019_01_01,2019,1,1).
date(d2019_12_31).
date_split(d2019_12_31,2019,12,31).
year(2021).
date(d2021_01_01).
date_split(d2021_01_01,2021,1,1).
date(d2021_12_31).
date_split(d2021_12_31,2021,12,31).

business_trust_(wbft_is_a_trust_s63_c_6_D_neg).
agent_(wbft_is_a_trust_s63_c_6_D_neg,"Walter Brown Family Trust II").
start_(wbft_is_a_trust_s63_c_6_D_neg,d1973_01_01).
end_(wbft_is_a_trust_s63_c_6_D_neg,d2019_12_31).

% Test
:- \+ s63_c_6_D("Walter Brown Family Trust II",2021).
:- halt.
