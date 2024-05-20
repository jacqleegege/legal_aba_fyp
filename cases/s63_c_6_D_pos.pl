% Text
% From 1973 to 2019, the Walter Brown Family Trust II was considered to be a business trust.

% Question
% Section 63(c)(6)(D) applies to the Walter Brown Family Trust II for 1999. Entailment

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
year(1999).
date(d1999_01_01).
date_split(d1999_01_01,1999,1,1).
date(d1999_12_31).
date_split(d1999_12_31,1999,12,31).

business_trust_(wbft_is_a_trust_s63_c_6_D_pos).
agent_(wbft_is_a_trust_s63_c_6_D_pos,"Walter Brown Family Trust II").
start_(wbft_is_a_trust_s63_c_6_D_pos,d1973_01_01).
end_(wbft_is_a_trust_s63_c_6_D_pos,d2019_12_31).

% Test
:- s63_c_6_D("Walter Brown Family Trust II",1999).
:- halt.
