%§3301. Rate of tax

%There is hereby imposed on every employer (as defined in section 3306(a)) for each calendar year an excise tax, with respect to having individuals in his employ, equal to 6 percent of the total wages (as defined in section 3306(b)) paid by such employer during the calendar year with respect to employment (as defined in section 3306(c)).
s3301(Employer,Caly,Wages,Employee,Employment,Tax) :-
    first_day_year(Caly,First_day_year),
    last_day_year(Caly,Last_day_year),
    s3306_a(Employer,Caly),
    total_wages_employer(Employer,Wages,Employee,Employment,First_day_year,Last_day_year),
    Tax = 6/100*Wages.

total_wages_employer(Employer,Total_wages,Individual,Service,Start_day,End_day) :-
    % some individual's wage is the sum of that person's wages, capped at $7000 (as per §3301(b)(1))
    person(Employer),person(Individual),service_(Service),date(Start_day),date(End_day),
    Total_wages = #sum{Total_wage,Individual:
        sum_wages_individual(Individual,Remuneration,Service,Employer,Start_day,End_day,Wage_sum),
        s3306_b_1(Wage_sum,Total_wage)}.

sum_wages_individual(Individual,Remuneration,Service,Employer,Start_day,End_day,Total_wages):-
    person(Employer),person(Individual),finance(Remuneration),finance(Remuneration),
    service_(Service),date(Start_day),date(End_day),
    Total_wages = #sum{Wages,Service,Remuneration : 
    s3306_b(Wages,Remuneration,Service,Employer,Individual,Employer,_,_),
    start_(Remuneration,Remuneration_time),
    is_before(Start_day,Remuneration_time),
    is_before(Remuneration_time,End_day)}.

