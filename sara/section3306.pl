min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 >= Val2, Result = Val2.
min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val1.

%§3306. Definitions

%(a) Employer
s3306_a(Employer,Caly) :-
	s3306_a_1(Employer,Caly).
s3306_a(Employer,Caly) :-
	s3306_a_2(Employer,Caly).
s3306_a(Employer,Caly) :-
	s3306_a_3(Employer,_,_,Caly).

%(1) In general

%The term "employer" means, with respect to any calendar year, any person who-
s3306_a_1(Employer,Caly) :-
	s3306_a_1_A(Employer,Caly,_).
s3306_a_1(Employer,Caly) :-
	s3306_a_1_B(Employer,_,_,Caly).

%(A) during the calendar year or the preceding calendar year paid wages of $1,500 or more, or
s3306_a_1_is_wages(Person, Year, Remuneration, Wages) :-
    s3306_b(Wages,Remuneration,Service,Person,_,_,_,_),
	start_(Remuneration,Time),
    last_day_year(Year,Last_day_year),
    is_before(Time,Last_day_year),
    first_day_year(Year,First_day_year),
    is_before(First_day_year,Time),
    not purpose_(Service, "agricultural labor"),
	not purpose_(Service, "domestic service").

s3306_a_1_A(Employee,Caly,Wages) :-
	year(Caly),person(Employee),
	Wages = #sum{Amount,Remuneration : s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount)},
	Wages>=1500.

s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount):-
	s3306_a_1_is_wages(Employee, Caly, Remuneration, Amount).
s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_1_is_wages(Employee, Pyear, Remuneration, Amount).

%(B) on each of some 10 days during the calendar year or during the preceding calendar year, each day being in a different calendar week, employed at least one individual in employment for some portion of the day.
s3306_a_1_is_day_of_employment(Person, Employee, Day) :-
	s3306_c(Service,Person,Employee,Day,_),
    not purpose_(Service,"agricultural labor"),
    not purpose_(Service,"domestic service"),
    not type_(Service,"agricultural labor"),
    not type_(Service,"domestic service").

s3306_a_1_B(Employer,Workday,Employee,Caly) :-
	person(Employer),list(Workday),list(Employee),
    last_day_year(Caly,Last_day_year),
    Year1=Caly-1,
    first_day_year(Year1,First_day_year1),
	Num_days = #count{Day : 
	s3306_a_1_is_day_of_employment(Employer,Individual,Day),
	is_before(First_day_year1,Day),
	is_before(Day,Last_day_year)},
	Num_days>=10,
	Num_weeks = #count{Week : 
		s3306_a_1_is_day_of_employment(Employer,Individual,Day),
		is_before(First_day_year1,Day),
		is_before(Day,Last_day_year),
		week_number(Day,Week)},
	Num_weeks>=10.

%For purposes of this paragraph, there shall not be taken into account any wages paid to, or employment of, an employee performing domestic services referred to in paragraph (3).

%(2) Agricultural labor

%In the case of agricultural labor, the term "employer" means, with respect to any calendar year, any person who-
s3306_a_2(Employer,Caly) :-
	s3306_a_2_A(Employer,Caly,_,_).
s3306_a_2(Employer,Caly) :-
	s3306_a_2_B(Employer,_,_,_,_,Caly).

%(A) during any calendar quarter in the calendar year or the preceding calendar year paid wages of $20,000 or more for agricultural labor, or
s3306_a_2_is_wages(Person, Year, Remuneration, Wages, Service) :- 
    s3306_b(Wages,Remuneration,Service,Person,_,_,_,_),
    start_(Remuneration,Time),
    last_day_year(Year,Last_day_year),
    is_before(Time,Last_day_year),
    first_day_year(Year,First_day_year),
    is_before(First_day_year,Time),
    purpose_(Service, "agricultural labor").

s3306_a_2_A(Employer,Caly,Wages,Service) :-
	year(Caly),person(Employer),list(Service),
	Wages = #sum{Amount,Service_ : s3306_a_2_A_wages(Employee, Caly,Amount,Service_)},
	Wages>=20000.

s3306_a_2_A_wages(Employer, Caly,Amount,Service_):-
	s3306_a_2_is_wages(Employer, Caly, Epay, Amount, Service_).
s3306_a_2_A_wages(Employer, Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_2_is_wages(Employer, Pyear, Epay, Amount, Service_).
	

%(B) on each of some 10 days during the calendar year or during the preceding calendar year, each day being in a different calendar week, employed at least 5 individuals in employment in agricultural labor for some portion of the day.
s3306_a_2_is_day_of_employment(Person,Individuals_,Agricultural_labor_,Day) :-
	list(Individuals_),list(Agricultural_labor_),person(Person),date(Day),
	Num_employees = #count{Employee : s3306_a_2_is_day_of_employment_labor(Employee,Service,Day,Person)},
	Num_employees>=5.

s3306_a_2_is_day_of_employment_labor(Employee,Service,Day,Person):-
	s3306_c(Service,Person,Employee,Day,_),
	purpose_(Service,"agricultural labor").
s3306_a_2_is_day_of_employment_labor(Employee,Service,Day,Person):-
	s3306_c(Service,Person,Employee,Day,_),
	type_(Service,"agricultural labor").


s3306_a_2_B(Employer,Workday_,Service_,Employee_,S33_,Caly) :-
	person(Employer),list(Workday_),list(Service_),list(Employee_),list(S33_),
    last_day_year(Caly,Last_day_year),
    Year1=Caly-1,
    first_day_year(Year1,First_day_year1),
	Num_days = #count{Day : 
		s3306_c(_,Employer,_,Day,_), % narrow down the list of days
		s3306_a_2_is_day_of_employment(Employer,Employees,Labor,Day), % check that 5+ people were employed
		is_before(First_day_year1,Day),
		is_before(Day,Last_day_year)},
	Num_days>=10,
	Num_weeks = #count{Week : 
		s3306_c(_,Employer,_,Day,_), % narrow down the list of days
		s3306_a_2_is_day_of_employment(Employer,Employees,Labor,Day), % check that 5+ people were employed
		is_before(First_day_year1,Day),
		is_before(Day,Last_day_year),
		week_number(Day,Week)},
	Num_weeks>=10.

%(3) Domestic service

%In the case of domestic service in a private home, local college club, or local chapter of a college fraternity or sorority, the term "employer" means, with respect to any calendar year, any person who during any calendar quarter in the calendar year or the preceding calendar year paid wages in cash of $1,000 or more for such service.
s3306_a_3_is_wages(Person, Year, Remuneration, Service, Wages) :-
    s3306_b(Wages,Remuneration,Service,Person,_,_,_,_),
    start_(Remuneration,Time),
    last_day_year(Year,Last_day_year),
    is_before(Time,Last_day_year),
    first_day_year(Year,First_day_year),
    is_before(First_day_year,Time),
	s3306_a_3_is_wages_means(Remuneration),
	purpose_(Service, "domestic service").

s3306_a_3_is_wages_means(Remuneration):-
	payment_(Remuneration),not means_(Remuneration,_).
s3306_a_3_is_wages_means(Remuneration):-
	means_(Remuneration,"cash").	

s3306_a_3(Employer,_Service_,Wages,Caly) :-
	list(_Service_),person(Employer),year(Caly),
	Wages = #sum{Amount,Service_ : s3306_a_2_A_wages(Employee, Caly,Amount,Service_)},
	Wages>=1000.

s3306_a_2_A_wages(Employer, Caly,Amount,Service_):-
	s3306_a_3_is_wages(Employer, Caly, Epay, Service_, Amount).
s3306_a_2_A_wages(Employer, Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_3_is_wages(Employer, Pyear, Epay, Service_, Amount).

%(4) Special rule

%A person treated as an employer under paragraph (3) shall not be treated as an employer with respect to wages paid for any service other than domestic service referred to in paragraph (3) unless such person is treated as an employer under paragraph (1) or (2) with respect to such other service.
% This will be satisfied automatically here since all 3 types of employer are kept separate.
s3306_a_4(). % always true.

%(b) Wages

%For purposes of this chapter, the term "wages" means all remuneration for employment, including the cash value of all remuneration (including benefits) paid in any medium other than cash; except that such term shall not include-
s3306_b(Wages,Remuneration,Employment,Payer,Payee,Employer,Employee,Medium) :-
	payment_(Remuneration),
    s3306_b_means(Remuneration,Medium),
    agent_(Remuneration,Payer),
    s3306_b_patient(Remuneration,Payee,Plan),
	service_(Employment),
    agent_(Employment,Employee),
    patient_(Employment,Employer),
	purpose_(Remuneration,Employment),
    end_(Employment,End_service),
	date_split(End_service,Year,M,D),
	s3306_c(Employment,_,_,_,Year),
	amount_(Remuneration,Wages_before),
    s3306_b_1(Wages_before,Wages),
	not s3306_b_2(Remuneration,Employment,Payer,Payee,_,Plan),
    not s3306_b_7(Remuneration,Employment,Payer,Payee,_,_),
	not s3306_b_10(Remuneration,Employment,Payer,Payee,_,Plan),
	not s3306_b_11(Remuneration,Employment,_),
    not s3306_b_15(Remuneration,Employer,Payee,Employee,_).

s3306_b_means(Remuneration,Medium):-
	medium(Medium),payment_(Remuneration), not means_(Remuneration,_).
s3306_b_means(Remuneration,Medium):-
	means_(Remuneration,Medium).

s3306_b_patient(Remuneration,Payee,Plan):-
	plan_(Plan),
	patient_(Remuneration,Payee),
	not plan_(Payee).
s3306_b_patient(Remuneration,Payee,Plan):-
	patient_(Remuneration,Plan),
	plan_(Plan),
	beneficiary_(Plan,Payee).

%(1) that part of the remuneration which, after remuneration (other than remuneration referred to in the succeeding paragraphs of this subsection) equal to $7,000 with respect to employment has been paid to an individual by an employer during any calendar year, is paid to such individual by such employer during such calendar year;
s3306_b_1(Remuneration,Remuneration2) :-
    min(Remuneration2,7000,Remuneration).

%(2) the amount of any payment (including any amount paid by an employer for insurance or annuities, or into a fund, to provide for any such payment) made to, or on behalf of, an employee or any of his dependents under a plan or system established by an employer which makes provision for his employees generally (or for his employees generally and their dependents) or for a class or classes of his employees (or for a class or classes of his employees and their dependents), on account of-
s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan) :-
	s3306_c(Service,Employer,Employee,_,_),
	payment_(Remuneration),
	agent_(Remuneration,Employer),
	plan_(Plan), % existence of the plan
	beneficiary_(Plan,Payee),
	s3306_b_2_employee(Payee,Employee),
	s3306_b_2_A_or_C(Plan),
	s3306_b_2_patient(Remuneration,Plan,Payee).

s3306_b_2_employee(Payee,Employee):-
	person(Employee),Employee=Payee.
s3306_b_2_employee(Payee,Employee):-
	s152(Payee,Employee,_).

s3306_b_2_A_or_C(Plan):-
	s3306_b_2_A(Plan).
s3306_b_2_A_or_C(Plan):-
	s3306_b_2_C(Plan).

s3306_b_2_patient(Remuneration,Plan,Payee):-
	% payment into a fund
	person(Payee),
	patient_(Remuneration,Plan).
s3306_b_2_patient(Remuneration,Plan,Payee):-
	% payment using the fund
	means_(Remuneration,Plan),
	patient_(Remuneration,Payee).

%(A) sickness or accident disability, or
s3306_b_2_A(Plan) :-
	purpose_(Plan,"make provisions for employees in case of sickness").
s3306_b_2_A(Plan) :-
	purpose_(Plan,"make provisions for employees in case of accident disability").

%(C) death;
s3306_b_2_C(Plan) :-
	purpose_(Plan,"make provisions for employees in case of death").

%(7) remuneration paid in any medium other than cash to an employee for service not in the course of the employer's trade or business;
s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92) :-
	s3306_c(Service,Employer,Employee,_,_),
	means_(Remuneration,Medium),
	not Medium="cash",
    business_(Employers_business),
	agent_(Employers_business,Employer),
	type_(Employers_business,S92),
    type_(Service,Type_service),
	not S92=Type_service.

%(10) any payment or series of payments by an employer to an employee or any of his dependents which is paid-
s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan) :-
	s3306_c(Service,Employer,Employee,_,_),
    start_(Remuneration,Remuneration_day),
	date_split(Remuneration_day,Year_int,M,D),
	agent_(Remuneration,Employer),
	patient_(Remuneration,Payee),
	s3306_b_10_Employee(Employee,Payee,Year_int),
	s3306_b_10_A(Remuneration,Service,Employee,Employer,_,_),
    s3306_b_10_B(Employer,Remuneration,Plan).

s3306_b_10_Employee(Employee,Payee,Year_int):-
	person(Employee),year(Year_int),Employee=Payee.
s3306_b_10_Employee(Employee,Payee,Year_int):-
	s152(Employee,Any_of_his_dependents,Year_int),
	Any_of_his_dependents=Payee.

%(A) upon or after the termination of an employee's employment relationship because of (i) death, or (ii) retirement for disability, and
s3306_b_10_A(Remuneration,Employment,Employee,Employer,S101,S105) :-
	start_(Remuneration,Start_remuneration),
	termination_(S101),
    agent_(S101,Employer),
	patient_(S101,Employment),
	s3306_b_10_A_start_end(S101,Start_termination,Employment),
    is_before(Start_termination,Start_remuneration),
	reason_(S101,S105),
	s3306_b_10_A_disability_or_death(S105),
	agent_(S105,Employee).

s3306_b_10_A_start_end(S101,Start_termination,Employment):-
	service_(Employment),start_(S101,Start_termination).
s3306_b_10_A_start_end(S101,Start_termination,Employment):-
	termination_(S101),end_(Employment,Start_termination).

s3306_b_10_A_disability_or_death(S105):-
	disability_(S105).
s3306_b_10_A_disability_or_death(S105):-
	death_(S105).

%(B) under a plan established by the employer which makes provision for his employees generally or a class or classes of his employees (or for such employees or class or classes of employees and their dependents),
s3306_b_10_B(Employer,Remuneration,Plan) :-
	means_(Remuneration,Plan),
	plan_(Plan),
	agent_(Plan,Employer),
    purpose_(Plan,"make provisions for employees or dependents").

%other than any such payment or series of payments which would have been paid if the employee's employment relationship had not been so terminated;

%(11) remuneration for agricultural labor paid in any medium other than cash;
s3306_b_11(Remuneration,Service,Medium) :-
    service_(Service),
	purpose_(Service,"agricultural labor"),
	patient_(Service,Employer),
	agent_(Service,Employee),
    agent_(Remuneration,Employer),
	patient_(Remuneration,Employee),
	purpose_(Remuneration,Service),
	means_(Remuneration,Medium),
    not Medium="cash".

%(15) any payment made by an employer to a survivor or the estate of a former employee after the calendar year in which such employee died;
s3306_b_15(Remuneration,Employer,Payee,Employee,Caly) :-
    s3306_c(_,Employer,Employee,_,_),
	agent_(Remuneration,Employer),
	patient_(Remuneration,Payee),
	start_(Remuneration,Start_remuneration),
	death_(Edeath),
	agent_(Edeath,Employee),
	start_(Edeath,Time_death),
    marriage_(Emar),
	agent_(Emar,Employee),
	agent_(Emar,Payee),
	s3306_b_15_end(Emar,Time_death),
	date_split(Start_remuneration,Year_remuneration,M,D),
	date_split(Time_death,Caly,M1,D1),
	Year_remuneration>Caly.

s3306_b_15_end(Emar,Time_death):-
	marriage_(Emar),date(Time_death),not end_(Emar,_).
s3306_b_15_end(Emar,Time_death):-
	end_(Emar,Time_death).

%(c) Employment

%For purposes of this chapter, the term "employment" means any service, of whatever nature,

s3306_c(Service,Employer,Employee,Workday,Caly) :-
	service_(Service),
	date_split(Workday,Caly,M1,D1),
    s3306_c_A_or_B(Service,Employer,Employee),
	not s3306_c_1(Service,Caly),
	not s3306_c_2(Service,_,Caly), 
	not s3306_c_5(Service,Employer,Employee,Workday),
	not s3306_c_6(Service),
	not s3306_c_7(Service,_),
	not s3306_c_10(Service,Employer,Employee,Workday),
	not s3306_c_11(Service,Employer),
	not s3306_c_13(Service,Employer,Employee,Workday),
	not s3306_c_16(Service,Employer),
	not s3306_c_21(Service,Employee,_,Workday).

s3306_c_A_or_B(Service,Employer,Employee):-
	s3306_c_A(Service,Employer,Employee).
s3306_c_A_or_B(Service,Employer,Employee):-
	s3306_c_B(Service,Employer,Employee,_).

%(A) performed by an employee for the person employing him, irrespective of the citizenship or residence of either, within the United States, and
s3306_c_A(Service,Employer,Employee) :-
	agent_(Service,Employee),
	patient_(Service,Employer), 
    s3306_c_A_location(Service,Geographical_location),
    s3306_c_A_country(Geographical_location,Country).

s3306_c_A_location(Service,Geographical_location):-
	location_(Service,Geographical_location).
s3306_c_A_location(Service,Geographical_location):-
	% by default, assume it's in the US
	service_(Service),
	not location_(Service,_),
	Geographical_location = "usa".

s3306_c_A_country(Geographical_location,Country):-
	country_(Geographical_location,Country),
	Country="usa".
s3306_c_A_country(Geographical_location,Country):-
	country_name(Country),
	not country_(Geographical_location,_),
	Geographical_location="usa".

%(B) performed outside the United States (except in a contiguous country with which the United States has an agreement relating to unemployment compensation) by a citizen of the United States as an employee of an American employer, except-
s3306_c_B(Service,Employer,Employee,Location) :-
	agent_(Service, Employee),
	patient_(Service, Employer),
	s3306_c_B_location(Location,Country),
	not s3306_c_B_agreement(Location),
    american_employer_(Employer_is_american_employer),
    agent_(Employer_is_american_employer, Employer),
	citizenship_(Employee_is_american),
	agent_(Employee_is_american,Employee),
    patient_(Employee_is_american,"usa").

s3306_c_B_location(Location,Country):-
	country_(Location,Country),
	not Country = "usa".
s3306_c_B_location(Location,Country):-
	country_name(Country),location_name(Location),
	not country_(Location,_),
	not Location = "usa".

s3306_c_B_agreement(Location):-
	unemployment_compensation_agreement_(Agreement),
	agent_(Agreement,"usa"),
	agent_(Agreement,Location).

%(1) agricultural labor unless-
s3306_c_1(Service,Caly) :-
	year(Caly),
	purpose_(Service,"agricultural labor"),
	not s3306_c_1_A_and_B(Service,Caly).
s3306_c_1(Service,Caly) :-
	year(Caly),
	type_(Service,"agricultural labor"),
	not s3306_c_1_A_and_B(Service,Caly).

s3306_c_1_A_and_B(Service,Caly):-
	s3306_c_1_A(Service,_,Caly),
	s3306_c_1_B(Service,_).

%(A) such labor is performed for a person who-
s3306_c_1_A(Service,Employer,Caly) :-
    service_(Service),
	patient_(Service,Employer),
	s3306_c_1_A_i(Employer,_,_,_,Caly).
s3306_c_1_A(Service,Employer,Caly) :-
    service_(Service),
	patient_(Service,Employer),
	s3306_c_1_A_ii(Employer,_,_,_,_,Caly).

%(i) during the calendar year or the preceding calendar year paid remuneration in cash of $20,000 or more to individuals employed in agricultural labor (including labor performed by an alien referred to in subparagraph (B)), or
s3306_c_1_A_i(Employer,Remuneration,Employee,Service,Caly) :-
	person(Employer),list(Employee),list(Service),
    last_day_year(Caly,Last_day_year),
    Year1=Caly-1,
    first_day_year(Year1,First_day_year),
	Remuneration = #sum{Amount,Employee_,Service_ :
		payment_(Payment),
		agent_(Payment,Employer),
		patient_(Payment,Employee_),
		service_(Service_),
		agent_(Service_,Employee_),
		patient_(Service_,Employer),
		s3306_c_1_A_i_service(Service_),
		purpose_(Payment,Service_),
		amount_(Payment,Amount),
		start_(Payment,Payment_time),
		is_before(First_day_year,Payment_time),
		is_before(Payment_time,Last_day_year),
		s3306_c_1_A_i_means(Payment)
	},
    Remuneration >= 20000.

s3306_c_1_A_i_service(Service_):-
	purpose_(Service_,"agricultural labor").
s3306_c_1_A_i_service(Service_):-
	type_(Service_,"agricultural labor").

s3306_c_1_A_i_means(Payment):-
	payment_(Payment),not means_(Payment,_).
s3306_c_1_A_i_means(Payment):-
	means_(Payment,"cash").

%(ii) on each of some 10 days during the calendar year or the preceding calendar year, each day being in a different calendar week, employed in agricultural labor (including labor performed by an alien referred to in subparagraph (B)) for some portion of the day (whether or not at the same moment of time) 5 or more individuals; and
s3306_c_1_A_ii(Employer,Workday,Service,Employee,S156,Caly) :-
	s3306_a_2_B(Employer,Workday,Service,Employee,S156,Caly).

%(B) such labor is not agricultural labor performed by an individual who is an alien admitted to the United States to perform agricultural labor.
s3306_c_1_B(Service,Employee) :-
	service_(Service),person(Employee),not s3306_c_1_B_not(Service,Employee).

s3306_c_1_B_not(Service,Employee):-
	type_(Service,"agricultural labor"),
	citizenship_(Employee_citizenship),
	agent_(Employee_citizenship,Employee),
	patient_(Employee_citizenship,Country),
	not Country = "usa",
	migration_(Employee_migration),
	agent_(Employee_migration,Employee),
	destination_(Employee_migration,"usa"),
	purpose_(Employee_migration,"agricultural labor").
s3306_c_1_B_not(Service,Employee):-
	purpose_(Service,"agricultural labor"),
	agent_(Employee_citizenship,Employee),
	patient_(Employee_citizenship,Country),
	not Country = "usa",
	migration_(Employee_migration),
	agent_(Employee_migration,Employee),
	destination_(Employee_migration,"usa"),
	purpose_(Employee_migration,"agricultural labor").

%(2) domestic service in a private home, local college club, or local chapter of a college fraternity or sorority unless performed for a person who paid cash remuneration of $1,000 or more to individuals employed in such domestic service in any calendar quarter in the calendar year or the preceding calendar year;
s3306_c_2(Service,Location,Caly) :-
	year(Caly),
	s3306_c_2_service(Service),
    patient_(Service,Person),
    location_(Service,Location),
	s3306_c_2_location(Location),
	not s3306_a_3(Person,_,_,Caly).

s3306_c_2_service(Service):-
	type_(Service,"domestic service").
s3306_c_2_service(Service):-
	purpose_(Service,"domestic service").

s3306_c_2_location(Location):-
	Location="private home".
s3306_c_2_location(Location):-
	Location="local college club".
s3306_c_2_location(Location):-
	Location="local chapter of a college fraternity".
s3306_c_2_location(Location):-
	Location="local chapter of a college sorority".

% (5) 
s3306_c_5(Service,Employer,Employee,Workday) :-
    s3306_c_5_A(Service,Employee,Employer,Workday).
s3306_c_5(Service,Employer,Employee,Workday) :-
    s3306_c_5_B(Service,Employee,Employer,Workday).

% (A) service performed by an individual in the employ of his son, daughter, or spouse;
s3306_c_5_A(Service,Employee,Employer,Workday) :-
	date(Workday),
	service_(Service),
	agent_(Service,Employee),
	patient_(Service,Employer),
	is_child_of(Employer,Employee,_,_).
s3306_c_5_A(Service,Employee,Employer,Workday) :-
	service_(Service),
	agent_(Service,Employee),
	patient_(Service,Employer),
	marriage_(Marriage),
	agent_(Marriage,Employer),
	agent_(Marriage,Employee),
	not Employer=Employee,
	start_(Marriage,Time_start),
	is_before(Time_start,Workday),
	s3306_c_5_A_marriage(Marriage,Workday).

s3306_c_5_A_marriage(Marriage,Workday):-
	marriage_(Marriage),date(Workday),not end_(Marriage,_).
s3306_c_5_A_marriage(Marriage,Workday):-
	end_(Marriage,Time_end),
	is_before(Workday,Time_end).

% (B) service performed by a child under the age of 21 in the employ of his father or mother;
s3306_c_5_B(Service,Employee,Employer,Workday) :-
    service_(Service),
	agent_(Service,Employee),
    patient_(Service,Employer),
	is_child_of(Employee,Employer,_,_),
	birth_(Birth_employee),
	agent_(Birth_employee,Employee),
	start_(Birth_employee,Date_of_birth),
	date_split(Date_of_birth,Y,M,D),
    Y_21 = Y+21,
	% Note: It is assumed that the date_split below is defined as a fact
    date_split(Date_21,Y_21,M,D),
    is_before(Workday,Date_21).

%(6) service performed in the employ of the United States Government
s3306_c_6(Service) :-
	patient_(Service,Employer),
	Employer="united states government".

%(7) service performed in the employ of a State, or any political subdivision thereof.
s3306_c_7(Service,Employer) :-
	patient_(Service,Employer),
	atom_prefix(Employer,"state of ").

%(10)
s3306_c_10(Service,Employer,Employee,Workday) :-
	s3306_c_10_A(Service,Employer,Employee,Workday).
s3306_c_10(Service,Employer,Employee,Workday) :-
	s3306_c_10_B(Service,Employer,Employee,Workday).

%(A) service performed in the employ of a school, college, or university, if such service is performed
s3306_c_10_A(Service,Employer,Employee,Workday) :-
	patient_(Service,Employer),
    agent_(Service,Employee),
	educational_institution_(Employer_is_an_educational_institution),
	agent_(Employer_is_an_educational_institution,Employer),
    s3306_c_10_A_i(Student,Employer,Workday),
	Employee=Student.
s3306_c_10_A(Service,Employer,Employee,Workday) :-
	patient_(Service,Employer),
    agent_(Service,Employee),
	educational_institution_(Employer_is_an_educational_institution),
	agent_(Employer_is_an_educational_institution,Employer),
    s3306_c_10_A_i(Student,Employer,Workday),
	s3306_c_10_A_ii(Employee,Student,Workday).

%(i) by a student who is enrolled and is regularly attending classes at such school, college, or university, or
s3306_c_10_A_i(Student,Employer,Workday) :-
	enrollment_(Student_is_enrolled),
	agent_(Student_is_enrolled,Student),
	patient_(Student_is_enrolled,Employer),
	start_(Student_is_enrolled,Start_enrollment),
	attending_classes_(Student_attends_classes),
	agent_(Student_attends_classes,Student),
	location_(Student_attends_classes,Employer),
	start_(Student_attends_classes,Start_attendance),
	is_before(Start_enrollment,Workday),
	is_before(Start_attendance,Workday),
	s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday),
	s3306_c_13_student(Student_attends_classes,Stop_attendance,Workday).

s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday):-
	enrollment_(Student_is_enrolled),date(Stop_enrollment),
	date(Workday),not end_(Student_is_enrolled,_).
s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday):-
	end_(Student_is_enrolled,Stop_enrollment),
	is_before(Workday,Stop_enrollment).
	
%(ii) by the spouse of such a student, or
s3306_c_10_A_ii(Spouse,Student,Workday) :-
	date_split(Workday,Year,M1,D1),
    s7703(Student,Spouse,Marriage,Year),
	s3306_c_10_A_ii_start(Marriage,Workday),
	s3306_c_10_A_ii_end(Marriage,Workday),
	s3306_c_10_A_i(Spouse,_,Workday).

s3306_c_10_A_ii_start(Marriage,Workday):-
	marriage(Marriage),date(Workday),not start_(Marriage,_).
s3306_c_10_A_ii_start(Marriage,Workday):-
	start_(Marriage,Start_marriage),
	is_before(Start_marriage,Workday).

s3306_c_10_A_ii_end(Marriage,Workday):-
	marriage(Marriage),date(Workday),not end_(Marriage,_).
s3306_c_10_A_ii_end(Marriage,Workday):-
	end_(Marriage,End_marriage),
	is_before(Workday,End_marriage).

%(B) service performed in the employ of a hospital, if such service is performed by a patient of such hospital;
s3306_c_10_B(Service,Employer,Employee,Workday) :-
    service_(Service),
	patient_(Service,Employer),
	agent_(Service,Employee),
	hospital_(Employer_is_hospital),
	agent_(Employer_is_hospital,Employer),
	medical_patient_(Employee_is_medical_patient),
	agent_(Employee_is_medical_patient,Employee),
	patient_(Employee_is_medical_patient,Employer),
	start_(Employee_is_medical_patient,Start_patient),
	is_before(Start_patient,Workday),
	s3306_c_10_B_end(Employee_is_medical_patient,Workday).

s3306_c_10_B_end(Employee_is_medical_patient,Workday):-
	medical_patient_(Employee_is_medical_patient),date(Workday),not end_(Employee_is_medical_patient,_).
s3306_c_10_B_end(Employee_is_medical_patient,Workday):-
	end_(Employee_is_medical_patient,End_patient),
	is_before(Workday,End_patient).

%(11) service performed in the employ of a foreign government (including service as a consular or other officer or employee or a nondiplomatic representative);
s3306_c_11(Service,Employer) :-
    service_(Service),
	patient_(Service,Employer),
	sub_atom(Employer,_,11,0,Suffix),
	Suffix=" government",
	not Employer="united states government".

%(13) service performed as a student nurse in the employ of a hospital or a nurses' training school by an individual who is enrolled and is regularly attending classes in a nurses' training school;
s3306_c_13(Service,Employer,Employee,Workday) :-
	patient_(Service,Employer),
	agent_(Service,Employee),
	s3306_c_13_hospital(Employer_is_hospital_or_nurses_training_school),
	agent_(Employer_is_hospital_or_nurses_training_school,Employer),
    nurses_training_school_(Isa_nurses_training_school),
    agent_(Isa_nurses_training_school,Nurses_training_school),
	enrollment_(Student_is_enrolled),
	agent_(Student_is_enrolled,Employee),
	patient_(Student_is_enrolled,Nurses_training_school),
	start_(Student_is_enrolled,Start_enrollment),
	attending_classes_(Student_attends_classes),
	agent_(Student_attends_classes,Employee),
	location_(Student_attends_classes,Nurses_training_school),
	start_(Student_attends_classes,Start_attendance),
	is_before(Start_enrollment,Workday),
	is_before(Start_attendance,Workday),
	s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday),
	s3306_c_13_student(Student_attends_classes,Stop_attendance,Workday).

s3306_c_13_hospital(Employer_is_hospital_or_nurses_training_school):-
	nurses_training_school_(Employer_is_hospital_or_nurses_training_school).
s3306_c_13_hospital(Employer_is_hospital_or_nurses_training_school):-
	hospital_(Employer_is_hospital_or_nurses_training_school).

s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday):-
	enrollment_(Student_is_enrolled),date(Stop_enrollment),
	date(Workday),not end_(Student_is_enrolled,_).
s3306_c_13_student(Student_is_enrolled,Stop_enrollment,Workday):-
	end_(Student_is_enrolled,Stop_enrollment),
	is_before(Workday,Stop_enrollment).

%(16) service performed in the employ of an international organization;
s3306_c_16(Service,Employer) :-
    service_(Service),
	patient_(Service,Employer),
	international_organization_(Employer_is_international_organization),
	agent_(Employer_is_international_organization,Employer).

%(21) service performed by a person committed to a penal institution.
s3306_c_21(Service,Employee,S235,Workday) :-
	agent_(Service,Employee),
	penal_institution_(Jail_is_a_penal_institution),
	agent_(Jail_is_a_penal_institution,S235),
	incarceration_(Person_goes_to_jail),
	agent_(Person_goes_to_jail,Employee),
	patient_(Person_goes_to_jail,S235),
	start_(Person_goes_to_jail,Start_incarceration),
	is_before(Start_incarceration,Workday),
	s3306_c_21_end(Person_goes_to_jail,End_incarceration,Workday).

s3306_c_21_end(Person_goes_to_jail,End_incarceration,Workday):-
	incarceration_(Person_goes_to_jail),date(End_incarceration),
	date(Workday),not end_(Person_goes_to_jail,_).
s3306_c_21_end(Person_goes_to_jail,End_incarceration,Workday):-
	end_(Person_goes_to_jail,End_incarceration),
	is_before(Workday,End_incarceration).