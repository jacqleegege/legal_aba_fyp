% Text
% From 1973 to 2019, the Walter Brown Family Trust II was considered to be a business trust.

% Question
% Section 63(c)(6)(D) applies to the Walter Brown Family Trust II for 1999. Entailment

% Facts
year(1973).
date("1973-01-01").
date_split("1973-01-01",1973,1,1).
date("1973-12-31").
date_split("1973-12-31",1973,12,31).
year(2019).
date("2019-01-01").
date_split("2019-01-01",2019,1,1).
date("2019-12-31").
date_split("2019-12-31",2019,12,31).
year(1999).
date("1999-01-01").
date_split("1999-01-01",1999,1,1).
date("1999-12-31").
date_split("1999-12-31",1999,12,31).

business_trust_(wbft_is_a_trust_s63_c_6_D_pos).
agent_(wbft_is_a_trust_s63_c_6_D_pos,"Walter Brown Family Trust II").
start_(wbft_is_a_trust_s63_c_6_D_pos,"1973-01-01").
end_(wbft_is_a_trust_s63_c_6_D_pos,"2019-12-31").

% Test
:- s63_c_6_D("Walter Brown Family Trust II",1999).
:- halt.
