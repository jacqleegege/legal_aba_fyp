min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 >= Val2, Result = Val2.
min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val1.

max(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 >= Val2, Result = Val1.
max(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val2.


%§151. Allowance of deductions for personal exemptions
% IDEA: convert list to person(dependent), and exemption of that dependent
% Person_list->Person and Exemptions_list->Exemption
s151(Taxp,S2,Person,Exemption,Taxy) :-
    % if the individual is filing a joint return with his spouse, sum both incomes
    person(Person),finance(Exemption),
	first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),
    s151_individual(Taxp,Total_ex_taxpayer,Taxy),
    s151_individual(Spouse,Total_ex_spouse,Taxy),
    S2 = Total_ex_taxpayer+Total_ex_spouse.
s151(Taxp,S2,Person,Exemption,Taxy) :-
    % otherwise, it's just the individual's income
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year), 
    not s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),
    s151_individual_person(Taxp,S2,Person,Exemption,Taxy).

s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    start_(Joint_return,First_day_year),
    end_(Joint_return,Last_day_year).

% s151_individual where S2 is the sum of exemptions (removed Person_list and Exemptions_list)
s151_individual(Taxp,S2,Taxy) :-
    s151_b(Taxp,Exemption_amount_self,Taxy),
    Exempts_B = #sum{Exemption, Person : s151_b(Taxp,Person,Exemption,Taxy)},
    Exempts_C = #sum{Exemption, Person : s151_c(Taxp,Person,Exemption,Taxy)},
    S2=Exempts_B+Exempts_C+Exemption_amount_self.

% s151_individual where S2 is the sum of exemptions of taxp, Person is a dependent, 
% Exemption is the exemption of the person as the dependent of the taxpayer.
% TODO: double check that the function works the same as the original one
s151_individual_person(Taxp,S2,Person,Exemption,Taxy) :-
    s151_b(Taxp,Exemption_amount_self,Taxy),
    s151_b(Taxp,Person,Exempt_B,Taxy),
    s151_c(Taxp,Person,Exempt_C,Taxy),
    Exemption=Exempt_B+Exempt_C,
    Exempts_B = #sum{E, P : s151_b(Taxp,P,E,Taxy)},
    Exempts_C = #sum{E, P : s151_c(Taxp,P,E,Taxy)},
    S2=Exempts_B+Exempts_C+Exemption_amount_self.


%(a) Allowance of deductions

%In the case of an individual, the exemptions provided by this section shall be allowed as deductions in computing taxable income.
s151_a(Taxp,S2,Taxy) :- % simpler interface
    s151(Taxp,S2,_,_,Taxy).

%(b) Taxpayer and spouse

%An exemption of the exemption amount for the taxpayer; and an additional exemption of the exemption amount for the spouse of the taxpayer if a joint return is not made by the taxpayer and his spouse, and if the spouse, for the calendar year in which the taxable year of the taxpayer begins, has no gross income and is not the dependent of another taxpayer.
s151_b_applies(Taxp,Taxy):- % defining these auxiliary functions allows to test whether "a deduction under this section is allowable" without going into an infinite loop (b) -> (d) -> (b)...
    person(Taxp),year(Taxy). 
s151_b_applies(Taxp,Spouse,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
     % if a joint return is not made by the taxpayer and his spouse
    not s151_b_joint_return(Taxp,Spouse,Taxy),
    not s152(Spouse,_,Taxy), % if the spouse is not the dependent of another taxpayer
    gross_income(Spouse,Taxy,0). % if the spouse has no gross income

s151_b_joint_return(Taxp,Spouse,Taxy):-
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(Joint_return,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(Joint_return,Last_day_year).

s151_b(Taxp,Ea,Taxy) :- % An exemption of the exemption amount for the taxpayer
    s151_b_applies(Taxp,Taxy),
    s151_d(Taxp,Ea,Taxy).

s151_b(Taxp,Spouse,Ea,Taxy) :- % and an additional exemption of the exemption amount for the spouse
    s151_b_applies(Taxp,Spouse,Taxy),
    s151_d(Taxp,Ea,Taxy).

%(c) Additional exemption for dependents

%An exemption of the exemption amount for each individual who is a dependent (as defined in section 152) of the taxpayer for the taxable year.
s151_c_applies(Taxp,S24,Taxy) :- % defining this auxiliary function allows to test whether "a deduction under this section is allowable" without going into an inf loop (c) -> (d) -> (c)...
    s152(S24,Taxp,Taxy).

s151_c(Taxp,S24,Ea,Taxy) :-
    s151_c_applies(Taxp,S24,Taxy),
    s151_d(Taxp,Ea,Taxy).

%(d) Exemption amount

%For purposes of this section-
s151_d(Taxp,Ea,Taxy) :-
    % either the exemption amount is disallowed or it's one of those years (both set the exemption to 0)
    s151_d_2(Taxp,_,Ea,Taxy).
s151_d(Taxp,Ea,Taxy) :-
    person(Taxp),
    s151_d_5(Ea,Taxy).
s151_d(Taxp,Ea,Taxy) :-
    % or it isn't
    not s151_d_2(Taxp,_,_,Taxy),
    not s151_d_5(_,Taxy),
    s151_d_1(Exemption_in),
    % and Exemption_amount might have to be reduced
    s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy).

s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy):-
    s151_d_3(Taxp,Exemption_in,Ea,Taxy).
s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy):-
    person(Taxp),year(Taxy),finance(Exemption_in),
    not s151_d_3(Taxp,Exemption_in,Ea,Taxy),
    Ea = Exemption_in.

%(1) In general

%Except as otherwise provided in this subsection, the term "exemption amount" means $2,000.
s151_d_1(Ea) :-
    Ea = 2000.

%(2) Exemption amount disallowed in case of certain dependents

%In the case of an individual with respect to whom a deduction under this section is allowable to another taxpayer for a taxable year beginning in the calendar year in which the individual's taxable year begins, the exemption amount applicable to such individual for such individual's taxable year shall be zero.
s151_d_2(Taxp,Otaxp,Ea,Taxy) :-
    not Taxp = Otaxp,
    s151_b_or_c_applies(Otaxp,Taxp,Taxy),
    Ea = 0.

s151_b_or_c_applies(Otaxp,Taxp,Taxy):-
    s151_b_applies(Otaxp,Taxp,Taxy).
s151_b_or_c_applies(Otaxp,Taxp,Taxy):-
    s151_c_applies(Otaxp,Taxp,Taxy).

%(3) Phaseout
s151_d_3(Taxp,Exemption_amount_in,Ea,Taxy) :-
    s151_d_3_A(Taxp,_,_,_,Exemption_amount_in,Ea,Taxy).

%(A) In general

% Removed cut '!' operators, assumption that ASP can handle without cut operator
%In the case of any taxpayer whose adjusted gross income for the taxable year exceeds the applicable amount in effect under section 68(b), the exemption amount shall be reduced by the applicable percentage.
s151_d_3_A(Taxp,Agi,Aa,Ap,Exemption_amount_in,Ea,Taxy) :-
    finance(Exemption_amount_in),
    gross_income(Taxp,Taxy,Agi),
    s68_b(Taxp,Aa,Taxy),
    Agi>Aa,
    s151_d_3_B(Ap,Taxp,Agi,Taxy,_),
    Reduction_amount = (Exemption_amount_in*Ap)/100,
    max(Ea,Exemption_amount_in-Reduction_amount,0).

%(B) Applicable percentage

%For purposes of subparagraph (A), the term "applicable percentage" means 2 percentage points for each $2,500 (or fraction thereof) by which the taxpayer's adjusted gross income for the taxable year exceeds the applicable amount in effect under section 68(b). In the case of a married individual filing a separate return, the preceding sentence shall be applied by substituting "$1,250" for "$2,500". In no event shall the applicable percentage exceed 100 percent.
s151_d_3_B(Ap,Taxp,Agi,Taxy,Aa) :-
    gross_income(Taxp,Taxy,Agi),
    s68_b(Taxp,Aa,Taxy),
    max(Difference,Agi-Aa,0),
    s151_d_3_B_number(Taxp,Taxy,Number,Difference),
    min(Ap,Number,100).

s151_d_3_B_number(Taxp,Taxy,Number,Difference):-
    finance(Difference),
    s151_d_3_B_separate_return(Taxp,Taxy), Number = 2*(Difference/1250).
s151_d_3_B_number(Taxp,Taxy,Number,Difference):-
    person(Taxp),year(Taxy),finance(Difference),
    not s151_d_3_B_separate_return(Taxp,Taxy), Number = 2*(Difference/2500).

s151_d_3_B_separate_return(Taxp,Taxy):-
    s7703(Taxp,Spouse,_,Taxy),
    not s151_d_3_B_joint_return(Taxp,Taxy,Spouse).

s151_d_3_B_joint_return(Taxp,Taxy,Spouse):-
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(Joint_return,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(Joint_return,Last_day_year).

%(5) Special rules for taxable years 2018 through 2025
%
%In the case of a taxable year beginning after December 31, 2017, and before January 1, 2026, the term "exemption amount" means zero.
s151_d_5(Ea,Taxy) :-
    between(2018,2025,Taxy),
    Ea = 0.
