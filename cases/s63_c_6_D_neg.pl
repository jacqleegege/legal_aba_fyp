% Text
% From 1973 to 2019, the Walter Brown Family Trust II was considered to be a business trust.

% Question
% Section 63(c)(6)(D) applies to the Walter Brown Family Trust II for 2021. Contradiction

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
year(2021).
date("2021-01-01").
date_split("2021-01-01",2021,1,1).
date("2021-12-31").
date_split("2021-12-31",2021,12,31).

business_trust_(wbft_is_a_trust).
agent_(wbft_is_a_trust,"Walter Brown Family Trust II").
start_(wbft_is_a_trust,"1973-01-01").
end_(wbft_is_a_trust,"2019-12-31").

% Test
:- \+ s63_c_6_D("Walter Brown Family Trust II",2021).
:- halt.
