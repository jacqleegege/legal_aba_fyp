%§1. Tax imposed

% spouse(spouse).
% taxpayer(alice).
% dependent(dependent).
% marriage(alice_and_bob).
% date("2017-01-01").
% year(2017).
% finance(17330).
% joint_return(joint_return).

s1(Taxp, Taxy, Taxinc, Tax) :-
    s1_a(Taxp, Taxy, Taxinc, Tax).
s1(Taxp, Taxy, Taxinc, Tax) :-
    s1_b(Taxp, Taxy, Taxinc, Tax).
s1(Taxp, Taxy, Taxinc, Tax) :-
    s1_c(Taxp, Taxy, Taxinc, Tax).
s1(Taxp, Taxy, Taxinc, Tax) :-
    s1_d(Taxp, _, Taxy, Taxinc, Tax).

%(a) Married individuals filing joint returns and surviving spouses
s1_a(Taxp,Taxy,Taxinc,Tax) :-
    s1_a_1(Taxp,_,_,Taxy,Taxinc,Tax).
s1_a(Taxp,Taxy,Taxinc,Tax) :-
    s1_a_2(Taxp,Taxy,Taxinc,Tax).

%There is hereby imposed on the taxable income of-

%(1) every married individual (as defined in section 7703) who makes a single return jointly with his spouse, and
s1_a_1(Taxp,S4,Spouse,Taxy,Taxinc,Tax) :-
    s7703(Taxp,Spouse,_,Taxy),
    joint_return_(S4),
    agent_(S4,Taxp),
    agent_(S4,Spouse),
    first_day_year(Taxy,First_day),
    last_day_year(Taxy,Last_day),
    start_(S4,First_day),
    end_(S4,Last_day),
    not_nonresident_alien_cant_file_jointly(Taxp, Spouse, First_day, Last_day),
    s63(Taxp,Taxy,Taxinc),
    s1_a_tax(Taxinc,Tax).

agent2(Taxp,Spouse) :- spouse(Spouse), agent_(someone_is_nra,Taxp).
agent2(Taxp,Spouse) :- taxpayer(Taxp), agent_(someone_is_nra,Spouse).

start2(Start_time,First_day) :- date(Start_time), date(First_day), p(X),not_start_(someone_is_nra,_),Start_time=First_day.
start2(Start_time,First_day) :- date(Start_time), date(First_day), start_(someone_is_nra,Start_time).

end2(End_time, Last_day) :- date(End_time), date(Last_day),not_end_(someone_is_nra,_), End_time=Last_day.
end2(End_time, Last_day) :- date(End_time), date(Last_day),end_(someone_is_nra,End_time).
    
nonresident_alien_cant_file_jointly(Taxp,Spouse, First_day, Last_day) :-
    nonresident_alien_(someone_is_nra),
    agent2(Taxp,Spouse),
    start2(Start_time,First_day),
    end2(End_time, Last_day),
    is_before(Start_time,Last_day),
    is_before(First_day,End_time).

%(2) every surviving spouse (as defined in section 2(a)),
s1_a_2(Taxp,Taxy,Taxinc,Tax) :-
    s2_a(Taxp,_,Taxy),
    s63(Taxp,Taxy,Taxinc),
    s1_a_tax(Taxinc,Tax).

%Such tax shall be:
s1_a_tax(Taxinc,Tax) :-
    s1_a_i(Taxinc,Tax).
s1_a_tax(Taxinc,Tax) :-
    s1_a_ii(Taxinc,Tax).
s1_a_tax(Taxinc,Tax) :-
    s1_a_iii(Taxinc,Tax).
s1_a_tax(Taxinc,Tax) :-
    s1_a_iv(Taxinc,Tax).
s1_a_tax(Taxinc,Tax) :-
    s1_a_v(Taxinc,Tax).


%(i) 15% of taxable income if the taxable income is not over $36,900;
% s1_a_i(Taxinc,Tax) :-
%     finance(Taxinc), Taxinc <= 36900, Tax = (Taxinc*15)/100.
%(ii) $5,535, plus 28% of the excess over $36,900 if the taxable income is over $36,900 but not over $89,150;
s1_a_ii(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 89151,
    36900 < Taxinc,
    Tax = 5535+(Taxinc-36900)*28/100.
%(iii) $20,165, plus 31% of the excess over $89,150 if the taxable income is over $89,150 but not over $140,000;
s1_a_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 140001,
    89150 < Taxinc,
    Tax = 20165+(Taxinc-89150)*31/100.
%(iv) $35,928.50, plus 36% of the excess over $140,000 if the taxable income is over $140,000 but not over $250,000;
s1_a_iv(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 250001,
    140000 < Taxinc,
    Tax = 35929+(Taxinc-140000)*36/100.
%(v) $75,528.50, plus 39.6% of the excess over $250,000 if the taxable income is over $250,000.
s1_a_v(Taxinc,Tax) :-
    finance(Taxinc),
    250000 < Taxinc,
    Tax = 75529+(Taxinc-250000)*40/100.

%(b) Heads of households

%There is hereby imposed on the taxable income of every head of a household (as defined in section 2(b)) a tax determined in accordance with the following:
s1_b_subsections(Taxinc, Tax) :-
    s1_b_i(Taxinc,Tax).
s1_b_subsections(Taxinc, Tax) :-
    s1_b_ii(Taxinc,Tax).
s1_b_subsections(Taxinc, Tax) :-
    s1_b_iii(Taxinc,Tax).
s1_b_subsections(Taxinc, Tax) :-
    s1_b_iv(Taxinc,Tax).
s1_b_subsections(Taxinc, Tax) :-
    s1_b_v(Taxinc,Tax).

s1_b(Taxp,Taxy,Taxinc,Tax) :-
    s2_b(Taxp,_,Taxy),
    s63(Taxp,Taxy,Taxinc),
    s1_b_subsections(Taxinc, Tax).

%(i) 15% of taxable income if the taxable income is not over $29,600;
s1_b_i(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 29601,
    Tax = (Taxinc*15)/100.
%(ii) $4,440, plus 28% of the excess over $29,600 if the taxable income is over $29,600 but not over $76,400;
s1_b_ii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 76401,
    29600 < Taxinc,
    Tax = 4440+((Taxinc-29600)*28)/100.
%(iii) $17,544, plus 31% of the excess over $76,400 if the taxable income is over $76,400 but not over $127,500;
s1_b_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 127501,
    76400 < Taxinc,
    Tax = 17544+((Taxinc-76400)*31)/100.
%(iv) $33,385, plus 36% of the excess over $127,500 if the taxable income is over $127,500 but not over $250,000;
s1_b_iv(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 250001,
    127500 < Taxinc,
    Tax = 33385+((Taxinc-127500)*36)/100.
%(v) $77,485, plus 39.6% of the excess over $250,000 if the taxable income is over $250,000.
s1_b_v(Taxinc,Tax) :-
    finance(Taxinc),
    250000 < Taxinc,
    Tax = 77485+((Taxinc-250000)*396)/1000.

%(c) Unmarried individuals (other than surviving spouses and heads of households)

s1_c_subsections(Taxinc, Tax) :-
    s1_c_i(Taxinc,Tax).
s1_c_subsections(Taxinc, Tax) :-
    s1_c_ii(Taxinc,Tax).
s1_c_subsections(Taxinc, Tax) :-
    s1_c_iii(Taxinc,Tax).
s1_c_subsections(Taxinc, Tax) :-
    s1_c_iv(Taxinc,Tax).
s1_c_subsections(Taxinc, Tax) :-
    s1_c_v(Taxinc,Tax).

%There is hereby imposed on the taxable income of every individual (other than a surviving spouse as defined in section 2(a) or the head of a household as defined in section 2(b)) who is not a married individual (as defined in section 7703) a tax determined in accordance with the following:
s1_c(Taxp,Taxy,Taxinc,Tax) :-
    not_s2_a(Taxp,_,Taxy),
    not_s2_b(Taxp,_,Taxy),
    not_s7703(Taxp,_,_,Taxy),
    s63(Taxp,Taxy,Taxinc),
    s1_c_subsections(Taxinc, Tax).

%(i) 15% of taxable income if the taxable income is not over $22,100;
s1_c_i(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 22101,
    Tax = (Taxinc*15)/100.
%(ii) $3,315, plus 28% of the excess over $22,100 if the taxable income is over $22,100 but not over $53,500;
s1_c_ii(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 53501,
    22100 < Taxinc,
    Tax = 3315+((Taxinc-22100)*28)/100.
%(iii) $12,107, plus 31% of the excess over $53,500 if the taxable income is over $53,500 but not over $115,000;
s1_c_iii(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 115001,
    53500 < Taxinc,
    Tax = 12107+((Taxinc-53500)*31)/100.
%(iv) $31,172, plus 36% of the excess over $115,000 if the taxable income is over $115,000 but not over $250,000;
s1_c_iv(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 250001,
    115000 < Taxinc,
    Tax = 31172+((Taxinc-115000)*36)/100.
%(v) $79,772, plus 39.6% of the excess over $250,000 if the taxable income is over $250,000.
s1_c_v(Taxinc,Tax) :-
    finance(Taxinc),
    250000 < Taxinc,
    Tax = 79772+((Taxinc-250000)*396)/1000.

%(d) Married individuals filing separate returns
single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day) :-
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day),
    last_day_year(Taxy,Last_day),
    start_(Joint_return,First_day),
    end_(Joint_return,Last_day).

s1_d_subsections(Taxinc, Tax) :-
    s1_d_i(Taxinc,Tax).
s1_d_subsections(Taxinc, Tax) :-
    s1_d_ii(Taxinc,Tax).
s1_d_subsections(Taxinc, Tax) :-
    s1_d_iii(Taxinc,Tax).
s1_d_subsections(Taxinc, Tax) :-
    s1_d_iv(Taxinc,Tax).
s1_d_subsections(Taxinc, Tax) :-
    s1_d_v(Taxinc,Tax).

%There is hereby imposed on the taxable income of every married individual (as defined in section 7703) who does not make a single return jointly with his spouse, a tax determined in accordance with the following:
s1_d(Taxp,Spouse,Taxy,Taxinc,Tax) :-
    s7703(Taxp,Spouse,_,Taxy),
    not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
    s63(Taxp,Taxy,Taxinc),
    s1_d_subsections(Taxinc, Tax).

%(i) 15% of taxable income if the taxable income is not over $18,450;
s1_d_i(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 18451,
    Tax = (Taxinc*15)/100.
%(ii) $2,767.50, plus 28% of the excess over $18,450 if the taxable income is over $18,450 but not over $44,575;
s1_d_ii(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 44576,
    18450 < Taxinc,
    Tax = 2768+((Taxinc-18450)*28)/100.
%(iii) $10,082.50, plus 31% of the excess over $44,575 if the taxable income is over $44,575 but not over $70,000;
s1_d_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc < 70001,
    44575 < Taxinc,
    Tax = 10083+(Taxinc-44575)*31/100.
%(iv) $17,964.25, plus 36% of the excess over $70,000 if the taxable income is over $70,000 but not over $125,000;
s1_d_iv(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc < 125001,
    70000 < Taxinc,
    Tax = 17964 +(Taxinc-70000)*36/100.
%(v) $37,764.25, plus 39.6% of the excess over $125,000 if the taxable income is over $125,000
s1_d_v(Taxinc,Tax) :-
    finance(Taxinc), 
    125000 < Taxinc,
    Tax = 37764 +(Taxinc-125000)*396/1000.




% not_nonresident_alien_cant_file_jointly(Taxp, Spouse, First_day, Last_day) :- 
%     spouse(Spouse), 
%     taxpayer(Taxp), 
%     date(Last_day), 
%     date(First_day), 
%     not nonresident_alien_cant_file_jointly(Taxp, Spouse, First_day, Last_day).

% not_end_(someone_is_nra,Time) :- date(Time), not end_(someone_is_nra,Time).
% not_start_(someone_is_nra,Time) :- date(Time), not start_(someone_is_nra,Time).

% not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day) :- 
%     joint_return(Joint_return),
%     spouse(Spouse), 
%     taxpayer(Taxp), 
%     year(Taxy),
%     date(Last_day), 
%     date(First_day), 
%     not single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day).

% not_s2_a(Taxp,Spouse,Taxy) :- taxpayer(Taxp),year(Taxy), spouse(Spouse), not s2_a(Taxp,Spouse,Taxy).
% not_s2_b(Taxp,Dependent,Taxy) :- taxpayer(Taxp),year(Taxy),dependent(Dependent), not s2_b(Taxp,Dependent,Taxy).
% not_s7703(Taxp,Spouse,Marriage,Taxy) :- spouse(Spouse), marriage(Marriage), taxpayer(Taxp),year(Taxy),not s7703(Taxp,Spouse,Marriage,Taxy).

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).


contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).




min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 > Val2-1, Result = Val2.
min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val1.

max(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 > Val2-1, Result = Val1.
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
    not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),
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
    not_s151_b_joint_return(Taxp,Spouse,Taxy),
    not_s152(Spouse,_,Taxy), % if the spouse is not the dependent of another taxpayer
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
    not_s151_d_2(Taxp,_,_,Taxy),
    not_s151_d_5(_,Taxy),
    s151_d_1(Exemption_in),
    % and Exemption_amount might have to be reduced
    s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy).

s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy):-
    s151_d_3(Taxp,Exemption_in,Ea,Taxy).
s151_d_3_ea(Taxp,Exemption_in,Ea,Taxy):-
    person(Taxp),year(Taxy),finance(Exemption_in),
    not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),
    Ea = Exemption_in.

%(1) In general

%Except as otherwise provided in this subsection, the term "exemption amount" means $2,000.
s151_d_1(Ea) :-
    Ea = 2000.

%(2) Exemption amount disallowed in case of certain dependents

%In the case of an individual with respect to whom a deduction under this section is allowable to another taxpayer for a taxable year beginning in the calendar year in which the individual's taxable year begins, the exemption amount applicable to such individual for such individual's taxable year shall be zero.
s151_d_2(Taxp,Otaxp,Ea,Taxy) :-
    not_same_person(Taxp,Otaxp),
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
    not_s151_d_3_B_separate_return(Taxp,Taxy), Number = 2*(Difference/2500).

s151_d_3_B_separate_return(Taxp,Taxy):-
    s7703(Taxp,Spouse,_,Taxy),
    not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse).

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

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
assumption(not_s152(Dependent,Taxp,Taxy)).
assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
assumption(not_s151_d_5(Ea,Taxy)).
assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).


contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
contrary(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)) :-
    assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
contrary(not_s151_b_joint_return(Taxp,Spouse,Taxy),s151_b_joint_return(Taxp,Spouse,Taxy)) :-
    assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
contrary(not_s152(Dependent,Taxp,Taxy),s152(Dependent,Taxp,Taxy)) :-
    assumption(not_s152(Dependent,Taxp,Taxy)).
contrary(not_s151_d_2(Taxp,Otaxp,Ea,Taxy),s151_d_2(Taxp,Otaxp,Ea,Taxy)) :-
    assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
contrary(not_s151_d_5(Ea,Taxy),s151_d_5(Ea,Taxy)) :-
    assumption(not_s151_d_5(Ea,Taxy)).
contrary(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),s151_d_3(Taxp,Exemption_in,Ea,Taxy)) :-
    assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
contrary(not_s151_d_3_B_separate_return(Taxp,Taxy),s151_d_3_B_separate_return(Taxp,Taxy)) :-
    assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
contrary(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse),s151_d_3_B_joint_return(Taxp,Taxy,Spouse)) :-
    assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
later(Result, Date1, Date2) :-
    date(Date1), date(Date2), Date1 >= Date2, Result = Date1.
later(Result, Date1, Date2) :-
    date(Date1), date(Date2), Date1 < Date2, Result = Date2.

earlier(Result, Date1, Date2) :-
    date(Date1), date(Date2), Date1 >= Date2, Result = Date2.
earlier(Result, Date1, Date2) :-
    date(Date1), date(Date2), Date1 < Date2, Result = Date1.

%§152. Dependent defined
% Assumption that Dependent and Taxp are pre-defined
s152(Dependent,Taxp,Taxy) :-
    not_same_person(Dependent,Taxp),
	not_s152_b_1(Taxp,_,Taxy), % check that the taxpayer is eligible to have depedents
    s152_a(Dependent,Taxp,Taxy,_,_),
	not_s152_b_2(Dependent,_,_,Taxy). % check that the dependent is eligible

%(a) In general

%For purposes of this subtitle, the term "dependent" means-
s152_a(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    date(Start_relationship),date(End_relationship),s152_a_1(Dependent,Taxp,Taxy).
s152_a(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    s152_a_2(Dependent,Taxp,Taxy,Start_relationship,End_relationship).

%(1) a qualifying child, or
s152_a_1(Dependent,Taxp,Taxy) :-
    s152_c(Dependent,Taxp,Taxy).

%(2) a qualifying relative.
s152_a_2(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    s152_d(Dependent,Taxp,Taxy,Start_relationship,End_relationship).

%(b) Exceptions

%For purposes of this section-
s152_b(Dependent,Taxp,Taxy) :-
    person(Dependent),s152_b_1(Taxp,_,Taxy).
s152_b(Dependent,Taxp,Taxy) :-
    person(Taxp),s152_b_2(Dependent,_,_,Taxy).

%(1) Dependents ineligible

%If an individual is a dependent of a taxpayer for any taxable year of such taxpayer beginning in a calendar year, such individual shall be treated as having no dependents for any taxable year of such individual beginning in such calendar year.
s152_b_1(Taxp,Otaxp,Taxy) :-
    s152(Taxp,Otaxp,Taxy).

%(2) Married dependents

%An individual shall not be treated as a dependent of a taxpayer under subsection (a) if such individual has made a joint return with the individual's spouse for the taxable year beginning in the calendar year in which the taxable year of the taxpayer begins.
s152_b_2(Dependent,S21,Spouse,Taxy) :-
    s7703(Dependent,Spouse,_,Taxy),
    joint_return_(S21),
    agent_(S21,Dependent),
    agent_(S21,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(S21,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(S21,Last_day_year).

%(c) Qualifying child

%For purposes of this section-
s152_c(Dependent,Taxp,Taxy) :-
    s152_c_1(Dependent,Taxp,Taxy).

%(1) In general

%The term "qualifying child" means, with respect to any taxpayer for any taxable year, an individual-
s152_c_1(Dependent,Taxp,Taxy) :-
    s152_c_1_A(Dependent,Taxp,Start_relationship,End_relationship),
    s152_c_1_B(Dependent,_,Taxp,Start_relationship,End_relationship,Taxy),
    s152_c_1_C(Dependent,Taxp,Taxy),
    s152_c_1_E(Dependent,_,Taxy).

%(A) who bears a relationship to the taxpayer described in paragraph (2),
s152_c_1_A(Dependent,Taxp,Start_relationship,End_relationship) :-
    s152_c_2(Dependent,Taxp,Start_relationship,End_day),
	individual_death_time(Taxp,End_t,End_day),
    individual_death_time(Dependent,End_i,End_day),
    earlier(Earlier,End_t,End_i),
    earlier(End_relationship,Earlier,End_day).

individual_death_time(Individual,End_time,End_day):-
    date(End_day),individual_death(Individual,Death_time),End_time=Death_time.
individual_death_time(Individual,End_time,End_day):-
    person(Individual),date(Death_time),date(End_day),not_individual_death(Individual,Death_time),End_time=End_day.

individual_death(Individual,Death_time):-
    death_(Death_individual),
    agent_(Death_individual,Individual),
    start_(Death_individual,Death_time).

%(B) who has the same principal place of abode as the taxpayer for more than one-half of such taxable year,
s152_c_1_B(Dependent,S38,Taxp,Start_relationship,End_relationship,Taxy) :-
    residence_(Residence_individual),
    agent_(Residence_individual,Dependent),
    patient_(Residence_individual,S38),
    % get first day the Dependent lived at Place_of_abode; if unspecified, take first day of Taxy
	start_individual_residence(Residence_individual,Taxy,Start_individual),
    % get last day the Dependent lived at Place_of_abode; if ongoing, take last day of Taxy
	end_individual_residence(Residence_individual,Taxy,End_individual),
    residence_(Residence_taxpayer),
    agent_(Residence_taxpayer,Taxp),
    patient_(Residence_taxpayer,S38),
    % get first day the Taxp lived at Place_of_abode; if unspecified, take first day of Taxy
	start_individual_residence(Residence_taxpayer,Taxy,Start_taxpayer),
    % get last day the Taxp lived at Place_of_abode; if ongoing, take last day of Taxy
    end_individual_residence(Residence_taxpayer,Taxy,End_taxpayer),
	% now compute overlap of Taxy, time when Taxp resided at Place_of_abode, and Dependent resided at Place_of_abode
    last_day_year(Taxy,Last_day_of_year),
    earlier(End1,End_individual,End_taxpayer),
    earlier(End2,Last_day_of_year,End_relationship),
    earlier(End_day,End1,End2),
    first_day_year(Taxy,First_day_of_year),
    later(Start1,Start_individual,Start_taxpayer),
    later(Start2,First_day_of_year,Start_relationship),
    later(Start_day,Start1,Start2),
    duration(Start_day,End_day,Years,Months,Days),
	more_than_half_a_year(Years,Months).

start_individual_residence(Residence_individual,Taxy,Start_individual):-
    year(Taxy),start_(Residence_individual,Start_individual).
start_individual_residence(Residence_individual,Taxy,Start_individual):-
    year(Taxy),residence_(Residence_individual),
    not_start_(Residence_individual,Start_individual),first_day_year(Taxy,Start_individual).

end_individual_residence(Residence_individual,Taxy,End_individual):-
    year(Taxy),end_(Residence_individual,End_individual).
end_individual_residence(Residence_individual,Taxy,End_individual):-
    residence_(Residence_individual),not_end_(Residence_individual,End_individual),last_day_year(Taxy,End_individual).


%(C) who meets the age requirements of paragraph (3), and
s152_c_1_C(Dependent,Taxp,Taxy) :-
    s152_c_3(Dependent,Taxp,Taxy).

%(E) who has not filed a joint return (other than only for a claim of refund) with the individual's spouse for the taxable year beginning in the calendar year in which the taxable year of the taxpayer begins.
s152_c_1_E(Dependent,Spouse,Taxy) :-
    person(Dependent),person(Spouse),year(Taxy),not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy).

s152_c_1_E_joint_return(Dependent,Spouse,Taxy):-
    s7703(Dependent,Spouse,_,Taxy),
    joint_return_(Joint_return),
    agent_(Joint_return,Dependent),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(Joint_return,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(Joint_return,Last_day_year).

%(2) Relationship

%For purposes of paragraph (1)(A), an individual bears a relationship to the taxpayer described in this paragraph if such individual is-
s152_c_2(Dependent,Taxp,Start_relationship,End_relationship) :-
    s152_c_2_A(Dependent,Taxp,_,Start_relationship,End_relationship).
s152_c_2(Dependent,Taxp,Start_relationship,End_relationship) :-
    s152_c_2_B(Dependent,Taxp,_,Start_relationship,End_relationship).

%(A) a child of the taxpayer or a descendant of such a child, or
s152_c_2_A(Dependent,Taxp,Childc2a,Start_relationship,End_relationship) :-
	is_child_of(Childc2a,Taxp,Start_child,End_child),
    Dependent=Childc2a,
    Start_relationship=Start_child,
    End_relationship=End_child.
s152_c_2_A(Dependent,Taxp,Childc2a,Start_relationship,End_relationship) :-
    is_child_of(Childc2a,Taxp,Start_child,End_child),
    not_same_person(Dependent,Childc2a),
    is_descendent_of(Dependent,Childc2a,Start_relationship,End_relationship).

%(B) a brother, sister, stepbrother, or stepsister of the taxpayer or a descendant of any such relative.
s152_c_2_B(S65,Taxp,Bsssc2b,Start_relationship,End_relationship) :-
	% a brother, sister, stepbrother, or stepsister of the taxpayer
	s152_c_2_B_sibling(Bsssc2b,Taxp,Start_relationship,End_relationship),
    s152_c_2_B_S65(S65,Bsssc2b,Start_relationship,End_relationship).

s152_c_2_B_sibling(Bsssc2b,Taxp,Start_relationship,End_relationship):-
    is_sibling_of(Bsssc2b,Taxp,Start_relationship,End_relationship).
s152_c_2_B_sibling(Bsssc2b,Taxp,Start_relationship,End_relationship):-
    is_stepsibling_of(Bsssc2b,Taxp,Start_relationship,End_relationship).

s152_c_2_B_S65(S65,Bsssc2b,Start_relationship,End_relationship):-
    person(Bsssc2b),date(Start_relationship),date(End_relationship),
    S65 = Bsssc2b.
s152_c_2_B_S65(S65,Bsssc2b,Start_relationship,End_relationship):-
    % or a descendant of any such relative
    is_descendent_of(S65,Bsssc2b,Start_relationship,End_relationship).


%(3) Age requirements

%For purposes of paragraph (1)(C), an individual meets the requirements of this paragraph if such individual is younger than the taxpayer claiming such individual as a qualifying child and is less than 25 years old at the end of the taxable year.
s152_c_3(Dependent,Taxp,Taxy) :-
    % if Dependent is a descendant of Taxpayer and no dates of birth are specified, I'm going
    % to assume the predicate holds (although there could be exceptions, e.g. adoption).
    % This is to avoid making rules fail just because we didn't specify dates of birth.
    birth_(Individual_is_born),
    agent_(Individual_is_born,Dependent),
    start_(Individual_is_born,Individual_dob),
    birth_(Taxpayer_is_born),
    agent_(Taxpayer_is_born,Taxp),
    start_(Taxpayer_is_born,Taxpayer_dob),
    is_before(Taxpayer_dob,Individual_dob),
	% is less than 25 years old at the end of the taxable year.
	s152_c_3_dependent(Individual_is_born),
	agent_(Individual_is_born,Dependent),
	start_(Individual_is_born,Individual_dob),
	last_day_year(Taxy,Last_day_year),
	duration(Individual_dob,Last_day_year,Y,M,D),
	Y > 24.
s152_c_3(Dependent,Taxp,Taxy) :-
    not_s152_c_3_dependent_born(Dependent),
    is_descendent_of(Dependent,Taxp,_,_),
    % is less than 25 years old at the end of the taxable year.
	s152_c_3_dependent(Individual_is_born),
	agent_(Individual_is_born,Dependent),
	start_(Individual_is_born,Individual_dob),
	last_day_year(Taxy,Last_day_year),
	duration(Individual_dob,Last_day_year,Y,M,D),
	Y > 24.

s152_c_3_dependent_born(Dependent):-
    birth_(Someone_is_born),
    agent_(Someone_is_born,Dependent).

s152_c_3_dependent(Individual_is_born):-
    birth_(Individual_is_born).
s152_c_3_dependent(Individual_is_born):-
    son_(Individual_is_born).
s152_c_3_dependent(Individual_is_born):-
    daughter_(Individual_is_born).


%(d) Qualifying relative

%For purposes of this section-
s152_d(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    s152_d_1(Dependent,Taxp,Taxy,Start_relationship,End_relationship).

%(1) In general

%The term "qualifying relative" means, with respect to any taxpayer for any taxable year, an individual-
s152_d_1(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    s152_d_1_A(Dependent,Taxp,Taxy,Start_relationship,End_relationship),
    s152_d_1_B(Dependent,Taxy),
    s152_d_1_D(Dependent,Taxy).

%(A) who bears a relationship to the taxpayer described in paragraph (2),
s152_d_1_A(Dependent,Taxp,Taxy,Start_relationship,End_relationship) :-
    s152_d_2(Dependent,Taxp,Taxy,Start_relationship,End_day),
    individual_death_time(Taxp,End_t,End_day),
    individual_death_time(Dependent,End_i,End_day),
	earlier(Earlier,End_t,End_i),
    earlier(End_relationship,Earlier,End_day).

%(B) who has no income for the calendar year in which such taxable year begins, and
s152_d_1_B(Dependent,Taxy) :-
    gross_income(Dependent,Taxy,Gross_income),
    Gross_income = 0.

%(D) who is not a qualifying child of such taxpayer or of any other taxpayer for any taxable year beginning in the calendar year in which such taxable year begins.
s152_d_1_D(Dependent,Taxy) :-
    person(Dependent),year(Taxy),
    not_s152_c(Dependent,_,Taxy).

%(2) Relationship
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :-
    year(Taxy),s152_d_2_A(Dependent,Taxp,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :- 
    year(Taxy),s152_d_2_B(Dependent,Taxp,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :-
    year(Taxy),s152_d_2_C(Dependent,Taxp,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :-    
    year(Taxy),s152_d_2_D(Dependent,Taxp,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :- 
    year(Taxy),s152_d_2_E(Dependent,Taxp,_,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :- 
    year(Taxy),s152_d_2_F(Dependent,Taxp,_,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :- 
    year(Taxy),s152_d_2_G(Dependent,Taxp,Start_day,End_day).
s152_d_2(Dependent,Taxp,Taxy,Start_day,End_day) :- 
    s152_d_2_H(Dependent,Taxp,Taxy,_,Start_day,End_day).

%For purposes of paragraph (1)(A), an individual bears a relationship to the taxpayer described in this paragraph if the individual is any of the following with respect to the taxpayer:

%(A) A child or a descendant of a child.
s152_d_2_A(Dependent,Taxp,Start_day,End_day) :-
	is_child_of(Child,Taxp,Start_child,End_child),
    Dependent=Child,
    Start_day=Start_child,
    End_day=End_child.
s152_d_2_A(Dependent,Taxp,Start_day,End_day) :-
    is_child_of(Child,Taxp,Start_child,End_child),
    not_same_person(Dependent,Child),
    is_descendent_of(Dependent,Child,Start_day,End_day).

%(B) A brother, sister, stepbrother, or stepsister.
s152_d_2_B(Dependent,Taxp,Start_day,End_day) :-
    is_sibling_of(Dependent,Taxp,Start_day,End_day).
s152_d_2_B(Dependent,Taxp,Start_day,End_day) :-
    is_stepsibling_of(Dependent,Taxp,Start_day,End_day).

%(C) The father or mother, or an ancestor of either.
s152_d_2_C(S113,Taxp,Start_day,End_day) :-
	is_descendent_of(Taxp,S113,Start_day,End_day).

%(D) A stepfather or stepmother.
s152_d_2_D(Dependent,Taxp,Start_day,End_day) :-
    is_stepparent_of(Dependent,Taxp,Start_day,End_day).

%(E) A son or daughter of a brother or sister of the taxpayer.
s152_d_2_E(Dependent,Taxp,S121,Start_day,End_day) :-
    is_sibling_of(Taxp,S121,Start_day_sibling,End_day_sibling),
    is_child_of(Dependent,S121,Start_day_child,End_day_child),
    later(Start_day,Start_day_sibling,Start_day_child),
    earlier(End_day,End_day_sibling,End_day_child).

%(F) A brother or sister of the father or mother of the taxpayer.
s152_d_2_F(Dependent,Taxp,S125,Start_day,End_day) :-
    is_child_of(Taxp,S125,Start_day_child,End_day_child),
    is_sibling_of(S125,Dependent,Start_day_sibling,End_day_sibling),
    later(Start_day,Start_day_sibling,Start_day_child),
    earlier(End_day,End_day_sibling,End_day_child).

%(G) A son-in-law, daughter-in-law, father-in-law, mother-in-law, brother-in-law, or sister-in-law.
s152_d_2_G(Dependent,Taxp,Start_day,End_day) :-
    is_child_in_law_of(Dependent,Taxp,Start_day,End_day).
s152_d_2_G(Dependent,Taxp,Start_day,End_day) :-
    is_parent_in_law_of(Dependent,Taxp,Start_day,End_day).
s152_d_2_G(Dependent,Taxp,Start_day,End_day) :-
    is_sibling_in_law_of(Dependent,Taxp,Start_day,End_day).

%(H) An individual (other than an individual who at any time during the taxable year was the spouse, determined without regard to section 7703, of the taxpayer) who, for the taxable year of the taxpayer, has the same principal place of abode as the taxpayer and is a member of the taxpayer's household.
s152_d_2_H(Dependent,Taxp,Taxy,S143,Start_day,End_day) :-
    not_same_person(Dependent,Taxp),
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year),
    residence_(Taxpayer_residence),
    agent_(Taxpayer_residence,Taxp),
    patient_(Taxpayer_residence,S145),
    start_(Taxpayer_residence,Start_taxpayer_residence),
    is_before(Start_taxpayer_residence,First_day_year),
	s152_d_2_H_end_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year),
    residence_(Individual_residence),
    agent_(Individual_residence,Dependent),
    patient_(Individual_residence,S143),
    start_(Individual_residence,Start_individual_residence),
    is_before(Start_individual_residence,First_day_year),
	s152_d_2_H_end_residence(Individual_residence,End_individual_residence,Last_day_year),
    later(Start_day,Start_taxpayer_residence,Start_individual_residence),
    earliest(End_day,End_taxpayer_residence,End_individual_residence),
	S145=S143.

s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year):-
    marriage_(Marriage),
    agent_(Marriage,Dependent),
    agent_(Marriage,Taxp),
    start_(Marriage,Start),
    is_before(Start,Last_day_year),
    end_(Marriage,End),
    is_before(First_day_year,End).
s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year):-
    date(First_day_year),
    marriage_(Marriage),
    agent_(Marriage,Dependent),
    agent_(Marriage,Taxp),
    start_(Marriage,Start),
    is_before(Start,Last_day_year),
    not_end_(Marriage,_).

s152_d_2_H_end_residence(Individual_residence,End_individual_residence,Last_day_year):-
    end_(Individual_residence,End_individual_residence),is_before(Last_day_year,End_individual_residence).
s152_d_2_H_end_residence(Individual_residence,End_individual_residence,Last_day_year):-
    residence_(Individual_residence),date(End_individual_residence),date(Last_day_year),
    not_end_(Individual_residence,_).

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
assumption(not_s152(Dependent,Taxp,Taxy)).
assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
assumption(not_s151_d_5(Ea,Taxy)).
assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
assumption(not_s152_b_1(Taxp,Otaxp,Taxy)).
assumption(not_s152_b_2(Dependent,S21,Spouse,Taxy)).
assumption(not_individual_death(Individual,Death_time)).
assumption(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy)).
assumption(not_s152_c_3_dependent_born(Dependent)).
assumption(not_s152_c(Dependent,Taxp,Taxy)).
assumption(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)).

contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
contrary(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)) :-
    assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
contrary(not_s151_b_joint_return(Taxp,Spouse,Taxy),s151_b_joint_return(Taxp,Spouse,Taxy)) :-
    assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
contrary(not_s152(Dependent,Taxp,Taxy),s152(Dependent,Taxp,Taxy)) :-
    assumption(not_s152(Dependent,Taxp,Taxy)).
contrary(not_s151_d_2(Taxp,Otaxp,Ea,Taxy),s151_d_2(Taxp,Otaxp,Ea,Taxy)) :-
    assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
contrary(not_s151_d_5(Ea,Taxy),s151_d_5(Ea,Taxy)) :-
    assumption(not_s151_d_5(Ea,Taxy)).
contrary(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),s151_d_3(Taxp,Exemption_in,Ea,Taxy)) :-
    assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
contrary(not_s151_d_3_B_separate_return(Taxp,Taxy),s151_d_3_B_separate_return(Taxp,Taxy)) :-
    assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
contrary(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse),s151_d_3_B_joint_return(Taxp,Taxy,Spouse)) :-
    assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
contrary(not_s152_b_1(Taxp,Otaxp,Taxy),s152_b_1(Taxp,Otaxp,Taxy)) :-
    assumption(not_s152_b_1(Taxp,Otaxp,Taxy)).
contrary(not_s152_b_2(Dependent,S21,Spouse,Taxy),s152_b_2(Dependent,S21,Spouse,Taxy)) :-
    assumption(not_s152_b_2(Dependent,S21,Spouse,Taxy)).
contrary(not_individual_death(Individual,Death_time),individual_death(Individual,Death_time)) :-
    assumption(not_individual_death(Individual,Death_time)).
contrary(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy),s152_c_1_E_joint_return(Dependent,Spouse,Taxy)) :-
    assumption(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy)).
contrary(not_s152_c_3_dependent_born(Dependent),s152_c_3_dependent_born(Dependent)) :-
    assumption(not_s152_c_3_dependent_born(Dependent)).
contrary(not_s152_c(Dependent,Taxp,Taxy),s152_c(Dependent,Taxp,Taxy)) :-
    assumption(not_s152_c(Dependent,Taxp,Taxy)).
contrary(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year),s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)) :-
    assumption(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)).%§2. Definitions and special rules
% person(alice).
% person(spouse).
% year(2017).
% date("2017-01-01").


%(a) Definition of surviving spouse
s2_a(Taxp,Spouse,Taxy) :-
    s2_a_1(Taxp,Spouse,Previous_marriage,_,_,Taxy),
    not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy).

%(1) In general

%For purposes of section 1, the term "surviving spouse" means a taxpayer-
s2_a_1(Taxp,Spouse,Previous_marriage,Household,Dependent,Taxy) :-
    s2_a_1_A(Taxp,Spouse,Previous_marriage,_,Taxy),
    s2_a_1_B(Taxp,Household,Dependent,Taxy).

% check whether the marriage ended with the death of the spouse
marriage_not_ended_with_spouse_death(Marriage, End_marriage, Time_death) :-
    marriage_(Marriage), date(End_marriage), 
    date(Time_death), not_end_(Marriage,_).
marriage_not_ended_with_spouse_death(Marriage, End_marriage, Time_death) :-
    end_(Marriage,End_marriage),
    is_before(Time_death,End_marriage).

%(A) whose spouse died during either of the two years immediately preceding the taxable year, and
s2_a_1_A(Taxp,Spouse,Marriage,YS,Taxy) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not_same_person(Taxp,Spouse),
    start_(Marriage,Start_marriage),
    death_(Death),
    agent_(Death,Spouse),
    start_(Death,Time_death),
    date_split(Time_death,YS,M,D),
    is_before(Start_marriage,Time_death),
    % check whether the marriage ended with the death of the spouse
    marriage_not_ended_with_spouse_death(Marriage, End_marriage, Time_death),
    Taxy2 = Taxy-2,
    first_day_year(Taxy2,First_day_year),
    is_before(First_day_year,Time_death),
    Taxy1 = Taxy-1,
    last_day_year(Taxy1,Last_day_year),
    is_before(Time_death,Last_day_year).

% %(B) who maintains as his home a household which constitutes for the taxable year the principal place of abode (as a member of such household) of a dependent (i) who (within the meaning of section 152) is a son, stepson, daughter, or stepdaughter of the taxpayer, and (ii) with respect to whom the taxpayer is entitled to a deduction for the taxable year under section 151.

taxp_residence_not_end_after_year(Taxpayer_residence,End_taxpayer_residence,Last_day_year) :-
    date(End_taxpayer_residence), residence_(Taxpayer_residence),
    date(Last_day_year), not_end_(Taxpayer_residence,_).
taxp_residence_not_end_after_year(Taxpayer_residence,End_taxpayer_residence,Last_day_year) :-
    end_(Taxpayer_residence,End_taxpayer_residence),
    is_before(Last_day_year,End_taxpayer_residence).

dependent_residence_not_end_after_year(Dependent_residence,End_dependent_residence, Last_day_year) :-
    date(End_dependent_residence), residence_(Dependent_residence),
    date(Last_day_year), not_end_(Dependent_residence,_).
dependent_residence_not_end_after_year(Dependent_residence,End_dependent_residence, Last_day_year) :-
    end_(Dependent_residence,End_dependent_residence),
    is_before(Last_day_year,End_dependent_residence).

is_relative_of_taxpayer(Dependent,Taxp,Start_dependent,End_dependent,First_day_year,Last_day_year):-
    is_child_of(Dependent,Taxp,Start_dependent,End_dependent),
    is_before(Start_dependent,First_day_year),
    is_before(Last_day_year,End_dependent).
is_relative_of_taxpayer(Dependent,Taxp,Start_dependent,End_dependent,First_day_year,Last_day_year):-
    is_stepparent_of(Taxp,Dependent,Start_dependent,End_dependent),
    is_before(Start_dependent,First_day_year),
    is_before(Last_day_year,End_dependent).

% %For purposes of this paragraph, an individual shall be considered as maintaining a household only if over half of the cost of maintaining the household during the taxable year is furnished by such individual.
s2_a_1_B(Taxp,Household,Dependent,Taxy) :-
    % who maintains as his home a household
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    residence_(Taxpayer_residence),
    agent_(Taxpayer_residence,Taxp),
    patient_(Taxpayer_residence,Household),
    start_(Taxpayer_residence,Start_taxpayer_residence),
    is_before(Start_taxpayer_residence,First_day_year),
    taxp_residence_not_end_after_year(Taxpayer_residence,End_taxpayer_residence,Last_day_year),
    % which constitutes for the taxable year the principal place of abode (as a member of such household) of...
    residence_(Dependent_residence),
    agent_(Dependent_residence,Dependent),
    patient_(Dependent_residence,Household),
    start_(Dependent_residence,Start_dependent_residence),
    is_before(Start_dependent_residence,First_day_year),
    dependent_residence_not_end_after_year(Dependent_residence,End_dependent_residence, Last_day_year),
    s7703_b_2(Taxp,Household,_,Taxy), % such individual furnishes over one-half of the cost of maintaining such household during the taxable year
    is_relative_of_taxpayer(Dependent,Taxp,Start_dependent,End_dependent,First_day_year,Last_day_year),
    s151_c_applies(Taxp,Dependent,Taxy).

%(2) Limitations

%Notwithstanding paragraph (1), for purposes of section 1 a taxpayer shall not be considered to be a surviving spouse-
s2_a_2(Taxp,Spouse,Previous_marriage,Taxy) :-
    person(Spouse),
    s2_a_2_A(Taxp,_,Previous_marriage,_,Taxy);
    not_s2_a_2_B(Taxp,Spouse,Taxy).

%(A) if the taxpayer has remarried at any time before the close of the taxable year, or
s2_a_2_A(Taxp,Remarriage,Previous_marriage,S31,Taxy) :-
    marriage_(Previous_marriage),
    agent_(Previous_marriage,Taxp),
    start_(Previous_marriage,Start_previous_marriage),
    marriage_(Remarriage),
    agent_(Remarriage,Taxp),
    start_(Remarriage,S31),
    not_same_marriage(Remarriage,Previous_marriage),
    is_before(Start_previous_marriage,S31),
    last_day_year(Taxy,Last_day_year),
    is_before(S31,Last_day_year).

agent2_1(Taxp,Spouse) :- person(Spouse), agent_(Someone_is_nra,Taxp).
agent2_1(Taxp,Spouse) :- person(Taxp), agent_(Someone_is_nra,Spouse).

start2(Someone_is_nra, Start_nra, Taxy, Last_day_year) :- 
    year(Taxy),date(Start_nra),date(Last_day_year),
    nonresident_alien_(Someone_is_nra),not_start_(Someone_is_nra,_).
start2(Someone_is_nra, Start_nra, Taxy, Last_day_year) :- 
    start_(Someone_is_nra,Start_nra),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_nra,Last_day_year).

end2(Someone_is_nra, End_nra, Taxy, First_day_year) :- 
    year(Taxy),date(End_nra),date(First_day_year),
    nonresident_alien_(Someone_is_nra),not_end_(Someone_is_nra,_).
end2(Someone_is_nra, End_nra, Taxy, First_day_year) :- 
    end_(Someone_is_nra,End_nra),
    first_day_year(Taxy,First_day_year),
    is_before(First_day_year,End_nra).
    
nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year) :-
    nonresident_alien_(Someone_is_nra),
    agent2_1(Taxp,Spouse),
    start2(Someone_is_nra, Start_nra, Taxy, Last_day_year),
    end2(Someone_is_nra, End_nra, Taxy, First_day_year).


%(B) unless, for the taxpayer's taxable year during which his spouse died, a joint return could have been made. 
% A husband and wife may make a single return jointly of income taxes, 
% even though one of the spouses has neither gross income nor deductions, 
% except that no joint return shall be made if either the husband or wife at any time during the taxable year is a nonresident alien.
s2_a_2_B(Taxp,Spouse,Taxy) :-
    % no joint return shall be made if either the husband or wife at any time during the taxable year is a nonresident alien
    person(Taxp),person(Spouse),nonresident_alien_(Someone_is_nra), 
    date(Start_nra), date(End_nra), year(Taxy), 
date(First_day_year), date(Last_day_year),
    not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year).

%(b) Definition of head of household
s2_b(Taxp,Dependent,Taxy) :- 
    s2_b_1(Taxp,_,Dependent,Taxy),
    % s2_b_2 was incorporated directly into s2_b_1
    not_s2_b_3(Taxp,Dependent,Taxy).

%(1) In general

individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not_same_person(Taxp,Spouse),
    start_(Marriage,Start_marriage),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_marriage,Last_day_year),
    individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year),
    not_s2_b_2_A(_,_,_,Marriage,Taxy),
    not_s2_b_2_B(Taxp,Spouse,Taxy).

individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    death_(Spouse_dies),
    agent_(Spouse_dies,Spouse),
    individual_married_3(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year).
individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    death_(Spouse_dies),person(Spouse),date(Death_time),
    date(Last_day_year),person(Taxp),not_spouse_dead(Spouse_dies,Spouse),
    individual_married_4(Marriage,End_marriage,Taxy,First_day_year1).

spouse_dead(Spouse_dies,Spouse):-
    death_(Spouse_dies),
    agent_(Spouse_dies,Spouse).

individual_married_3(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    death_(Spouse_dies),date(Death_time),
    date(Last_day_year), s2_b_2_C(Taxp,Marriage,Spouse,Taxy). % spouse died during the year
individual_married_3(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    marriage_(Marriage),person(Spouse),person(Taxp),year(Taxy),
    start_(Spouse_dies,Death_time), % spouse died after year considered
    is_before(Last_day_year,Death_time).

individual_married_4(Marriage,End_marriage,Taxy,First_day_year1):-
    % marriage has ended
    end_(Marriage,End_marriage),
    Taxy1 = Taxy+1,
    first_day_year(Taxy1,First_day_year1),
    is_before(First_day_year1,End_marriage).
individual_married_4(Marriage,End_marriage,Taxy,First_day_year1):-
    % marriage has not ended
    marriage_(Marriage),date(End_marriage),
    date(First_day_year1), year(Taxy),
    not_end_(Marriage,_).

s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy):-
    s2_b_1_A(Taxp,Household,Dependent,Taxy).
s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy):-
    s2_b_1_B(Taxp,Household,Dependent,_,Taxy).

%An individual shall be considered a head of a household if, and only if, such individual is not married at the close of his taxable year, is not a surviving spouse (as defined in subsection (a)), and either-
s2_b_1(Taxp,Household,Dependent,Taxy) :-
    death_(Spouse_dies),person(Spouse),date(Death_time),
    date(Last_day_year),marriage_(Marriage),date(Start_marriage),
    not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
    not_s2_a(Taxp,_,Taxy),
    s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy).

not_start_taxp_residence(Taxpayer_residence,Start_taxpayer_residence,First_day_year):-
    date(First_day_year),date(Start_taxpayer_residence),
    residence_(Taxpayer_residence),not_start_(Taxpayer_residence,_).
not_start_taxp_residence(Taxpayer_residence,Start_taxpayer_residence,First_day_year):-
    start_(Taxpayer_residence,Start_taxpayer_residence),
    is_before(Start_taxpayer_residence,First_day_year).

not_end_taxp_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year):-
    date(Last_day_year),date(End_taxpayer_residence),
    residence_(Taxpayer_residence),not_end_(Taxpayer_residence,End_taxpayer_residence).
not_end_taxp_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year):-
    end_(Taxpayer_residence,End_taxpayer_residence),
    is_before(Last_day_year,End_taxpayer_residence).

start_individual_residence(Individual_residence,Start_individual_residence,First_day_year):-
    date(First_day_year),residence_(Individual_residence),
    date(Start_individual_residence),not_start_(Individual_residence,_),
    Start_individual_residence = First_day_year.
start_individual_residence(Individual_residence,Start_individual_residence,First_day_year):-
    date(First_day_year),    
    start_(Individual_residence,Start_individual_residence).

end_individual_residence(Individual_residence,End_individual_residence,Last_day_year):-
    date(End_individual_residence),date(Last_day_year),
    end_(Individual_residence,_),
    End_individual_residence = Last_day_year.
end_individual_residence(Individual_residence,End_individual_residence,Last_day_year):-
    date(Last_day_year),end_(Individual_residence,End_individual_residence).

s2_b_1_A_i_or_ii(Taxp,Dependent,Taxy):-
    s2_b_1_A_i(Taxp,Dependent,Taxy).
s2_b_1_A_i_or_ii(Taxp,Dependent,Taxy):-
    s2_b_1_A_ii(Taxp,Dependent,Taxy).
%(A) maintains as his home a household which constitutes for more than one-half of such taxable year the principal place of abode, as a member of such household, of-
s2_b_1_A(Taxp,Household,Dependent,Taxy) :-
    % who maintains as his home a household
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    residence_(Taxpayer_residence),
    agent_(Taxpayer_residence,Taxp),
    patient_(Taxpayer_residence,Household),
    not_start_taxp_residence(Taxpayer_residence,Start_taxpayer_residence,First_day_year),
    not_end_taxp_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year),
    s7703_b_2(Taxp,Household,_,Taxy), % such individual furnishes over one-half of the cost of maintaining such household during the taxable year
    % which constitutes for more than one-half of such taxable year...
    residence_(Individual_residence),
    agent_(Individual_residence,Dependent),
    patient_(Individual_residence,Household),
    start_individual_residence(Individual_residence,Start_individual_residence,First_day_year),
    end_individual_residence(Individual_residence,End_individual_residence,Last_day_year),
    duration(Start_individual_residence,End_individual_residence,Years,Months,Days),
	more_than_half_a_year(Years,Months),
    s2_b_1_A_i_or_ii(Taxp,Dependent,Taxy).

%(i) a qualifying child of the individual (as defined in section 152(c)), but not if such child-
s2_b_1_A_i(Taxp,Dependent,Taxy) :-
    s152_c(Dependent,Taxp,Taxy),
    not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy).

s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy):-
    s2_b_1_A_i_I(Dependent,Taxy),
    s2_b_1_A_i_II(Dependent,Taxp,Taxy).

%(I) is married at the close of the taxpayer's taxable year, and
s2_b_1_A_i_I(Dependent,Taxy) :-
    s7703(Dependent,_,_,Taxy).

%(II) is not a dependent of such individual by reason of section 152(b)(2), or
s2_b_1_A_i_II(Dependent,Taxp,Taxy) :-
    s152_b_2(Dependent,_,Taxp,Taxy).

%(ii) any other person who is a dependent of the taxpayer, if the taxpayer is entitled to a deduction for the taxable year for such person under section 151, or
s2_b_1_A_ii(Taxp,Dependent,Taxy) :-
    s152(Dependent,Taxp,Taxy),
    s151_b_or_c_applies(Taxp,Dependent,Taxy).

s151_b_or_c_applies(Taxp,Dependent,Taxy):-
    s151_b_applies(Taxp,Dependent,Taxy).
s151_b_or_c_applies(Taxp,Dependent,Taxy):-
    s151_c_applies(Taxp,Dependent,Taxy).

%(B) maintains a household which constitutes for such taxable year the principal place of abode of the father or mother of the taxpayer, if the taxpayer is entitled to a deduction for the taxable year for such father or mother under section 151.
s2_b_1_B(Taxp,Household,Dependent,Deduction,Taxy) :-
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    % which constitutes for the taxable year the principal place of abode (as a member of such household) of...
    residence_(Parent_residence),
    agent_(Parent_residence,Dependent),
    patient_(Parent_residence,Household),
    start_(Parent_residence,Start_dependent_residence),
    is_before(Start_dependent_residence,First_day_year),
    s7703_b_2(Taxp,Household,_,Taxy), % such individual furnishes over one-half of the cost of maintaining such household during the taxable year
    not_end_parent_residence(Parent_residence,End_dependent_residence,Last_day_year),
    is_child_of(Taxp,Dependent,Start_child,End_child),
    is_before(Start_child,First_day_year),
    is_before(Last_day_year,End_child),
    s151_c(Taxp,Dependent,Deduction,Taxy).
%s151_c_applies(Taxp,Parent,Taxy).

not_end_parent_residence(Parent_residence,End_dependent_residence,Last_day_year):-
    date(End_dependent_residence),date(Last_day_year),
    residence_(Parent_residence),not_end_(Parent_residence,_).
not_end_parent_residence(Parent_residence,End_dependent_residence,Last_day_year):-
    end_(Parent_residence,End_dependent_residence),
    is_before(Last_day_year,End_dependent_residence).

%For purposes of this paragraph, an individual shall be considered as maintaining a household only if over half of the cost of maintaining the household during the taxable year is furnished by such individual.

%(2) Determination of status

%Notwithstanding paragraph (1),

%(A) an individual who is legally separated from his spouse under a decree of divorce or of separate maintenance shall not be considered as married;
s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not_same_person(Taxp,Spouse),
    legal_separation_(S98),
    patient_(S98,Marriage),
    decree_of_divorce_or_separate_maintenance(S98),
    start_(S98,Divorce_time),
    last_day_year(Taxy,Last_day_year),
    is_before(Divorce_time,Last_day_year).

decree_of_divorce_or_separate_maintenance(S98):-
    agent_(S98,"decree of divorce").
decree_of_divorce_or_separate_maintenance(S98):-
    agent_(S98,"decree of separate maintenance").

%(B) a taxpayer shall be considered as not married at the close of his taxable year if at any time during the taxable year his spouse is a nonresident alien; and
s2_b_2_B(Taxp,Spouse,Taxy) :-
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    nonresident_alien_(Spouse_is_nra),
    agent_(Spouse_is_nra,Spouse),
    start_spouse_is_nra(Spouse_is_nra,Start_nra,Last_day_year),
    end_spouse_is_nra(Spouse_is_nra,Stop_nra,First_day_year).

start_spouse_is_nra(Spouse_is_nra,Start_nra,Last_day_year):-
    nonresident_alien_(Spouse_is_nra),date(Start_nra),date(Last_day_year),
    not_start_(Spouse_is_nra,_).
start_spouse_is_nra(Spouse_is_nra,Start_nra,Last_day_year):-
    start_(Spouse_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year).

end_spouse_is_nra(Spouse_is_nra,Stop_nra,First_day_year):-
    date(First_day_year),nonresident_alien_(Spouse_is_nra),date(Stop_nra),
    not_end_(Spouse_is_nra,_).
end_spouse_is_nra(Spouse_is_nra,Stop_nra,First_day_year):-
    end_(Spouse_is_nra,Stop_nra),
    is_before(First_day_year,Stop_nra).

%(C) a taxpayer shall be considered as married at the close of his taxable year if his spouse (other than a spouse described in subparagraph (B)) died during the taxable year.
s2_b_2_C(Taxp,Marriage,Spouse,Taxy) :-
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not_s2_b_2_B(Taxp,Spouse,Taxy),
    death_(Spouse_dies),
    agent_(Spouse_dies,Spouse),
    start_(Spouse_dies,Time_death),
    died_and_married(Marriage,Time_death,End_marriage),  
    is_before(First_day_year,Time_death),
    is_before(Time_death,Last_day_year).

died_and_married(Marriage,Time_death,End_marriage):-
    marriage_(Marriage),date(Time_death),date(End_marriage),
    not_end_(Marriage,_).
died_and_married(Marriage,Time_death,End_marriage):-
    end_(Marriage,End_marriage),
    is_before(Time_death,End_marriage).

%(3) Limitations

%Notwithstanding paragraph (1), for purposes of this subtitle a taxpayer shall not be considered to be a head of a household-
s2_b_3(Taxp,Dependent,Taxy) :-
    person(Dependent),s2_b_3_A(Taxp,Taxy,_).
s2_b_3(Taxp,Dependent,Taxy) :-
    s2_b_3_B(Taxp,Dependent,Taxy).

%(A) if at any time during the taxable year he is a nonresident alien; or
s2_b_3_A(Taxp,Taxy,S119) :-
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    nonresident_alien_(Taxpayer_is_nra),
    agent_(Taxpayer_is_nra,Taxp),
    start_taxp_is_nra(Taxpayer_is_nra,Start_nra,First_day_year,Last_day_year,S119),
    end_taxp_is_nra(Taxpayer_is_nra,Stop_nra,Last_day_year).

start_taxp_is_nra(Taxpayer_is_nra,Start_nra,First_day_year,Last_day_year,S119):-
    date(First_day_year),date(Last_day_year),date(S119),
    date(Start_nra),nonresident_alien_(Taxpayer_is_nra),
    not_start_(Taxpayer_is_nra,_),
    S119=First_day_year.
start_taxp_is_nra(Taxpayer_is_nra,Start_nra,Last_day_year):-
    start_(Taxpayer_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year),
    S119=Last_day_year.

end_taxp_is_nra(Taxpayer_is_nra,Stop_nra,Last_day_year):-
    date(Last_day_year),date(Stop_nra),nonresident_alien_(Taxpayer_is_nra),
    not_end_(Taxpayer_is_nra,_).
end_taxp_is_nra(Taxpayer_is_nra,Stop_nra,Last_day_year):-
    date(Last_day_year),
    end_(Taxpayer_is_nra,Stop_nra),
    is_before(First_day_year,Stop_nra),
    is_before(S119,Stop_nra).

%(B) by reason of an individual who would not be a dependent for the taxable year but for subparagraph (H) of section 152(d)(2).
s2_b_3_B(Taxp,Dependent,Taxy) :-
    first_day_year(Taxy,First_day),
    last_day_year(Taxy,Last_day),
    not_s152_b(Dependent,Taxp,Taxy),
    not_s152_a_1(Dependent,Taxp,Taxy),
    s152_d_1_B(Dependent,Taxy),
    s152_d_1_D(Dependent,Taxy),
    not_valid_relationship_s152_d_2(Dependent,Taxp),
    s152_d_2_H(Dependent,Taxp,Taxy,_,StartH,EndH),
    is_before(StartH,First_day),
    is_before(Last_day,EndH).

valid_relationship_s152_d_2(Dependent,Taxp):-
    s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship),
    is_before(Start_relationship,First_day),
    is_before(End_relationship,Last_day).

s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_A(Dependent,Taxp,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_B(Dependent,Taxp,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_C(Dependent,Taxp,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_D(Dependent,Taxp,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_E(Dependent,Taxp,_,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_F(Dependent,Taxp,_,Start_relationship,End_relationship).
s152_d_2_subsections(Dependent,Taxp,Start_relationship,End_relationship):-
    s152_d_2_G(Dependent,Taxp,Start_relationship,End_relationship).

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).



contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).

contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).

contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).

contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).

contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).

contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).

contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).

contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).



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
	s3306_a_3(Employer,_,Caly).

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
    not_purpose_(Service, "agricultural labor"),
	not_purpose_(Service, "domestic service").

s3306_a_1_A(Employee,Caly,Wages) :-
	year(Caly),person(Employee),
	% Wages = #sum{Amount,Remuneration : s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount)},
	Wages>1499.

s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount):-
	s3306_a_1_is_wages(Employee, Caly, Remuneration, Amount).
s3306_a_1_A_wages(Employee,Remuneration,Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_1_is_wages(Employee, Pyear, Remuneration, Amount).

%(B) on each of some 10 days during the calendar year or during the preceding calendar year, each day being in a different calendar week, employed at least one individual in employment for some portion of the day.
s3306_a_1_is_day_of_employment(Person, Employee, Day) :-
	s3306_c(Service,Person,Employee,Day,_),
    not_purpose_(Service,"agricultural labor"),
    not_purpose_(Service,"domestic service"),
    not_type_(Service,"agricultural labor"),
    not_type_(Service,"domestic service").

s3306_a_1_B(Employer,Workday,Employee,Caly) :-
	person(Employer),list(Workday),list(Employee),
    last_day_year(Caly,Last_day_year),
    Year1=Caly-1,
    first_day_year(Year1,First_day_year1),
	% Num_days = #count{Day : 
	% s3306_a_1_is_day_of_employment(Employer,Individual,Day),
	% is_before(First_day_year1,Day),
	% is_before(Day,Last_day_year)},
	Num_days>9,
	% Num_weeks = #count{Week : 
	% 	s3306_a_1_is_day_of_employment(Employer,Individual,Day),
	% 	is_before(First_day_year1,Day),
	% 	is_before(Day,Last_day_year),
	% 	week_number(Day,Week)},
	Num_weeks>9.

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
	% Wages = #sum{Amount,Service_ : s3306_a_2_A_wages(Employee, Caly,Amount,Service_)},
	Wages>=20000.

s3306_a_2_A_wages(Employer, Caly,Amount,Service_):-
	s3306_a_2_is_wages(Employer, Caly, Epay, Amount, Service_).
s3306_a_2_A_wages(Employer, Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_2_is_wages(Employer, Pyear, Epay, Amount, Service_).
	

%(B) on each of some 10 days during the calendar year or during the preceding calendar year, each day being in a different calendar week, employed at least 5 individuals in employment in agricultural labor for some portion of the day.
s3306_a_2_is_day_of_employment(Person,Individuals_,Agricultural_labor_,Day) :-
	list(Individuals_),list(Agricultural_labor_),person(Person),date(Day),
	% Num_employees = #count{Employee : s3306_a_2_is_day_of_employment_labor(Employee,Service,Day,Person)},
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
	% Num_days = #count{Day : 
	% 	s3306_c(_,Employer,_,Day,_), % narrow down the list of days
	% 	s3306_a_2_is_day_of_employment(Employer,Employees,Labor,Day), % check that 5+ people were employed
	% 	is_before(First_day_year1,Day),
	% 	is_before(Day,Last_day_year)},
	Num_days>=10,
	% Num_weeks = #count{Week : 
	% 	s3306_c(_,Employer,_,Day,_), % narrow down the list of days
	% 	s3306_a_2_is_day_of_employment(Employer,Employees,Labor,Day), % check that 5+ people were employed
	% 	is_before(First_day_year1,Day),
	% 	is_before(Day,Last_day_year),
	% 	week_number(Day,Week)},
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
	payment_(Remuneration),not_means_(Remuneration,_).
s3306_a_3_is_wages_means(Remuneration):-
	means_(Remuneration,"cash").	

s3306_a_3(Employer,Wages,Caly) :-
	list(_Service_),person(Employer),year(Caly),
	% Wages = #sum{Amount,Service_ : s3306_a_2_A_wages(Employee, Caly,Amount,Service_)},
	Wages>999.

s3306_a_2_A_wages(Employer, Caly,Amount,Service_):-
	s3306_a_3_is_wages(Employer, Caly, Epay, Service_, Amount).
s3306_a_2_A_wages(Employer, Caly,Amount):-
	Pyear=Caly-1,
	s3306_a_3_is_wages(Employer, Pyear, Epay, Service_, Amount).

%(4) Special rule

%A person treated as an employer under paragraph (3) shall not be treated as an employer with respect to wages paid for any service other than domestic service referred to in paragraph (3) unless such person is treated as an employer under paragraph (1) or (2) with respect to such other service.
% This will be satisfied automatically here since all 3 types of employer are kept separate.
% s3306_a_4(). % always true.

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
	not_s3306_b_2(Remuneration,Employment,Payer,Payee,_,Plan),
    not_s3306_b_7(Remuneration,Employment,Payer,Payee,_,_),
	not_s3306_b_10(Remuneration,Employment,Payer,Payee,_,Plan),
	not_s3306_b_11(Remuneration,Employment,_),
    not_s3306_b_15(Remuneration,Employer,Payee,Employee,_).

s3306_b_means(Remuneration,Medium):-
	medium(Medium),payment_(Remuneration), not_means_(Remuneration,_).
s3306_b_means(Remuneration,Medium):-
	means_(Remuneration,Medium).

s3306_b_patient(Remuneration,Payee,Plan):-
	plan_(Plan),
	patient_(Remuneration,Payee),
	not_plan_(Payee).
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
	not_medium_is_cash(Medium),
    business_(Employers_business),
	agent_(Employers_business,Employer),
	type_(Employers_business,S92),
    type_(Service,Type_service),
	not_s92_equals_service_type(Service,S92).

medium_is_cash(Medium):-
	medium(Medium),Medium="cash".
s92_equals_service_type(Service,S92):-
	type_(Service,Type_service),
	S92=Type_service.

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
    not_medium_is_cash(Medium).

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
	marriage_(Emar),date(Time_death),not_end_(Emar,_).
s3306_b_15_end(Emar,Time_death):-
	end_(Emar,Time_death).

%(c) Employment

%For purposes of this chapter, the term "employment" means any service, of whatever nature,

s3306_c(Service,Employer,Employee,Workday,Caly) :-
	service_(Service),
	date_split(Workday,Caly,M1,D1),
    s3306_c_A_or_B(Service,Employer,Employee),
	not_s3306_c_1(Service,Caly),
	not_s3306_c_2(Service,_,Caly), 
	not_s3306_c_5(Service,Employer,Employee,Workday),
	not_s3306_c_6(Service),
	not_s3306_c_7(Service,_),
	not_s3306_c_10(Service,Employer,Employee,Workday),
	not_s3306_c_11(Service,Employer),
	not_s3306_c_13(Service,Employer,Employee,Workday),
	not_s3306_c_16(Service,Employer),
	not_s3306_c_21(Service,Employee,_,Workday).

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
	not_location_(Service,_),
	Geographical_location = "usa".

s3306_c_A_country(Geographical_location,Country):-
	country_(Geographical_location,Country),
	Country="usa".
s3306_c_A_country(Geographical_location,Country):-
	country_name(Country),
	not_country_(Geographical_location,_),
	Geographical_location="usa".

%(B) performed outside the United States (except in a contiguous country with which the United States has an agreement relating to unemployment compensation) by a citizen of the United States as an employee of an American employer, except-
s3306_c_B(Service,Employer,Employee,Location) :-
	agent_(Service, Employee),
	patient_(Service, Employer),
	s3306_c_B_location(Location,Country),
	not_s3306_c_B_agreement(Location),
    american_employer_(Employer_is_american_employer),
    agent_(Employer_is_american_employer, Employer),
	citizenship_(Employee_is_american),
	agent_(Employee_is_american,Employee),
    patient_(Employee_is_american,"usa").

s3306_c_B_location(Location,Country):-
	country_(Location,Country),
	not_country_equals_usa(Country).
s3306_c_B_location(Location,Country):-
	country_name(Country),location_name(Location),
	not_country_(Location,_),
	not_location_equals_usa(Location).

country_equals_usa(Country):-
	country_name(Country),
	Country = "usa".

location_equals_usa(Location):-
	location_name(Location),
	Location = "usa".

s3306_c_B_agreement(Location):-
	unemployment_compensation_agreement_(Agreement),
	agent_(Agreement,"usa"),
	agent_(Agreement,Location).

%(1) agricultural labor unless-
s3306_c_1(Service,Caly) :-
	year(Caly),
	purpose_(Service,"agricultural labor"),
	not_s3306_c_1_A_and_B(Service,Caly).
s3306_c_1(Service,Caly) :-
	year(Caly),
	type_(Service,"agricultural labor"),
	not_s3306_c_1_A_and_B(Service,Caly).

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
	% Remuneration = #sum{Amount,Employee_,Service_ :
	% 	payment_(Payment),
	% 	agent_(Payment,Employer),
	% 	patient_(Payment,Employee_),
	% 	service_(Service_),
	% 	agent_(Service_,Employee_),
	% 	patient_(Service_,Employer),
	% 	s3306_c_1_A_i_service(Service_),
	% 	purpose_(Payment,Service_),
	% 	amount_(Payment,Amount),
	% 	start_(Payment,Payment_time),
	% 	is_before(First_day_year,Payment_time),
	% 	is_before(Payment_time,Last_day_year),
	% 	s3306_c_1_A_i_means(Payment)
	% },
    Remuneration > 19999.

s3306_c_1_A_i_service(Service_):-
	purpose_(Service_,"agricultural labor").
s3306_c_1_A_i_service(Service_):-
	type_(Service_,"agricultural labor").

s3306_c_1_A_i_means(Payment):-
	payment_(Payment),not_means_(Payment,_).
s3306_c_1_A_i_means(Payment):-
	means_(Payment,"cash").

%(ii) on each of some 10 days during the calendar year or the preceding calendar year, each day being in a different calendar week, employed in agricultural labor (including labor performed by an alien referred to in subparagraph (B)) for some portion of the day (whether or not at the same moment of time) 5 or more individuals; and
s3306_c_1_A_ii(Employer,Workday,Service,Employee,S156,Caly) :-
	s3306_a_2_B(Employer,Workday,Service,Employee,S156,Caly).

%(B) such labor is not agricultural labor performed by an individual who is an alien admitted to the United States to perform agricultural labor.
s3306_c_1_B(Service,Employee) :-
	service_(Service),person(Employee),not_s3306_c_1_B_not(Service,Employee).

s3306_c_1_B_not(Service,Employee):-
	type_(Service,"agricultural labor"),
	citizenship_(Employee_citizenship),
	agent_(Employee_citizenship,Employee),
	patient_(Employee_citizenship,Country),
	not_country_equals_usa(Country),
	migration_(Employee_migration),
	agent_(Employee_migration,Employee),
	destination_(Employee_migration,"usa"),
	purpose_(Employee_migration,"agricultural labor").
s3306_c_1_B_not(Service,Employee):-
	purpose_(Service,"agricultural labor"),
	agent_(Employee_citizenship,Employee),
	patient_(Employee_citizenship,Country),
	not_country_equals_usa(Country),
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
	not_s3306_a_3(Person,_,Caly).

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
	not_same_person(Employer,Employee),
	start_(Marriage,Time_start),
	is_before(Time_start,Workday),
	s3306_c_5_A_marriage(Marriage,Workday).

s3306_c_5_A_marriage(Marriage,Workday):-
	marriage_(Marriage),date(Workday),not_end_(Marriage,_).
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
	date(Workday),not_end_(Student_is_enrolled,_).
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
	marriage(Marriage),date(Workday),not_start_(Marriage,_).
s3306_c_10_A_ii_start(Marriage,Workday):-
	start_(Marriage,Start_marriage),
	is_before(Start_marriage,Workday).

s3306_c_10_A_ii_end(Marriage,Workday):-
	marriage(Marriage),date(Workday),not_end_(Marriage,_).
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
	medical_patient_(Employee_is_medical_patient),date(Workday),not_end_(Employee_is_medical_patient,_).
s3306_c_10_B_end(Employee_is_medical_patient,Workday):-
	end_(Employee_is_medical_patient,End_patient),
	is_before(Workday,End_patient).

%(11) service performed in the employ of a foreign government (including service as a consular or other officer or employee or a nondiplomatic representative);
s3306_c_11(Service,Employer) :-
    service_(Service),
	patient_(Service,Employer),
	sub_atom(Employer,_,11,0,Suffix),
	Suffix=" government",
	not_employer_is_usa_government(Service,Employer).

employer_is_usa_government(Service,Employer):-
	patient_(Service,Employer),
	Employer="united states government".

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
	date(Workday),not_end_(Student_is_enrolled,_).
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
	date(Workday),not_end_(Person_goes_to_jail,_).
s3306_c_21_end(Person_goes_to_jail,End_incarceration,Workday):-
	end_(Person_goes_to_jail,End_incarceration),
	is_before(Workday,End_incarceration).

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
assumption(not_s152(Dependent,Taxp,Taxy)).
assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
assumption(not_s151_d_5(Ea,Taxy)).
assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
assumption(not_s152_b_1(Taxp,Otaxp,Taxy)).
assumption(not_s152_b_2(Dependent,S21,Spouse,Taxy)).
assumption(not_individual_death(Individual,Death_time)).
assumption(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy)).
assumption(not_s152_c_3_dependent_born(Dependent)).
assumption(not_s152_c(Dependent,Taxp,Taxy)).
assumption(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)).
assumption(not_purpose_(Service, Label)).
assumption(not_type_(Service,Type)).
assumption(not_means_(Remuneration,Means)).
assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_plan_(Plan)).
assumption(not_s3306_a_3(Employer,Wages,Caly)).
assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
assumption(not_medium_is_cash(Medium)).
assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_s3306_b_11(Remuneration,Service,Medium)).
assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
assumption(not_s3306_c_1(Service,Caly)).
assumption(not_s3306_c_2(Service,Location,Caly)).
assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_6(Service)).
assumption(not_s3306_c_7(Service,Employer)).
assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_11(Service,Employer)).
assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_16(Service,Employer)).
assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
assumption(not_s3306_c_1_B_not(Service,Employee)).
assumption(not_location_(Service,Location)).
assumption(not_country_(Geographical_location,Country)).
assumption(not_s3306_c_B_agreement(Location)).
assumption(not_s3306_c_1_A_and_B(Service,Caly)).
assumption(not_country_equals_usa(Location)).
assumption(not_location_equals_usa(Location)).
assumption(not_employer_is_usa_government(Service,Employer)).
assumption(not_s7703_b(Taxp,Spouse,Taxy)).
assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).

contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
contrary(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)) :-
    assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
contrary(not_s151_b_joint_return(Taxp,Spouse,Taxy),s151_b_joint_return(Taxp,Spouse,Taxy)) :-
    assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
contrary(not_s152(Dependent,Taxp,Taxy),s152(Dependent,Taxp,Taxy)) :-
    assumption(not_s152(Dependent,Taxp,Taxy)).
contrary(not_s151_d_2(Taxp,Otaxp,Ea,Taxy),s151_d_2(Taxp,Otaxp,Ea,Taxy)) :-
    assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
contrary(not_s151_d_5(Ea,Taxy),s151_d_5(Ea,Taxy)) :-
    assumption(not_s151_d_5(Ea,Taxy)).
contrary(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),s151_d_3(Taxp,Exemption_in,Ea,Taxy)) :-
    assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
contrary(not_s151_d_3_B_separate_return(Taxp,Taxy),s151_d_3_B_separate_return(Taxp,Taxy)) :-
    assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
contrary(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse),s151_d_3_B_joint_return(Taxp,Taxy,Spouse)) :-
    assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
contrary(not_purpose_(Service, Label),purpose_(Service, Label)) :-
    assumption(not_purpose_(Service, Label)).
contrary(not_type_(Service,Type),type_(Service,Type)) :-
    assumption(not_type_(Service,Type)).
contrary(not_means_(Remuneration,Means),means_(Remuneration,Means)) :-
    assumption(not_means_(Remuneration,Means)).
contrary(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_plan_(Plan),plan_(Plan)) :-
    assumption(not_plan_(Plan)).
contrary(not_s3306_a_3(Employer,Wages,Caly),s3306_a_3(Employer,Wages,Caly)) :-
    assumption(not_s3306_a_3(Employer,Wages,Caly)).
contrary(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92),s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)) :-
    assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
contrary(not_medium_is_cash(Medium),medium_is_cash(Medium)) :-
    assumption(not_medium_is_cash(Medium)).
contrary(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_s3306_b_11(Remuneration,Service,Medium),s3306_b_11(Remuneration,Service,Medium)) :-
    assumption(not_s3306_b_11(Remuneration,Service,Medium)).
contrary(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly),s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)) :-
    assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
contrary(not_s3306_c_1(Service,Caly),s3306_c_1(Service,Caly)) :-
    assumption(not_s3306_c_1(Service,Caly)).
contrary(not_s3306_c_2(Service,Location,Caly),s3306_c_2(Service,Location,Caly)) :-
    assumption(not_s3306_c_2(Service,Location,Caly)).
contrary(not_s3306_c_5(Service,Employer,Employee,Workday),s3306_c_5(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_6(Service),s3306_c_6(Service)) :-
    assumption(not_s3306_c_6(Service)).
contrary(not_s3306_c_7(Service,Employer),s3306_c_7(Service,Employer)) :-
    assumption(not_s3306_c_7(Service,Employer)).
contrary(not_s3306_c_10(Service,Employer,Employee,Workday),s3306_c_10(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_11(Service,Employer),s3306_c_11(Service,Employer)) :-
    assumption(not_s3306_c_11(Service,Employer)).
contrary(not_s3306_c_13(Service,Employer,Employee,Workday),s3306_c_13(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_16(Service,Employer),s3306_c_16(Service,Employer)) :-
    assumption(not_s3306_c_16(Service,Employer)).
contrary(not_s3306_c_21(Service,Employee,S235,Workday),s3306_c_21(Service,Employee,S235,Workday)) :-
    assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
contrary(not_s3306_c_1_B_not(Service,Employee),s3306_c_1_B_not(Service,Employee)) :-
    assumption(not_s3306_c_1_B_not(Service,Employee)).
contrary(not_location_(Service,Location),location_(Service,Location)) :-
    assumption(not_location_(Service,Location)).
contrary(not_country_(Geographical_location,Country),country_(Geographical_location,Country)) :-
    assumption(not_country_(Geographical_location,Country)).
contrary(not_s3306_c_B_agreement(Location),s3306_c_B_agreement(Location)) :-
    assumption(not_s3306_c_B_agreement(Location)).
contrary(not_s3306_c_1_A_and_B(Service,Caly),s3306_c_1_A_and_B(Service,Caly)) :-
    assumption(not_s3306_c_1_A_and_B(Service,Caly)).
contrary(not_country_equals_usa(Location),country_equals_usa(Location)) :-
    assumption(not_country_equals_usa(Location)).
contrary(not_location_equals_usa(Location),location_equals_usa(Location)) :-
    assumption(not_location_equals_usa(Location)).
contrary(not_employer_is_usa_government(Service,Employer),employer_is_usa_government(Service,Employer)) :-
    assumption(not_employer_is_usa_government(Service,Employer)).
contrary(not_s7703_b(Taxp,Spouse,Taxy),s7703_b(Taxp,Spouse,Taxy)) :-
    assumption(not_s7703_b(Taxp,Spouse,Taxy)).
contrary(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy),s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)) :-
    assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
contrary(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year),s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)) :-
    assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)) :-
    assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_2(Spouse,Spouse_dies),s7703_a_1_death_2(Spouse,Spouse_dies)) :-
    assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).% finance(17330).
% person(alice).
% year(2017).
% date("2017-01-01").
max(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 >= Val2, Result = Val1.
max(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val2.

min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 >= Val2, Result = Val2.
min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val1.

%§63. Taxable income defined
s63(Taxp,Taxy,Taxinc) :-
    s63_b_xor_a(Taxp,Taxy,Taxable_income_tmp),
	max(Taxinc,Taxable_income_tmp,0).

s63_b_xor_a(Taxp,Taxy,Taxable_income_tmp):-
    s63_b(Taxp,Taxy,Taxable_income_tmp,_).
s63_b_xor_a(Taxp,Taxy,Taxable_income_tmp):-
    not_s63_b(Taxp,Taxy,_,_),
    s63_a(Taxp,Taxy,Taxable_income_tmp,_,_).

%(a) In general

%Except as provided in subsection (b), for purposes of this subtitle, the term "taxable income" means gross income minus the deductions allowed by this chapter (other than the standard deduction).
s63_a(Taxp,Taxy,Taxinc,Grossinc,Ded63) :-
    gross_income(Taxp,Taxy,Grossinc),
	s63_d(Taxp,_,Total_deduction,Taxy),
	s68(Taxp,Total_deduction,Total_deduction_reduced,Taxy),
	s151(Taxp,Exemption_151,_,_,Taxy),
	Ded63 = Total_deduction_reduced + Exemption_151,
    Taxable_income_tmp = Grossinc - Ded63,
	max(Taxinc,Taxable_income_tmp,0).

%(b) Individuals who do not itemize their deductions

%In the case of an individual who does not elect to itemize his deductions for the taxable year, for purposes of this subtitle, the term "taxable income" means adjusted gross income, minus-
s63_b(Taxp,Taxy,Taxinc,Grossinc) :-
    not_s63_d(Taxp,_,_,Taxy),
    gross_income(Taxp,Taxy,Grossinc),
    s63_b_1(Taxp,Taxy,Amount1),
    s63_b_2(Taxp,Taxy,Amount2),
    Taxable_income_tmp = Grossinc - Amount1 - Amount2,
	max(Taxinc,Taxable_income_tmp,0).

%(1) the standard deduction, and
s63_b_1(Taxp,Taxy,Standed) :-
    s63_c(Taxp,Taxy,Standed).

%(2) the deduction for personal exemptions provided in section 151.
s63_b_2(Taxp,Taxy,Ded151) :-
    s151(Taxp,Ded151,_,_,Taxy).

%(c) Standard deduction

%For purposes of this subtitle-
s63_c(Taxp,Taxy,Standed) :- % exceptions are already dealt with earlier
    s63_c_1(Taxp,Taxy,Standed).

%(1) In general

%Except as otherwise provided in this subsection, the term "standard deduction" means the sum of-
s63_c_1(Taxp,Taxy,Standed) :-
    s63_c_6_xor_1_AB(Taxp,Taxy,Standed).

s63_c_6_xor_1_AB(Taxp,Taxy,Standed):-
    s63_c_6(Taxp,Taxy,Standed).
s63_c_6_xor_1_AB(Taxp,Taxy,Standed):-
    not_s63_c_6(Taxp,Taxy,_),
    s63_c_1_A(Taxp,Taxy,Bassd),
    s63_c_1_B(Taxp,Taxy,Addsd),
    Standed = Bassd+Addsd.

%(A) the basic standard deduction, and
s63_c_1_A(Taxp,Taxy,Bassd) :-
    s63_c_2(Taxp,Taxy,Basic_amount),
    s63_c_5_bassd(Taxp,Taxy,Basic_amount,Bassd).

s63_c_5_bassd(Taxp,Taxy,Basic_amount,Bassd):-
    s63_c_5(Taxp,_,_,Taxy,Max_amount),
    min(Bassd,Basic_amount,Max_amount).
s63_c_5_bassd(Taxp,Taxy,Basic_amount,Bassd):-
    person(Taxp),year(Taxy),finance(Basic_amount),
    not_s63_c_5(Taxp,_,_,Taxy,_),
    Bassd = Basic_amount.

%(B) the additional standard deduction.
s63_c_1_B(Taxp,Taxy,Addsd) :-
    s63_c_3(Taxp,Addsd,Taxy).

%(2) Basic standard deduction

%For purposes of paragraph (1), the basic standard deduction is-
s63_c_2(Taxp,Taxy,Bassd) :-
    s63_c_2_A(Taxp,Taxy,Multiplier),
    not_s63_c_2_B(Taxp,Taxy,_),
    s63_c_2_C(Taxy,Default_amount),
    Bassd = Multiplier*Default_amount.
s63_c_2(Taxp,Taxy,Bassd) :-
    not_s63_c_2_A(Taxp,Taxy,_),
    s63_c_2_B(Taxp,Taxy,Bassd).
s63_c_2(Taxp,Taxy,Bassd) :-
    person(Taxp),
    not_s63_c_2_A(Taxp,Taxy,_),
    not_s63_c_2_B(Taxp,Taxy,_),
    s63_c_2_C(Taxy,Bassd).

%(A) 200 percent of the dollar amount in effect under subparagraph (C) for the taxable year in the case of-
s63_c_2_A(Taxp,Taxy,Multiplier) :-
    s63_c_2_A_i_or_ii(Taxp,Taxy),
    Multiplier = 2.

s63_c_2_A_i_or_ii(Taxp,Taxy):-
    s63_c_2_A_i(Taxp,_,Taxy).
s63_c_2_A_i_or_ii(Taxp,Taxy):-
     s63_c_2_A_ii(Taxp,Taxy).

%(i) a joint return, or
s63_c_2_A_i(Taxp,Joint_return,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day),
    start_(Joint_return,First_day),
    last_day_year(Taxy,Last_day),
    end_(Joint_return,Last_day).

%(ii) a surviving spouse (as defined in section 2(a)),
s63_c_2_A_ii(Taxp,Taxy) :-
    s2_a(Taxp,_,Taxy).

%(B) $4,400 in the case of a head of household (as defined in section 2(b)), or
s63_c_2_B(Taxp,Taxy,Bassd) :-
    s2_b(Taxp,_,Taxy),
    s63_c_2_B_bassd(Taxp,Taxy,Bassd).

s63_c_2_B_bassd(Taxp,Taxy,Bassd):-
    person(Taxp),s63_c_7_i(Taxy,Bassd).
s63_c_2_B_bassd(Taxp,Taxy,Bassd):-
    person(Taxp),year(Taxy),
    not_s63_c_7_i(Taxy,_),
    Bassd = 4400.

%(C) $3,000 in any other case.
s63_c_2_C(Taxy,Bassd) :-
    s63_c_7_ii(Taxy,Bassd).
s63_c_2_C(Taxy,Bassd) :-
    year(Taxy),
    not_s63_c_7_ii(Taxy,_),
    Bassd = 3000.



%(3) Additional standard deduction for aged and blind

%For purposes of paragraph (1), the additional standard deduction is the sum of each additional amount to which the taxpayer is entitled under subsection (f).
s63_c_3(Taxp,Addsd,Taxy) :-
    s63_f(Taxp,Addsd,Taxy).

%(5) Limitation on basic standard deduction in the case of certain dependents

%In the case of an individual with respect to whom a deduction under section 151 is allowable to another taxpayer for a taxable year beginning in the calendar year in which the individual's taxable year begins, the basic standard deduction applicable to such individual for such individual's taxable year shall not exceed the greater of-

%(A) $500, or

%(B) the sum of $250 and such individual's earned income.
s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd) :-
    s151_b_or_c_applies(S45,Taxp,Taxy),
    Amount1 = 500,
    gross_income(Taxp,Taxy,Grossinc),
    Amount2 = 250+Grossinc,
    max(Bassd,Amount1,Amount2).

s151_b_or_c_applies(S45,Taxp,Taxy):-
    s151_b_applies(S45,Taxp,Taxy).
s151_b_or_c_applies(S45,Taxp,Taxy):-
    s151_c_applies(S45,Taxp,Taxy).

%(6) Certain individuals, etc., not eligible for standard deduction
s63_c_6(Taxp,Taxy,Standed) :-
    s63_c_6_A_or_B_or_D(Taxp,Taxy),
    Standed = 0.

s63_c_6_A_or_B_or_D(Taxp,Taxy):-
    s63_c_6_A(Taxp,_,_,Taxy).
s63_c_6_A_or_B_or_D(Taxp,Taxy):-
    s63_c_6_B(Taxp,Taxy).
s63_c_6_A_or_B_or_D(Taxp,Taxy):-
    s63_c_6_D(Taxp,Taxy).

%In the case of-

%(A) a married individual filing a separate return where either spouse itemizes deductions,
s63_c_6_A(Taxp,Spouse,Itemded,Taxy) :-
   s7703(Taxp,Spouse,_,Taxy), 
   first_day_year(Taxy,First_day_year),
   last_day_year(Taxy,Last_day_year),
   not_couple_joint_return(_,Taxp,Spouse,First_day_year,Last_day_year),
   deduction_(Itemded),
   agent_itemded(Itemded,Taxp,Spouse),
   start_(Itemded,Start),
   is_before(First_day_year,Start),
   is_before(Start,Last_day_year).

couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year):-
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    start_(Joint_return,First_day_year),
    end_(Joint_return,Last_day_year).

agent_itemded(Itemded,Taxp,Spouse):-
    person(Spouse),agent_(Itemded,Taxp).
agent_itemded(Itemded,Taxp,Spouse):-
    person(Taxp),agent_(Itemded,Spouse).


%(B) a nonresident alien individual, or
s63_c_6_B(Taxp,Taxy) :-
    nonresident_alien_(Taxp_is_nra),
    agent_(Taxp_is_nra,Taxp),
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    start_taxp_is_nra(Taxp_is_nra,Start_nra,Last_day_year),
    end_taxp_is_nra(Taxp_is_nra,End_nra,First_day_year).

start_taxp_is_nra(Taxp_is_nra,Start_nra,Last_day_year):-
    nonresident_alien_(Taxp_is_nra), date(Start_nra),
    date(Last_day_year),not_start_(Taxp_is_nra,_).
start_taxp_is_nra(Taxp_is_nra,Start_nra,Last_day_year):-
    start_(Taxp_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year).

end_taxp_is_nra(Taxp_is_nra,End_nra,First_day_year):-
    nonresident_alien_(Taxp_is_nra), date(End_nra),
    date(First_day_year),not_end_(Taxp_is_nra,_).
end_taxp_is_nra(Taxp_is_nra,End_nra,First_day_year):-
    end_(Taxp_is_nra,End_nra),
    is_before(First_day_year,End_nra).

%(D) an estate or trust, common trust fund, or partnership,
s63_c_6_D(Taxp,Taxy) :-
    business_trust_(Taxp_is_trust),
    agent_(Taxp_is_trust,Taxp),
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    start_taxp_is_trust(Taxp_is_trust,Start_trust,Last_day_year),
    end_taxp_is_trust(Taxp_is_trust,End_trust,First_day_year).

start_taxp_is_trust(Taxp_is_trust,Start_trust,Last_day_year):-
    nonresident_alien_(Taxp_is_trust), date(Start_trust),
    date(Last_day_year), not_start_(Taxp_is_trust,_).
start_taxp_is_trust(Taxp_is_trust,Start_trust,Last_day_year):-
    start_(Taxp_is_trust,Start_trust),
    is_before(Start_trust,Last_day_year).

end_taxp_is_trust(Taxp_is_trust,End_trust,First_day_year):-
    nonresident_alien_(Taxp_is_trust), date(End_trust),
    date(First_day_year),not_end_(Taxp_is_trust,_).
end_taxp_is_trust(Taxp_is_trust,End_trust,First_day_year):-
    end_(Taxp_is_trust,End_trust),
    is_before(First_day_year,End_trust).

%the standard deduction shall be zero.

%(7) Special rules for taxable years 2018 through 2025

%In the case of a taxable year beginning after December 31, 2017, and before January 1, 2026-

%Paragraph (2) shall be applied-

%(i) by substituting "$18,000" for "$4,400" in subparagraph (B), and
s63_c_7_i(Taxy,Amount) :-
    Taxy>2017,
    Taxy<2026,
    Amount=18000.

%(ii) by substituting "$12,000" for "$3,000" in subparagraph (C).
s63_c_7_ii(Taxy,Amount) :-
    Taxy>2017,
    Taxy<2026,
    Amount=12000.

%(d) Itemized deductions

%For purposes of this subtitle, the term "itemized deductions" means the deductions allowable under this chapter other than-
s63_d(Taxp,Itemded,Total_amount,Taxy) :-
    finance(Itemded),person(Taxp),
    first_day_year(Taxy, First),
    last_day_year(Taxy, Last),
    #count{ Amount : deductions(D,Amount,Taxp,First,Last)} > 0,
    Total_amount = #sum{Amount,D : deductions(D,Amount,Taxp,First,Last)}.

deductions(Deduction,Amount,Taxp,First,Last):-
    deduction(Deduction),
    agent(Deduction, Taxp),
    start(Deduction, Start),
    is_before(First, Start),
    is_before(Start, Last),
    amount(Deduction,Amount).

%(1) the deductions allowable in arriving at adjusted gross income, and

%(2) the deduction for personal exemptions provided by section 151.
s63_d_2(Taxp,Ded151,Taxy) :-
    s151(Taxp,_,_,Ded151,Taxy).

%(f) Aged or blind additional amounts
s63_f(Taxp,Additional_amounts,Taxy) :-
    s63_f_1(Taxp,Taxy,Counts_aged),
    s63_f_2(Taxp,Taxy,Counts_blind),
    s63_f_amount(Taxp,Taxy,Amount),
    Additional_amounts=(Counts_blind+Counts_aged)*Amount.

s63_f_amount(Taxp,Taxy,Amount):-
    s63_f_3(Taxp,Taxy,Amount).
s63_f_amount(Taxp,Taxy,Amount):-
    person(Taxp),year(Taxy),
    not_s63_f_3(Taxp,Taxy,_),
    Amount = 600.  

%(1) Additional amounts for the aged

%The taxpayer shall be entitled to an additional amount of $600-
s63_f_1(Taxp,Taxy,Counts) :- % count deductions
    s63_f_1_count1(Taxp,Taxy,Count1),
    s63_f_1_count2(Taxp,Taxy,Count2),
    Counts = Count1+Count2.

s63_f_1_count1(Taxp,Taxy,Count1):-
    s63_f_1_A(Taxp,Taxy),Count1=1.  
s63_f_1_count1(Taxp,Taxy,Count1):-  
    person(Taxp),year(Taxy),
    not_s63_f_1_A(Taxp,Taxy),Count1=0.  

s63_f_1_count2(Taxp,Taxy,Count2):-
    s63_f_1_B(Taxp,_,Taxy),Count2=1.  
s63_f_1_count2(Taxp,Taxy,Count2):-  
    person(Taxp),year(Taxy),
    not_s63_f_1_B(Taxp,_,Taxy),Count2=0.  


%(A) for himself if he has attained age 65 before the close of his taxable year, and
s63_f_1_A(Taxp,Taxy) :-
    birth_(Taxp_birth),
    agent_(Taxp_birth,Taxp),
    start_(Taxp_birth,Day_of_birth),
    last_day_year(Taxy,Last_day_year),
    duration(Day_of_birth,Last_day_year,Y,M,D),
    Y > 64.

%(B) for the spouse of the taxpayer if the spouse has attained age 65 before the close of the taxable year and an additional exemption is allowable to the taxpayer for such spouse under section 151(b).
s63_f_1_B(Taxp,Spouse,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    birth_(Spouse_birth),
    agent_(Spouse_birth,Spouse),
    start_(Spouse_birth,Day_of_birth),
    last_day_year(Taxy,Last_day_year),
    duration(Day_of_birth,Last_day_year,Y,M,D),
    Y > 64,
    s151_b_applies(Taxp,Spouse,Taxy).

%(2) Additional amount for blind

%The taxpayer shall be entitled to an additional amount of $600-
s63_f_2(Taxp,Taxy,Counts) :-
    s63_f_2_count1(Taxp,Taxy,Count1),
    s63_f_2_count2(Taxp,Taxy,Count2),
    Counts = Count1+Count2.

s63_f_2_count1(Taxp,Taxy,Count1):-
    s63_f_2_A(Taxp,Taxy),Count1=1.  
s63_f_2_count1(Taxp,Taxy,Count1):- 
    person(Taxp),year(Taxy), 
    not_s63_f_2_A(Taxp,Taxy),Count1=0.  

s63_f_2_count2(Taxp,Taxy,Count2):-
    s63_f_2_B(Taxp,_,Taxy),Count2=600.  
s63_f_2_count2(Taxp,Taxy,Count2):-  
    person(Taxp),year(Taxy),
    not_s63_f_2_B(Taxp,_,Taxy),Count2=0.  
    

%(A) for himself if he is blind at the close of the taxable year, and
s63_f_2_A(Taxp,Taxy) :-
    blindness_(Taxp_is_blind),
    agent_(Taxp_is_blind,Taxp),
    start_(Taxp_is_blind,Start_time),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_time,Last_day_year).

%(B) for the spouse of the taxpayer if the spouse is blind as of the close of the taxable year and an additional exemption is allowable to the taxpayer for such spouse under section 151(b).
s63_f_2_B(Taxp,Spouse,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    blindness_(Spouse_is_blind),
    agent_(Spouse_is_blind,Spouse),
    start_(Spouse_is_blind,Start_time),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_time,Last_day_year),
    s151_b_applies(Taxp,Spouse,Taxy).

%For purposes of subparagraph (B), if the spouse dies during the taxable year the determination of whether such spouse is blind shall be made as of the time of such death.

%(3) Higher amount for certain unmarried individuals

%In the case of an individual who is not married and is not a surviving spouse, paragraphs (1) and (2) shall be applied by substituting "$750" for "$600".
s63_f_3(Taxp,Taxy,Amount) :-
    person(Taxp),year(Taxy),
    not_s7703(Taxp,_,_,Taxy),
    not_s2_a(Taxp,_,Taxy),
    Amount = 750.

%(g) Marital status

%For purposes of this section, marital status shall be determined under section 7703.

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).



contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).% finance(17330).
% person(alice).
% year(2017).
% date("2017-01-01").

min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val1 > Val2-1, Result = Val2.
min(Result, Val1, Val2) :-
    finance(Val1), finance(Val2), Val2 > Val1, Result = Val1.

between(Y1,Y2,Taxy) :- year(Y1), year(Y2), year(Taxy), Y1 < Taxy+1, Y2 > Taxy-1.

%§68. Overall limitation on itemized deductions
s68(Taxp,Amount_deductions_in,Amount_deductions_out,Taxy) :-
    person(Taxp),finance(Amount_deductions_in),
    s68_f(Taxy),
    Amount_deductions_out = Amount_deductions_in.
s68(Taxp,Amount_deductions_in,Amount_deductions_out,Taxy) :-
    not_s68_f(Taxy),
    s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out).

s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out):-
    s68_a(Taxp,_,_,Amount_deductions_in,Reduction,Taxy),
    Amount_deductions_out = Amount_deductions_in-Reduction.
s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out):-
    person(Taxp),year(Taxy),finance(Amount_deductions_in),
    not_s68_a(Taxp,_,_,Amount_deductions_in,_,Taxy),
    Amount_deductions_out = Amount_deductions_in.

%(a) General rule

%In the case of an individual whose adjusted gross income exceeds the applicable amount, the amount of the itemized deductions otherwise allowable for the taxable year shall be reduced by the lesser of-
s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy) :-
    gross_income(Taxp,Taxy,Agi),
    s68_b(Taxp,Aa,Taxy),
    Agi>Aa,
    s68_a_1(Agi,Aa,Reduction1),
    s68_a_2(Taxp,Itemded,Reduction2,Taxy),
    min(S7,Reduction1,Reduction2).

%(1) 3 percent of the excess of adjusted gross income over the applicable amount, or
s68_a_1(Agi,Aa,S9) :-
    finance(Agi),finance(Aa),
    X = 3*(Agi-Aa),
    S9 = X / 100.

%(2) 80 percent of the amount of the itemized deductions otherwise allowable for such taxable year.
s68_a_2(Taxp,Itemded,S14,Taxy) :-
    s63_d(Taxp,_,Itemded,Taxy),
    X = 80*Itemded,
    S14 = X / 100.


%(b) Applicable amount
s68_b(Taxp,Aa,Taxy) :-
    s68_b_1_A(Taxp,_,_,Aa,Taxy).
s68_b(Taxp,Aa,Taxy) :-
    s68_b_1_B(Taxp,Aa,Taxy).
s68_b(Taxp,Aa,Taxy) :-
    s68_b_1_C(Taxp,Aa,Taxy).
s68_b(Taxp,Aa,Taxy) :-
    s68_b_1_D(Taxp,Aa,Taxy).



%(1) In general

%For purposes of this section, the term "applicable amount" means-
amount("A",Amount) :-
    Amount = 300000.
amount("B",Amount) :-
    Amount = 275000.
amount("C",Amount) :-
    Amount = 250000.
amount("D",Amount) :-
    amount("A",Amount_A),
    Amount = Amount_A/2.

%(A) $300,000 in the case of a joint return or a surviving spouse (as defined in section 2(a)),
s68_b_1_A(Taxp,Joint_return,Surviving_spouse,Aa,Taxy) :-
    joint_return_or_s2_a(Taxp,Joint_return,Surviving_spouse,Taxy),
    amount("A",Aa).

joint_return_or_s2_a(Taxp,Joint_return,Surviving_spouse,Taxy):-
    person(Surviving_spouse),
    s7703(Taxp,Spouse,_,Taxy),
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(Joint_return,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(Joint_return,Last_day_year).
joint_return_or_s2_a(Taxp,Joint_return,Surviving_spouse,Taxy):-
    joint_return_(Joint_return),person(Taxp),
    s2_a(Surviving_spouse,_,Taxy).


%(B) $275,000 in the case of a head of household (as defined in section 2(b)),
s68_b_1_B(Taxp,Aa,Taxy) :-
    s2_b(Taxp,_,Taxy),
    amount("B",Aa).

%(C) $250,000 in the case of an individual who is not married and who is not a surviving spouse or head of household, and
s68_b_1_C(Taxp,Aa,Taxy) :-
    person(Taxp),year(Taxy),
    not_s7703(Taxp,_,_,Taxy),
    not_s2_a(Taxp,_,Taxy), 
    not_s2_b(Taxp,_,Taxy),
    amount("C",Aa).

%(D) ½ the amount applicable under subparagraph (A) in the case of a married individual filing a separate return.
s68_b_1_D(Taxp,Aa,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    not_joint_return_def(Taxp,Spouse,Taxy),
    amount("D",Aa).

joint_return_def(Taxp,Spouse,Taxy):-
    joint_return_(Joint_return),
    agent_(Joint_return,Taxp),
    agent_(Joint_return,Spouse),
    first_day_year(Taxy,First_day_year),
    start_(Joint_return,First_day_year),
    last_day_year(Taxy,Last_day_year),
    end_(Joint_return,Last_day_year).

%For purposes of this paragraph, marital status shall be determined under section 7703.

%(f) Section not to apply

%This section shall not apply to any taxable year beginning after December 31, 2017, and before January 1, 2026.
s68_f(Taxy) :-
    between(2018,2025,Taxy).

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).


contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
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
    not_same_person(Taxp,Spouse),
	s7703_a(Taxp,Spouse,Marriage,Taxy),
	not_s7703_b(Taxp,Spouse,Taxy).

%(a) General rule
s7703_a(Taxp,Spouse,Marriage,Taxy) :-
	s7703_a_1(Taxp,Spouse,Marriage,_,Taxy),
	not_s7703_a_2(Taxp,Spouse,Marriage,_,Taxy).

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
	not_same_person(Taxp,Spouse),
    s7703_a_1_start(Marriage,Start_marriage,First_day_year),
    is_before(Start_marriage,Last_day_year),
	s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage).

s7703_a_1_death_spouse_if(Spouse,S13,First_day_year,Last_day_year,Start_marriage):-
	s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),
	% such determination shall be made as of the time of such death
	is_before(Start_marriage,S13),
	% marriage was still ongoing at death
	marriage_(Marriage),not_end_(Marriage,_).
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
	not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),
	s7703_a_1_end_marriage(Marriage,Spouse,First_day_next_year).


s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year):-
	% if spouse died during taxable year
	death_(Death_spouse),
	agent_(Death_spouse,Spouse),
	start_(Death_spouse,S13),
	is_before(First_day_year,S13),
	is_before(S13,Last_day_year).

s7703_a_1_end_marriage(Marriage,Spouse,First_day_next_year):-
	marriage_(Marriage),not_end_(Marriage,_),s7703_a_1_death(Spouse,First_day_next_year).
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
	not_s7703_a_1_death_2(Spouse,Spouse_dies).

s7703_a_1_death_2(Spouse,Spouse_dies):-
	% if spouse died,
	death_(Spouse_dies),
	agent_(Spouse_dies,Spouse).

s7703_a_1_start(Marriage,Start_marriage,First_day_year):-
	date(First_day_year),marriage_(Marriage),
	not_start_(Marriage,_),
	Start_marriage = First_day_year.
s7703_a_1_start(Marriage,Start_marriage,First_day_year):-
	date(First_day_year),
	start_(Marriage,Start_marriage).

%(2) an individual legally separated from his spouse under a decree of divorce or of separate maintenance shall not be considered as married.
s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
	not_same_person(Taxp,Spouse),
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
	not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year),
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
	not_end_(Child_lives_at_home,_).
s7703_b_1_end(Child_lives_at_home,End_time):-
	end_(Child_lives_at_home,End_time).

%(2) such individual furnishes over one-half of the cost of maintaining such household during the taxable year, and
s7703_b_2(Taxp,Household,Cost,Taxy) :-
	person(Taxp),year(Taxy),household(Household),
	% Payment_by_individual = #sum{Payment_amount : 
	% 		payment_(Payment),
	% 		residence_(Residence),
	% 		agent_(Payment,Taxp),
	% 		patient_(Residence,Household),
	% 		s7703_b_2_purpose(Payment,Residence,Household),
	% 		amount_(Payment,Payment_amount),
	% 		start_(Payment,Payment_time), % assuming it's a single day
	% 		date_split(Payment_time,Taxy_payment,M1,D1),
	% 		Taxy=Taxy_payment_int},
	% Cost = #sum{Payment_amount :
	% 		payment_(Payment),
	% 		residence_(Residence),
	% 		patient_(Residence,Household),
	% 		s7703_b_2_purpose(Payment,Residence,Household),
	% 		amount_(Payment,Payment_amount),
	% 		start_(Payment,Payment_time), % assuming it's a single day
	% 		date_split(Payment_time,Taxy_payment,M1,D1),
	% 		Taxy=Taxy_payment_int},
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
	not_end_(Spouse_lives_in_household,_).
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
    % Num_days = #count{Day :
	% 		date_split(Day,Y,M,D),
	% 		M>6,
    %         s7703_b_3_is_member_of_household(Spouse,Household,Day)},
    Num_days=0.

%such individual shall not be considered as married.

assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
assumption(not_s152(Dependent,Taxp,Taxy)).
assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
assumption(not_s151_d_5(Ea,Taxy)).
assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
assumption(not_s152_b_1(Taxp,Otaxp,Taxy)).
assumption(not_s152_b_2(Dependent,S21,Spouse,Taxy)).
assumption(not_individual_death(Individual,Death_time)).
assumption(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy)).
assumption(not_s152_c_3_dependent_born(Dependent)).
assumption(not_s152_c(Dependent,Taxp,Taxy)).
assumption(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)).
assumption(not_purpose_(Service, Label)).
assumption(not_type_(Service,Type)).
assumption(not_means_(Remuneration,Means)).
assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_plan_(Plan)).
assumption(not_s3306_a_3(Employer,Wages,Caly)).
assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
assumption(not_medium_is_cash(Medium)).
assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_s3306_b_11(Remuneration,Service,Medium)).
assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
assumption(not_s3306_c_1(Service,Caly)).
assumption(not_s3306_c_2(Service,Location,Caly)).
assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_6(Service)).
assumption(not_s3306_c_7(Service,Employer)).
assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_11(Service,Employer)).
assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_16(Service,Employer)).
assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
assumption(not_s3306_c_1_B_not(Service,Employee)).
assumption(not_location_(Service,Location)).
assumption(not_country_(Geographical_location,Country)).
assumption(not_s3306_c_B_agreement(Location)).
assumption(not_s3306_c_1_A_and_B(Service,Caly)).
assumption(not_country_equals_usa(Location)).
assumption(not_location_equals_usa(Location)).
assumption(not_employer_is_usa_government(Service,Employer)).
assumption(not_s7703_b(Taxp,Spouse,Taxy)).
assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).

contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
contrary(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)) :-
    assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
contrary(not_s151_b_joint_return(Taxp,Spouse,Taxy),s151_b_joint_return(Taxp,Spouse,Taxy)) :-
    assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
contrary(not_s152(Dependent,Taxp,Taxy),s152(Dependent,Taxp,Taxy)) :-
    assumption(not_s152(Dependent,Taxp,Taxy)).
contrary(not_s151_d_2(Taxp,Otaxp,Ea,Taxy),s151_d_2(Taxp,Otaxp,Ea,Taxy)) :-
    assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
contrary(not_s151_d_5(Ea,Taxy),s151_d_5(Ea,Taxy)) :-
    assumption(not_s151_d_5(Ea,Taxy)).
contrary(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),s151_d_3(Taxp,Exemption_in,Ea,Taxy)) :-
    assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
contrary(not_s151_d_3_B_separate_return(Taxp,Taxy),s151_d_3_B_separate_return(Taxp,Taxy)) :-
    assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
contrary(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse),s151_d_3_B_joint_return(Taxp,Taxy,Spouse)) :-
    assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
contrary(not_purpose_(Service, Label),purpose_(Service, Label)) :-
    assumption(not_purpose_(Service, Label)).
contrary(not_type_(Service,Type),type_(Service,Type)) :-
    assumption(not_type_(Service,Type)).
contrary(not_means_(Remuneration,Means),means_(Remuneration,Means)) :-
    assumption(not_means_(Remuneration,Means)).
contrary(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_plan_(Plan),plan_(Plan)) :-
    assumption(not_plan_(Plan)).
contrary(not_s3306_a_3(Employer,Wages,Caly),s3306_a_3(Employer,Wages,Caly)) :-
    assumption(not_s3306_a_3(Employer,Wages,Caly)).
contrary(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92),s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)) :-
    assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
contrary(not_medium_is_cash(Medium),medium_is_cash(Medium)) :-
    assumption(not_medium_is_cash(Medium)).
contrary(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_s3306_b_11(Remuneration,Service,Medium),s3306_b_11(Remuneration,Service,Medium)) :-
    assumption(not_s3306_b_11(Remuneration,Service,Medium)).
contrary(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly),s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)) :-
    assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
contrary(not_s3306_c_1(Service,Caly),s3306_c_1(Service,Caly)) :-
    assumption(not_s3306_c_1(Service,Caly)).
contrary(not_s3306_c_2(Service,Location,Caly),s3306_c_2(Service,Location,Caly)) :-
    assumption(not_s3306_c_2(Service,Location,Caly)).
contrary(not_s3306_c_5(Service,Employer,Employee,Workday),s3306_c_5(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_6(Service),s3306_c_6(Service)) :-
    assumption(not_s3306_c_6(Service)).
contrary(not_s3306_c_7(Service,Employer),s3306_c_7(Service,Employer)) :-
    assumption(not_s3306_c_7(Service,Employer)).
contrary(not_s3306_c_10(Service,Employer,Employee,Workday),s3306_c_10(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_11(Service,Employer),s3306_c_11(Service,Employer)) :-
    assumption(not_s3306_c_11(Service,Employer)).
contrary(not_s3306_c_13(Service,Employer,Employee,Workday),s3306_c_13(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_16(Service,Employer),s3306_c_16(Service,Employer)) :-
    assumption(not_s3306_c_16(Service,Employer)).
contrary(not_s3306_c_21(Service,Employee,S235,Workday),s3306_c_21(Service,Employee,S235,Workday)) :-
    assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
contrary(not_s3306_c_1_B_not(Service,Employee),s3306_c_1_B_not(Service,Employee)) :-
    assumption(not_s3306_c_1_B_not(Service,Employee)).
contrary(not_location_(Service,Location),location_(Service,Location)) :-
    assumption(not_location_(Service,Location)).
contrary(not_country_(Geographical_location,Country),country_(Geographical_location,Country)) :-
    assumption(not_country_(Geographical_location,Country)).
contrary(not_s3306_c_B_agreement(Location),s3306_c_B_agreement(Location)) :-
    assumption(not_s3306_c_B_agreement(Location)).
contrary(not_s3306_c_1_A_and_B(Service,Caly),s3306_c_1_A_and_B(Service,Caly)) :-
    assumption(not_s3306_c_1_A_and_B(Service,Caly)).
contrary(not_country_equals_usa(Location),country_equals_usa(Location)) :-
    assumption(not_country_equals_usa(Location)).
contrary(not_location_equals_usa(Location),location_equals_usa(Location)) :-
    assumption(not_location_equals_usa(Location)).
contrary(not_employer_is_usa_government(Service,Employer),employer_is_usa_government(Service,Employer)) :-
    assumption(not_employer_is_usa_government(Service,Employer)).
contrary(not_s7703_b(Taxp,Spouse,Taxy),s7703_b(Taxp,Spouse,Taxy)) :-
    assumption(not_s7703_b(Taxp,Spouse,Taxy)).
contrary(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy),s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)) :-
    assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
contrary(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year),s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)) :-
    assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)) :-
    assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_2(Spouse,Spouse_dies),s7703_a_1_death_2(Spouse,Spouse_dies)) :-
    assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).
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

between(Y1,Y2,Year):- year(Y1),year(Y2),Year<Y2+1,Year>Y1-1.

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
month_days(Month,Days):- Month=2, Days=100.
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

leap_year(A):-year(A),0 = A - 4 * (A/4).

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
    Inc=100,
    leap_year(Y1),
    Days = D2 + 29 - D1,
    Increment = 1.
duration_days(FromDay,ToDay,Days,Increment):-
    date_split(FromDay,Y1,M1,D1),
    date_split(ToDay,Y2,M2,D2),
    D1 > D2,
    month_days(M1,Inc),
    Inc=100,
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
    M1 + Inc < M2+1,
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
    % Total = #sum{Days,Month: Month<M, month_days_norm(Month,Days)},
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
    not_same_person(X,Y),
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
    relationship(Relationship),date(Day_start),not_start_(Relationship,_).
relationship_start(Relationship,Day_start):-   
    start_(Relationship,Day_start).

relationship_end(Relationship,Day_end):-
    relationship(Relationship),date(Day_end),not_end_(Relationship,_).
relationship_end(Relationship,Day_end):-
    end_(Relationship,Day_end). 

is_sibling_of(X,Y,Day_start,Day_end) :- % X is the sibling of Y on from Day_start to Day_end if...
	% there is a brother or sister relationship
	brother_and_sister(Relationship),
	% X is somehow involved in it
	agent_or_patient(Relationship,X),
	% and so is Y
    agent_or_patient(Relationship,Y),
    not_same_person(X,Y),
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
    not_same_person(X,Y),
    wedding_start(Marriage,Start_time),
    later(Day_start_2,Day_start_x,Day_start_y),
    later(Day_start,Day_start_2,Start_time),
    wedding_end(Marriage,End_time),
    earlier(Day_end_2,Day_end_x,Day_end_y),
    earlier(Day_end,Day_end_2,End_time).

wedding_start(Marriage,Day_start):-
    marriage_(Marriage),date(Day_start),not_start_(Marriage,_).
wedding_start(Marriage,Day_start):-   
    start_(Marriage,Day_start).

wedding_end(Marriage,Day_end):-
    marriage_(Marriage),date(Day_end),not_end_(Marriage,_).
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
    not_same_person(X,Y),
    wedding_start(Marriage,Start_time),
    later(Day_start,Start_time,Day_start_y),
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

is_child_in_law_of(X,Y,Day_start,Day_end) :- % X is child in law of Y if
	is_child_of(ChildY,Y,Day_start_y,Day_end_y), % one of the children of Y
	marriage_(Marriage), % got married with X
	agent_(Marriage,ChildY),
	agent_(Marriage,X),
    not_same_person(X,Y),
    wedding_start(Marriage,Start_time),
    later(Day_start,Start_time,Day_start_y),
	wedding_end(Marriage,End_time),
    earlier(Day_end,End_time,Day_end_y).

is_parent_in_law_of(X,Y,Day_start,Day_end) :- % X is parent in law of Y if
	is_child_of(Y,ParentY,Day_start_y,Day_end_y), % one of the parents of Y
	marriage_(Marriage), % got married with X
	agent_(Marriage,ParentY),
	agent_(Marriage,X),
    not_same_person(X,Y),
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
    not_same_person(X,Y),
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
    not_gross_income_joint(Person,Year,First_day_year,Last_day_year),
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
    % Incomes = #sum{Amount,Income : 
    %     income_(Income),
    %     agent_(Income,Person),
    %     amount_(Income,Amount),
    %     start_(Income,Start_time),
    %     is_before(First_day_year,Start_time),
    %     is_before(Start_time,Last_day_year)},
    % Payments = #sum{Amount,Payment:
    %     payment_(Payment),
    %     patient_(Payment,Person),
    %     amount_(Payment,Amount),
    %     start_(Payment,Start_time),
    %     is_before(First_day_year,Start_time),
    %     is_before(Start_time,Last_day_year)},
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
    not_s1(Taxp,Taxy,_,_),
    Income_tax = 0.

tax_s3301(Taxp,Taxy,Employment_tax):-
    s3301(Taxp,Taxy,_,_,_,Employment_tax).
tax_s3301(Taxp,Taxy,Employment_tax):-
    person(Taxp),year(Taxy),
    not_s3301(Taxp,Taxy,_,_,_,_),
    Employment_tax = 0.

same_person(P1,P2):-
    person(P1),person(P2),P1=P2.

same_marriage(M1,M2):-
    marriage_(M1),marriage_(M2),M1=M2.


assumption(not_same_person(P1,P2)).
assumption(not_same_marriage(M1,M2)).
assumption(not_s1(Taxp, Taxy, Taxinc, Tax)).
assumption(not_s3301(Employer,Caly,Wages,Employee,Employment,Tax)).
assumption(not_gross_income_joint(Person,Year,First_day_year,Last_day_year)).
assumption(not_start_(Event,Time)).
assumption(not_end_(Event,Time)).
assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
assumption(not_s2_a(Taxp,Spouse,Taxy)).
assumption(not_s2_b(Taxp,Dependent,Taxy)).
assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
assumption(not_spouse_dead(Spouse_dies,Spouse)).
assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
assumption(not_s152_b(Dependent,Taxp,Taxy)).
assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
assumption(not_s63_c_6(Taxp,Taxy,Standed)).
assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
assumption(not_s63_c_7_i(Taxy,Amount)).
assumption(not_s63_c_7_ii(Taxy,Amount)).
assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
assumption(not_s63_f_3(Taxp,Taxy,Amount)).
assumption(not_s63_f_1_A(Taxp,Taxy)).
assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
assumption(not_s63_f_2_A(Taxp,Taxy)).
assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
assumption(not_s68_f(Taxy)).
assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
assumption(not_s152(Dependent,Taxp,Taxy)).
assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
assumption(not_s151_d_5(Ea,Taxy)).
assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
assumption(not_s152_b_1(Taxp,Otaxp,Taxy)).
assumption(not_s152_b_2(Dependent,S21,Spouse,Taxy)).
assumption(not_individual_death(Individual,Death_time)).
assumption(not_s152_c_1_E_joint_return(Dependent,Spouse,Taxy)).
assumption(not_s152_c_3_dependent_born(Dependent)).
assumption(not_s152_c(Dependent,Taxp,Taxy)).
assumption(not_s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year)).
assumption(not_purpose_(Service, Label)).
assumption(not_type_(Service,Type)).
assumption(not_means_(Remuneration,Means)).
assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_plan_(Plan)).
assumption(not_s3306_a_3(Employer,Wages,Caly)).
assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
assumption(not_medium_is_cash(Medium)).
assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
assumption(not_s3306_b_11(Remuneration,Service,Medium)).
assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
assumption(not_s3306_c_1(Service,Caly)).
assumption(not_s3306_c_2(Service,Location,Caly)).
assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_6(Service)).
assumption(not_s3306_c_7(Service,Employer)).
assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_11(Service,Employer)).
assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
assumption(not_s3306_c_16(Service,Employer)).
assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
assumption(not_s3306_c_1_B_not(Service,Employee)).
assumption(not_location_(Service,Location)).
assumption(not_country_(Geographical_location,Country)).
assumption(not_s3306_c_B_agreement(Location)).
assumption(not_s3306_c_1_A_and_B(Service,Caly)).
assumption(not_country_equals_usa(Location)).
assumption(not_location_equals_usa(Location)).
assumption(not_employer_is_usa_government(Service,Employer)).
assumption(not_s7703_b(Taxp,Spouse,Taxy)).
assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).


contrary(not_same_person(P1,P2),same_person(P1,P2)):-
    assumption(not_same_person(P1,P2)).
contrary(not_same_marriage(M1,M2),same_marriage(M1,M2)):-
    assumption(not_same_marriage(M1,M2)).
contrary(not_s1(Taxp, Taxy, Taxinc, Tax), s1(Taxp, Taxy, Taxinc, Tax)) :-
    assumption(not_s1(Taxp, Taxy, Taxinc, Tax)).
contrary(not_s3301(Employer,Caly,Wages,Employee,Employment,Tax), s3301(Employer,Caly,Wages,Employee,Employment,Tax)) :-
    assumption(not_s3301(Employer,Caly,Wages,Employee,Employment,Tax)).
contrary(not_gross_income_joint(Person,Year,First_day_year,Last_day_year), gross_income_joint(Person,Year,First_day_year,Last_day_year)) :-
    assumption(not_gross_income_joint(Person,Year,First_day_year,Last_day_year)).
contrary(not_start_(Event,Time),start_(Event,Time)) :- 
    assumption(not_start_(Event,Time)).
contrary(not_end_(Event,Time),end_(Event,Time)) :- 
    assumption(not_end_(Event,Time)).
contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
        nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
            assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
        single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
            assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a(Taxp,Spouse,Taxy)).
contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b(Taxp,Dependent,Taxy)).
contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
    assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).
contrary(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy),s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)):-
    assumption(not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy)).
contrary(not_s2_a_2_B(Taxp,Spouse,Taxy),s2_a_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_a_2_B(Taxp,Spouse,Taxy)).
contrary(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year), 
        nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)) :- 
            assumption(not_nonresident_alien_cant_file_jointly_2(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year)).
contrary(not_s2_b_3(Taxp,Dependent,Taxy),s2_b_3(Taxp,Dependent,Taxy)):-
    assumption(not_s2_b_3(Taxp,Dependent,Taxy)).
contrary(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy),s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)):-
    assumption(not_s2_b_2_A(Taxp,Spouse,S98,Marriage,Taxy)).
contrary(not_s2_b_2_B(Taxp,Spouse,Taxy),s2_b_2_B(Taxp,Spouse,Taxy)):-
    assumption(not_s2_b_2_B(Taxp,Spouse,Taxy)).
contrary(not_spouse_dead(Spouse_dies,Spouse),spouse_dead(Spouse_dies,Spouse)):-
    assumption(not_spouse_dead(Spouse_dies,Spouse)).
contrary(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
        individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)):-
            assumption(not_individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year)).
contrary(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy),s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)):-
    assumption(not_s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy)).
contrary(not_s152_b(Dependent,Taxp,Taxy),s152_b(Dependent,Taxp,Taxy)):-
    assumption(not_s152_b(Dependent,Taxp,Taxy)).
contrary(not_s152_a_1(Dependent,Taxp,Taxy),s152_a_1(Dependent,Taxp,Taxy)):-
    assumption(not_s152_a_1(Dependent,Taxp,Taxy)).
contrary(not_valid_relationship_s152_d_2(Dependent,Taxp),valid_relationship_s152_d_2(Dependent,Taxp)):-
    assumption(not_valid_relationship_s152_d_2(Dependent,Taxp)).
contrary(not_s63_b(Taxp,Taxy,Taxinc,Grossinc),s63_b(Taxp,Taxy,Taxinc,Grossinc)) :-
    assumption(not_s63_b(Taxp,Taxy,Taxinc,Grossinc)).
contrary(not_s63_d(Taxp,Itemded,Total_amount,Taxy),s63_d(Taxp,Itemded,Total_amount,Taxy)) :-
    assumption(not_s63_d(Taxp,Itemded,Total_amount,Taxy)).
contrary(not_s63_c_6(Taxp,Taxy,Standed),s63_c_6(Taxp,Taxy,Standed)) :-
    assumption(not_s63_c_6(Taxp,Taxy,Standed)).
contrary(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd),s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)) :-
    assumption(not_s63_c_5(Taxp,S45,Grossinc,Taxy,Bassd)).
contrary(not_s63_c_2_B(Taxp,Taxy,Bassd),s63_c_2_B(Taxp,Taxy,Bassd)) :-
    assumption(not_s63_c_2_B(Taxp,Taxy,Bassd)).
contrary(not_s63_c_2_A(Taxp,Taxy,Multiplier),s63_c_2_A(Taxp,Taxy,Multiplier)) :-
    assumption(not_s63_c_2_A(Taxp,Taxy,Multiplier)).
contrary(not_s63_c_7_i(Taxy,Amount),s63_c_7_i(Taxy,Amount)) :-
    assumption(not_s63_c_7_i(Taxy,Amount)).
contrary(not_s63_c_7_ii(Taxy,Amount),s63_c_7_ii(Taxy,Amount)) :-
    assumption(not_s63_c_7_ii(Taxy,Amount)).
contrary(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year),
        couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)) :-
            assumption(not_couple_joint_return(Joint_return,Taxp,Spouse,First_day_year,Last_day_year)).
contrary(not_s63_f_3(Taxp,Taxy,Amount),s63_f_3(Taxp,Taxy,Amount)) :-
    assumption(not_s63_f_3(Taxp,Taxy,Amount)).
contrary(not_s63_f_1_A(Taxp,Taxy),s63_f_1_A(Taxp,Taxy)) :-
    assumption(not_s63_f_1_A(Taxp,Taxy)).
contrary(not_s63_f_1_B(Taxp,Spouse,Taxy),s63_f_1_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_1_B(Taxp,Spouse,Taxy)).
contrary(not_s63_f_2_A(Taxp,Taxy),s63_f_2_A(Taxp,Taxy)) :-
    assumption(not_s63_f_2_A(Taxp,Taxy)).
contrary(not_s63_f_2_B(Taxp,Spouse,Taxy),s63_f_2_B(Taxp,Spouse,Taxy)) :-
    assumption(not_s63_f_2_B(Taxp,Spouse,Taxy)).
contrary(not_s68_f(Taxy),s68_f(Taxy)) :-
    assumption(not_s68_f(Taxy)).
contrary(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy),s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)) :-
    assumption(not_s68_a(Taxp,Agi,Aa,Itemded,S7,Taxy)).
contrary(not_joint_return_def(Taxp,Spouse,Taxy),joint_return_def(Taxp,Spouse,Taxy)) :-
    assumption(not_joint_return_def(Taxp,Spouse,Taxy)).
contrary(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy),s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)) :-
    assumption(not_s151_joint_return(Taxp,First_day_year,Last_day_year,Taxy)).
contrary(not_s151_b_joint_return(Taxp,Spouse,Taxy),s151_b_joint_return(Taxp,Spouse,Taxy)) :-
    assumption(not_s151_b_joint_return(Taxp,Spouse,Taxy)).
contrary(not_s152(Dependent,Taxp,Taxy),s152(Dependent,Taxp,Taxy)) :-
    assumption(not_s152(Dependent,Taxp,Taxy)).
contrary(not_s151_d_2(Taxp,Otaxp,Ea,Taxy),s151_d_2(Taxp,Otaxp,Ea,Taxy)) :-
    assumption(not_s151_d_2(Taxp,Otaxp,Ea,Taxy)).
contrary(not_s151_d_5(Ea,Taxy),s151_d_5(Ea,Taxy)) :-
    assumption(not_s151_d_5(Ea,Taxy)).
contrary(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy),s151_d_3(Taxp,Exemption_in,Ea,Taxy)) :-
    assumption(not_s151_d_3(Taxp,Exemption_in,Ea,Taxy)).
contrary(not_s151_d_3_B_separate_return(Taxp,Taxy),s151_d_3_B_separate_return(Taxp,Taxy)) :-
    assumption(not_s151_d_3_B_separate_return(Taxp,Taxy)).
contrary(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse),s151_d_3_B_joint_return(Taxp,Taxy,Spouse)) :-
    assumption(not_s151_d_3_B_joint_return(Taxp,Taxy,Spouse)).
contrary(not_purpose_(Service, Label),purpose_(Service, Label)) :-
    assumption(not_purpose_(Service, Label)).
contrary(not_type_(Service,Type),type_(Service,Type)) :-
    assumption(not_type_(Service,Type)).
contrary(not_means_(Remuneration,Means),means_(Remuneration,Means)) :-
    assumption(not_means_(Remuneration,Means)).
contrary(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_2(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_plan_(Plan),plan_(Plan)) :-
    assumption(not_plan_(Plan)).
contrary(not_s3306_a_3(Employer,Wages,Caly),s3306_a_3(Employer,Wages,Caly)) :-
    assumption(not_s3306_a_3(Employer,Wages,Caly)).
contrary(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92),s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)) :-
    assumption(not_s3306_b_7(Remuneration,Service,Employer,Employee,Medium,S92)).
contrary(not_medium_is_cash(Medium),medium_is_cash(Medium)) :-
    assumption(not_medium_is_cash(Medium)).
contrary(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan),s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)) :-
    assumption(not_s3306_b_10(Remuneration,Service,Employer,Employee,Payee,Plan)).
contrary(not_s3306_b_11(Remuneration,Service,Medium),s3306_b_11(Remuneration,Service,Medium)) :-
    assumption(not_s3306_b_11(Remuneration,Service,Medium)).
contrary(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly),s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)) :-
    assumption(not_s3306_b_15(Remuneration,Employer,Payee,Employee,Caly)).
contrary(not_s3306_c_1(Service,Caly),s3306_c_1(Service,Caly)) :-
    assumption(not_s3306_c_1(Service,Caly)).
contrary(not_s3306_c_2(Service,Location,Caly),s3306_c_2(Service,Location,Caly)) :-
    assumption(not_s3306_c_2(Service,Location,Caly)).
contrary(not_s3306_c_5(Service,Employer,Employee,Workday),s3306_c_5(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_5(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_6(Service),s3306_c_6(Service)) :-
    assumption(not_s3306_c_6(Service)).
contrary(not_s3306_c_7(Service,Employer),s3306_c_7(Service,Employer)) :-
    assumption(not_s3306_c_7(Service,Employer)).
contrary(not_s3306_c_10(Service,Employer,Employee,Workday),s3306_c_10(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_10(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_11(Service,Employer),s3306_c_11(Service,Employer)) :-
    assumption(not_s3306_c_11(Service,Employer)).
contrary(not_s3306_c_13(Service,Employer,Employee,Workday),s3306_c_13(Service,Employer,Employee,Workday)) :-
    assumption(not_s3306_c_13(Service,Employer,Employee,Workday)).
contrary(not_s3306_c_16(Service,Employer),s3306_c_16(Service,Employer)) :-
    assumption(not_s3306_c_16(Service,Employer)).
contrary(not_s3306_c_21(Service,Employee,S235,Workday),s3306_c_21(Service,Employee,S235,Workday)) :-
    assumption(not_s3306_c_21(Service,Employee,S235,Workday)).
contrary(not_s3306_c_1_B_not(Service,Employee),s3306_c_1_B_not(Service,Employee)) :-
    assumption(not_s3306_c_1_B_not(Service,Employee)).
contrary(not_location_(Service,Location),location_(Service,Location)) :-
    assumption(not_location_(Service,Location)).
contrary(not_country_(Geographical_location,Country),country_(Geographical_location,Country)) :-
    assumption(not_country_(Geographical_location,Country)).
contrary(not_s3306_c_B_agreement(Location),s3306_c_B_agreement(Location)) :-
    assumption(not_s3306_c_B_agreement(Location)).
contrary(not_s3306_c_1_A_and_B(Service,Caly),s3306_c_1_A_and_B(Service,Caly)) :-
    assumption(not_s3306_c_1_A_and_B(Service,Caly)).
contrary(not_country_equals_usa(Location),country_equals_usa(Location)) :-
    assumption(not_country_equals_usa(Location)).
contrary(not_location_equals_usa(Location),location_equals_usa(Location)) :-
    assumption(not_location_equals_usa(Location)).
contrary(not_employer_is_usa_government(Service,Employer),employer_is_usa_government(Service,Employer)) :-
    assumption(not_employer_is_usa_government(Service,Employer)).
contrary(not_s7703_b(Taxp,Spouse,Taxy),s7703_b(Taxp,Spouse,Taxy)) :-
    assumption(not_s7703_b(Taxp,Spouse,Taxy)).
contrary(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy),s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)) :-
    assumption(not_s7703_a_2(Taxp,Spouse,Marriage,S19,Taxy)).
contrary(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year),s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)) :-
    assumption(not_s7703_b_1_joint_return(Taxp,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year),s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)) :-
    assumption(not_s7703_a_1_death_spouse(Spouse,S13,First_day_year,Last_day_year)).
contrary(not_s7703_a_1_death_2(Spouse,Spouse_dies),s7703_a_1_death_2(Spouse,Spouse_dies)) :-
    assumption(not_s7703_a_1_death_2(Spouse,Spouse_dies)).