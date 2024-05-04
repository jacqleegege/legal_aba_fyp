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

% time
% day_to_stamp(Day, Stamp) :- % convert day in YYYY-MM-DD format to time stamp
% 	split_string(Day,"-","",[YS,MS,DS]),
% 	atom_number(YS,YI),
% 	atom_number(MS,MI),
% 	atom_number(DS,DI),
% 	DI1=DI+1,
% 	date_time_stamp(date(YI,MI,DI1,0,0,0,0,-,-), Stamp).

is_before(Day1,Day2):-
    date_split(Day1,Y1,M1,D1),
    date_split(Day2,Y2,M2,D2),
    Y1 < Y2.
is_before(Day1,Day2):-
    date_split(Day1,Y1,M1,D1),
    date_split(Day2,Y2,M2,D2),
    Y1 = Y2,M1 < M2.
is_before(Day1,Day2):-
    date_split(Day1,Y1,M1,D1),
    date_split(Day2,Y2,M2,D2),
    Y1 = Y2,M1 = M2,D1 < D2.

% is_before(Day1,Day2) :- % Is true if Day2 occurs after Day1. Arguments are input as strings in format YYYY-MM-DD.
%     nonvar(Day1), nonvar(Day2),
% 	day_to_stamp(Day1,Stamp1),
% 	day_to_stamp(Day2,Stamp2),
%     Stamp1=<Stamp2.

last_day_year(Year,Day):-
    date_split(Day,Year,12,31).

% last_day_year(Year,Day) :-
% 	atom_string(Year,Year_s),
% 	string_concat(Year_s,"-12-31",Day).

first_day_year(Year,Day) :-
	date_split(Day,Year,1,1).

% first_day_year(Year,Day) :-
% 	atom_string(Year,Year_s),
% 	string_concat(Year_s,"-01-01",Day).

% out of days in format YYYY-MM-DD, extract latest day
% UNUSED
% latest([],_). % just leave the output unbound

% latest([Day|Days],Output) :- 
%     (
%         nonvar(Day),
%         latest(Days,Day,Output)
%     );
%     (
%         var(Day),
%         latest(Days,Output)
%     ).

% latest([],Output,Output).

% latest([Day|Days],Latest,Output) :-
%     (
%         nonvar(Day),
%         (
%             (
%                 is_before(Day,Latest),
%                 latest(Days,Latest,Output)
%             );
%             (
%                 \+ is_before(Day,Latest),
%                 latest(Days,Day,Output)
%             )
%         )
%     );
%     (
%         var(Day),
%         latest(Days,Latest,Output)
%     ).

% UNUSED
% out of days in format YYYY-MM-DD, extract earliest date
% earliest([],_). % just leave the output unbound

% earliest([Day|Days],Output) :- 
%     (
%         nonvar(Day),
%         earliest(Days,Day,Output)
%     );
%     (
%         var(Day),
%         earliest(Days,Output)
%     ).

% earliest([],Output,Output).

% earliest([Day|Days],Earliest,Output) :-
%     (
%         nonvar(Day),
%         (
%             (
%                 is_before(Earliest,Day),
%                 earliest(Days,Earliest,Output)
%             );
%             (
%                 \+ is_before(Earliest,Day),
%                 earliest(Days,Day,Output)
%             )
%         )
%     );
%     (
%         var(Day),
%         earliest(Days,Earliest,Output)
%     ).

month_days(Month,Days):- Month=1, Days=31.
month_days(Month,Days):- Month=2, Days=-1.
month_days(Month,Days):- Month=3, Days=31.
month_days(Month,Days):- Month=4, Days=30.
month_days(Month,Days):- Month=5, Days=31.
month_days(Month,Days):- Month=6, Days=30.
month_days(Month,Days):- Month=7, Days=31.
month_days(Month,Days):- Month=8, Days=31.
month_days(Month,Days):- Month=9, Days=30.
month_days(Month,Days):- Month=10, Days=31.
month_days(Month,Days):- Month=11, Days=30.
month_days(Month,Days):- Month=12, Days=31.

month_days_norm(1,31).
month_days_norm(2,28).
month_days_norm(3,31).
month_days_norm(4,30).
month_days_norm(5,31).
month_days_norm(6,30).
month_days_norm(7,31).
month_days_norm(8,31).
month_days_norm(9,30).
month_days_norm(10,31).
month_days_norm(11,30).
month_days_norm(12,31).

duration_days(FromDay,ToDay,Days,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    D2 >= D1,
    Days= D2-D1,
    Increment = 0.
duration_days(FromDay,ToDay,Days,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    D1 > D2,
    month_days(M1,Inc),
    Inc=-1,
    Y1 \ 4 = 0,
    Days = D2 + 29 - D1,
    Increment = 1.
duration_days(FromDay,ToDay,Days,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    D1 > D2,
    month_days(M1,Inc),
    Inc=-1,
    Days = D2 + 28 - D1,
    Increment = 1.
duration_days(FromDay,ToDay,Days,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    D1 > D2,
    month_days(M1,Inc),
    Days = D2 + Inc - D1,
    Increment = 1.

duration_months(FromDay,ToDay,Days,Months,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    duration_days(FromDay,ToDay,Days,Inc),
    M1 + Inc > M2,
    Months = M2 + 12 - M1 - Inc,
    Increment = 1.
duration_months(FromDay,ToDay,Days,Months,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    duration_days(FromDay,ToDay,Days,Inc),
    M1 + Inc <= M2,
    Months = M2 - M1 - Inc,
    Increment = 0.

duration_years(FromDay,ToDay,Days,Months,Years):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    duration_months(FromDay,ToDay,Days,Months,Increment),
    Years = Y2 - Y1 - Increment.

% Duration function
duration(Day1,Day2,Years,Months,Days):-
    earlier(FromDay,Day1,Day2),
    later(ToDay,Day1,Day2),
    duration_years(FromDay,ToDay,Days,Months,Years).

more_than_half_a_year(Years,Months):-
    number(Years),number(Months),Years >= 1.
more_than_half_a_year(Years,Months):-
    number(Years),number(Months),Months >= 6.



week_number(Day,Week):-
    date_split(Day,Y,M,D),
    Total = #sum{Days,Month: Month<M, month_days_norm(Month,Days)},
    Week = (Total+D) / 7 + 1.

% Duration in years
% duration(Day1,Day2,Year):-
%     date_split(Day1,Y1,M1,D1),
%     date_split(Day2,Y2,M2,D2),
    % is_before(Day1,Day2),
%     less_than_a_year(Day1,Day2),
%     Year=Y2-Y1-1.
% duration(Day1,Day2,Year):-
%     date_split(Day1,Y1,M1,D1),
%     date_split(Day2,Y2,M2,D2),
%     is_before(Day1,Day2),
%     not less_than_a_year(Day1,Day2),
%     Year=Y2-Y1.
% duration(Day1,Day2,Year):-
%     date_split(Day1,Y1,M1,D1),
%     date_split(Day2,Y2,M2,D2),
%     is_before(Day2,Day1),
%     less_than_a_year(Day2,Day1),
%     Year=Y1-Y2-1.
% duration(Day1,Day2,Year):-
%     date_split(Day1,Y1,M1,D1),
%     date_split(Day2,Y2,M2,D2),
%     is_before(Day2,Day1),
%     not less_than_a_year(Day2,Day1),
%     Year=Y1-Y2.


less_than_a_year(Day1,Day2):-
    date_split(Day1,Y1,M1,D1),
    date_split(Day2,Y2,M2,D2),
    is_before(Day1,Day2),
    M1 > M2.
less_than_a_year(Day1,Day2):-
    date_split(Day1,Y1,M1,D1),
    date_split(Day2,Y2,M2,D2),
    is_before(Day1,Day2),
    M1 = M2, D1 > D2.
    


% TO BE CHANGED
% duration(Day1,Day2,Duration) :- % duration in arbitrary units for days in YYYY-MM-DD format
% 	day_to_stamp(Day1, Stamp1),
% 	day_to_stamp(Day2, Stamp2),
% 	Duration = Stamp2-Stamp1.

% kinship
is_child_of(X,Y,Day_start,Day_end) :- % X is the child of Y from Day_start to Day_end if...
	% what kind of relationship exists between X and Y
	child_or_parent(X,Y,Relationship),
    not X = Y,
	relationship_start(Relationship,Day_start),
	% if no end to Relationship then it's still ongoing
    relationship_end(Relationship,Day_end).

child_or_parent(X,Y,Relationship):-
    % X is child of Y, or
    son_or_daughter(Relationship),
    agent_(Relationship,X),
    patient_(Relationship,Y).
child_or_parent(X,Y,Relationship):-
    % Y is parent of X
    father_or_mother(Relationship),
    agent_(Relationship,Y),
    patient_(Relationship,X).

son_or_daughter(Relationship):-
    son_(Relationship).
son_or_daughter(Relationship):-
    daughter_(Relationship).

father_or_mother(Relationship):-
    father_(Relationship).
father_or_mother(Relationship):-
    mother_(Relationship).

relationship_start(Relationship,Day_start):-
    relationship(Relationship),date(Day_start),not start_(Relationship,_).
relationship_start(Relationship,Day_start):-   
    start_(Relationship,Day_start).

relationship_end(Relationship,Day_end):-
    relationship(Relationship),date(Day_end),not end_(Relationship,_).
relationship_end(Relationship,Day_end):-
    end_(Relationship,Day_end). 

is_sibling_of(X,Y,Day_start,Day_end) :- % X is the sibling of Y on from Day_start to Day_end if...
	% there is a brother or sister relationship
	brother_and_sister(Relationship),
	% X is somehow involved in it
	agent_or_patient(Relationship,X),
	% and so is Y
    agent_or_patient(Relationship,Y),
    not X = Y,
	relationship_start(Relationship,Day_start),
	% if no end to Relationship then it's still ongoing
	relationship_end(Relationship,Day_end).

brother_and_sister(Relationship):-
    brother_(Relationship).
brother_and_sister(Relationship):-
    sister_(Relationship).

agent_or_patient(Relationship,X):-
    agent_(Relationship,X).
agent_or_patient(Relationship,X):-
    patient_(Relationship,X).

is_descendent_of(X,Y,Day_start,Day_end) :- % X is a descendent of Y if
	% as a base case, X is a descendent of Y if X is a child of Y
    is_child_of(X,Y,Day_start,Day_end).
is_descendent_of(X,Y,Day_start,Day_end) :- 
	% else
    is_child_of(Z,Y,_,_), % Z is a child of Y and
    is_descendent_of(X,Z,Day_start,Day_end). % X is a descendent of Z

is_stepsibling_of(X,Y,Day_start,Day_end) :- % X is stepsibling of Y if
	is_child_of(Y,ParentY,Day_start_x,Day_end_x), % one of the parents of Y
	is_child_of(X,ParentX,Day_start_y,Day_end_y), % and one of the parents of X
	marriage_(Marriage), % got married
	agent_(Marriage,ParentY),
	agent_(Marriage,ParentX),
    not X = Y,
    wedding_start(Marriage,Start_time),
    later(Day_start_2,Day_start_x,Day_start_y),
    later(Day_start,Day_start_2,Start_time),
    wedding_end(Marriage,End_time),
    earlier(Day_end_2,Day_end_x,Day_end_y),
    earlier(Day_end,Day_end_2,End_time).

wedding_start(Marriage,Day_start):-
    marriage_(Marriage),date(Day_start),not start_(Marriage,_).
wedding_start(Marriage,Day_start):-   
    start_(Marriage,Day_start).

wedding_end(Marriage,Day_end):-
    marriage_(Marriage),date(Day_end),not end_(Marriage,_).
wedding_end(Marriage,Day_end):-
    end_(Marriage,Day_end). 

is_sibling_in_law_of(X,Y,Day_start,Day_end) :- % symmetry of relationship
    is_sibling_in_law_of_aux(X,Y,Day_start,Day_end).
is_sibling_in_law_of(X,Y,Day_start,Day_end) :- % symmetry of relationship
    is_sibling_in_law_of_aux(Y,X,Day_start,Day_end).

is_sibling_in_law_of_aux(X,Y,Day_start,Day_end) :- % X is sibling in law of Y if
	is_sibling_of(Y,SiblingY,Day_start_y,Day_end_y), % one of Y's siblings
	marriage_(Marriage), % and X got married
	agent_(Marriage,SiblingY),
	agent_(Marriage,X),
    not X = Y,
    wedding_start(Marriage,Start_time),
    later(Day_start,Start_time,Day_start_y),
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

is_child_in_law_of(X,Y,Day_start,Day_end) :- % X is child in law of Y if
	is_child_of(ChildY,Y,Day_start_y,Day_end_y), % one of the children of Y
	marriage_(Marriage), % got married with X
	agent_(Marriage,ChildY),
	agent_(Marriage,X),
    not X = Y,
    wedding_start(Marriage,Start_time),
    later(Day_start,Start_time,Day_start_y),
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

is_parent_in_law_of(X,Y,Day_start,Day_end) :- % X is parent in law of Y if
	is_child_of(Y,ParentY,Day_start_y,Day_end_y), % one of the parents of Y
	marriage_(Marriage), % got married with X
	agent_(Marriage,ParentY),
	agent_(Marriage,X),
    not X = Y,
    wedding_start(Marriage,Start_time),
    later(Day_start,Start_time,Day_start_y),
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

is_stepparent_of(X,Y,Day_start,Day_end) :- % X is parent in law of Y if
	is_child_of(Y,ParentY,Day_start_y,Day_end_y), % one of the parents of Y
	marriage_(Marriage), % got married with X
	agent_(Marriage,ParentY),
	agent_(Marriage,X),
	start_(Marriage,Start_time), % and their marriage holds on Day
    later(Day_start,Start_time,Day_start_y),
    not X = Y,
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

% aggregation of income
gross_income(Person,Year,Gross_income) :-
	first_day_year(Year,First_day_year),
    last_day_year(Year,Last_day_year),
    % if the individual is filing a joint return with his spouse, sum both incomes
    gross_income_joint(Person,Year,First_day_year,Last_day_year),
    gross_income_individual(Person,Year,Income_individual),
    gross_income_individual(Spouse,Year,Income_spouse),
    Gross_income = Income_individual+Income_spouse.
gross_income(Person,Year,Gross_income) :-
	first_day_year(Year,First_day_year),
    last_day_year(Year,Last_day_year),
    % otherwise, it's just the individual's income
    not gross_income_joint(Person,Year,First_day_year,Last_day_year),
    gross_income_individual(Person,Year,Gross_income).

gross_income_joint(Person,Year,First_day_year,Last_day_year):-
    s7703(Person,Spouse,_,Year),
    joint_return_(Joint_return),
    agent_(Joint_return,Person),
    agent_(Joint_return,Spouse),
    start_(Joint_return,First_day_year),
    end_(Joint_return,Last_day_year).

gross_income_individual(Person,Year,Gross_income) :-
    person(Person),year(Year),
    first_day_year(Year,First_day_year),
    last_day_year(Year,Last_day_year),
    Incomes = #sum{Amount,Income : 
        income_(Income),
        agent_(Income,Person),
        amount_(Income,Amount),
        start_(Income,Start_time),
        is_before(First_day_year,Start_time),
        is_before(Start_time,Last_day_year)},
    Payments = #sum{Amount,Payment:
        payment_(Payment),
        patient_(Payment,Person),
        amount_(Payment,Amount),
        start_(Payment,Start_time),
        is_before(First_day_year,Start_time),
        is_before(Start_time,Last_day_year)},
    Gross_income = Incomes+Payments.

% compute tax owed by a person for a given taxable year
tax(Taxp,Taxy,Tax) :-
    tax_s1(Taxp,Taxy,Income_tax),
    tax_s3301(Taxp,Taxy,Employment_tax),
    Tax = Income_tax+Employment_tax.

tax_s1(Taxp,Taxy,Income_tax):-
    s1(Taxp,Taxy,_,Income_tax).
tax_s1(Taxp,Taxy,Income_tax):-
    person(Taxp),year(Taxy),
    not s1(Taxp,Taxy,_,_),
    Income_tax = 0.

tax_s3301(Taxp,Taxy,Employment_tax):-
    s3301(Taxp,Taxy,_,_,_,Employment_tax).
tax_s3301(Taxp,Taxy,Employment_tax):-
    person(Taxp),year(Taxy),
    not s3301(Taxp,Taxy,_,_,_,_),
    Employment_tax = 0.