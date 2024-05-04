earlier(Result, Date1, Date2) :-
    date(Date1), date(Date2), is_before(Date2,Date1), Result = Date2.
earlier(Result, Date1, Date2) :-
    date(Date1), date(Date2), is_before(Date1,Date2), Result = Date1.
earlier(Result, Date1, Date2) :-
	date(Date1), date(Date2), Date1 = Date2, Result = Date1.

later(Result, Date1, Date2) :-
	date(Date1), date(Date2), is_before(Date2,Date1), Result = Date1.
later(Result, Date1, Date2) :-
	date(Date1), date(Date2), is_before(Date1,Date2), Result = Date2.
later(Result, Date1, Date2) :-
	date(Date1), date(Date2), Date1 = Date2, Result = Date1.

%§7703. Determination of marital status
% at least one of taxp/spouse is defined
s7703(Taxp,Spouse,Marriage,Taxy) :-
    not Taxp = Spouse,
	s7703_a(Taxp,Spouse,Marriage,Taxy),
	not s7703_b(Taxp,Spouse,Taxy).

%(a) General rule
s7703_a(Taxp,Spouse,Marriage,Taxy) :-
	s7703_a_1(Taxp,Spouse,Marriage,_,Taxy),
	not s7703_a_2(Taxp,Spouse,Marriage,_,Taxy).

%(1) the determination of whether an individual is married shall be made as of the close of his taxable year; except that if his spouse dies during his taxable year such determination shall be made as of the time of such death; and
s7703_a_1(Taxp,Spouse,Marriage,S13,Taxy) :-
	% useful constants
	last_day_year(Taxy,Last_day_year),
	first_day_year(Taxy,First_day_year),
	Taxy1=Taxy+1,
	first_day_year(Taxy1,First_day_next_year),
	% main body
	marriage_(Marriage),
	agent_(Marriage,Taxp),
	agent_(Marriage,Spouse),
	not Taxp=Spouse,
    s7703_a_1_start(Marriage,Start_marriage,First_day_year),
    is_before(Start_marriage,Last_day_year),
	s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage).

s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage):-
	s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),
	% such determination shall be made as of the time of such death
	is_before(Start_marriage,S13),
	% marriage was still ongoing at death
	marriage_(Marriage),not end_(Marriage,_).
s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage):-
	s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),
	% such determination shall be made as of the time of such death
	is_before(Start_marriage,S13),
	% or ended with death
	end_(Marriage,End_time),
	is_before(S13,End_time).
s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage):-
	% otherwise, default behavior: check at end of year
	% determining the end date of a marriage:
	date(First_day_year),date(Last_day_year),date(S13),date(Start_marriage),
	not s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),
	s7703_a_1_end_marriage(Marriage,Spouse,First_day_next_year).


s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year):-
	% if spouse died during taxable year
	death_(Death_spouse),
	agent_(Death_spouse,Spouse),
	start_(Death_spouse,S13),
	is_before(First_day_year,S13),
	is_before(S13,Last_day_year).

s7703_a_1_end_marriage(Marriage,Spouse,First_day_next_year):-
	marriage_(Marriage),not end_(Marriage,_),s7703_a_1_death(Spouse,First_day_next_year).
s7703_a_1_end_marriage(Marriage,Spouse,First_day_next_year):-
	% else take end date
	person(Spouse),
	end_(Marriage,End_time),is_before(First_day_next_year,End_time).

s7703_a_1_death(Spouse,First_day_next_year):-
	s7703_a_1_death_2(Spouse,Spouse_dies),
	% take death date as end time
	start_(Spouse_dies,End_time),
	is_before(First_day_next_year,End_time).
s7703_a_1_death(Spouse,First_day_next_year):-
	date(First_day_next_year),person(Spouse),death_(Spouse_dies),
	not s7703_a_1_death_2(Spouse,Spouse_dies).

s7703_a_1_death_2(Spouse,Spouse_dies):-
	% if spouse died,
	death_(Spouse_dies),
	agent_(Spouse_dies,Spouse).

s7703_a_1_start(Marriage,Start_marriage,First_day_year):-
	date(First_day_year),marriage_(Marriage),
	not start_(Marriage,_),
	Start_marriage = First_day_year.
s7703_a_1_start(Marriage,Start_marriage,First_day_year):-
	date(First_day_year),
	start_(Marriage,Start_marriage).

%(2) an individual legally separated from his spouse under a decree of divorce or of separate maintenance shall not be considered as married.
s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
	not Taxp=Spouse,
	legal_separation_(S19),
	patient_(S19,Marriage),
	s7703_a_2_agent(S19),
	start_(S19,Divorce_time),
	last_day_year(Taxy,Last_day_year),
	is_before(Divorce_time,Last_day_year).

s7703_a_2_agent(S19) :-
	agent_(S19,"decree of divorce").
s7703_a_2_agent(S19) :-
	agent_(S19,"decree of separate maintenance").


%(b) Certain married individuals living apart

%For purposes of those provisions of this title which refer to this subsection, if-
s7703_b(Taxp,Spouse,Taxy) :-
	s7703_b_1(Taxp,Household,_,Taxy), 
	s7703_b_2(Taxp,Household,_,Taxy),
	s7703_b_3(Taxp,Spouse,Household,Taxy).


%(1) an individual who is married (within the meaning of subsection (a)) and who files a separate return maintains as his home a household which constitutes for more than one-half of the taxable year the principal place of abode of a child with respect to whom such individual is entitled to a deduction for the taxable year under section 151,
s7703_b_1(Taxp,Household,Dependent,Taxy) :-
	first_day_year(Taxy,First_day_year),
	last_day_year(Taxy,Last_day_year),
	not s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year),
	residence_(Taxp_residence),
	agent_(Taxp_residence,Taxp),
	patient_(Taxp_residence,Household),
	residence_(Child_lives_at_home),
	agent_(Child_lives_at_home,Dependent),
	patient_(Child_lives_at_home,Household),
	start_(Child_lives_at_home,Start_time),
    later(Start,Start_time,First_day_year),
    s7703_b_1_end(Child_lives_at_home,End_time),
	earlier(End,End_time,Last_day_year),
	% now compute time stamp of end minus time stamp of beginning and compare with time stamps of 1/2 of the year 0.
	duration(Start,End,Years,Months,Days),
	more_than_half_a_year(Years,Months),
    s152_a_1(Dependent,Taxp,Taxy).

s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year):-
	joint_return_(Joint_return),
	agent_(Joint_return,Taxp),
	start_(Joint_return,First_day_year),
	end_(Joint_return,Last_day_year).

s7703_b_1_end(Child_lives_at_home,End_time):-
	date(End_time),residence_(Child_lives_at_home),
	not end_(Child_lives_at_home,_).
s7703_b_1_end(Child_lives_at_home,End_time):-
	end_(Child_lives_at_home,End_time).

%(2) such individual furnishes over one-half of the cost of maintaining such household during the taxable year, and
s7703_b_2(Taxp,Household,Cost,Taxy) :-
	person(Taxp),year(Taxy),household(Household),
	Payment_by_individual = #sum{Payment_amount : 
			payment_(Payment),
			residence_(Residence),
			agent_(Payment,Taxp),
			patient_(Residence,Household),
			s7703_b_2_purpose(Payment,Residence,Household),
			amount_(Payment,Payment_amount),
			start_(Payment,Payment_time), % assuming it's a single day
			date_split(Payment_time,Taxy_payment,M1,D1),
			Taxy=Taxy_payment_int},
	Cost = #sum{Payment_amount :
			payment_(Payment),
			residence_(Residence),
			patient_(Residence,Household),
			s7703_b_2_purpose(Payment,Residence,Household),
			amount_(Payment,Payment_amount),
			start_(Payment,Payment_time), % assuming it's a single day
			date_split(Payment_time,Taxy_payment,M1,D1),
			Taxy=Taxy_payment_int},
	Cost>0,
	Ratio = Payment_by_individual/Cost,
	Ratio>=5/10.

s7703_b_2_purpose(Payment,Residence,Household):-
	household(Household),purpose_(Payment,Residence).
s7703_b_2_purpose(Payment,Residence,Household):-
	residence_(Residence),purpose_(Payment,Household).

%(3) during the last 6 months of the taxable year, such individual's spouse is not a member of such household,
s7703_b_3_is_member_of_household(Spouse,Household,Day) :-
    residence_(Spouse_lives_in_household),
    agent_(Spouse_lives_in_household,Spouse),
	patient_(Spouse_lives_in_household,Household),
    start_(Spouse_lives_in_household,Time_start),
    is_before(Time_start,Day),
	not end_(Spouse_lives_in_household,_).
s7703_b_3_is_member_of_household(Spouse,Household,Day) :-
    residence_(Spouse_lives_in_household),
    agent_(Spouse_lives_in_household,Spouse),
	patient_(Spouse_lives_in_household,Household),
    start_(Spouse_lives_in_household,Time_start),
    is_before(Time_start,Day),
	end_(Spouse_lives_in_household,Time_end),
	is_before(Day,Time_end).

    
s7703_b_3(Taxp,Spouse,Household,Taxy) :-
	household(Household),
    s7703_a(Taxp,Spouse,_,Taxy),
    Num_days = #count{Day :
			date_split(Day,Y,M,D),
			M>=7,
            s7703_b_3_is_member_of_household(Spouse,Household,Day)},
    Num_days=0.

%such individual shall not be considered as married.
