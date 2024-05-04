% finance(17330).
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
    not s63_b(Taxp,Taxy,_,_),
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
    not s63_d(Taxp,_,_,Taxy),
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
    not s63_c_6(Taxp,Taxy,_),
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
    not s63_c_5(Taxp,_,_,Taxy,_),
    Bassd = Basic_amount.

%(B) the additional standard deduction.
s63_c_1_B(Taxp,Taxy,Addsd) :-
    s63_c_3(Taxp,Addsd,Taxy).

%(2) Basic standard deduction

%For purposes of paragraph (1), the basic standard deduction is-
s63_c_2(Taxp,Taxy,Bassd) :-
    s63_c_2_A(Taxp,Taxy,Multiplier),
    not s63_c_2_B(Taxp,Taxy,_),
    s63_c_2_C(Taxy,Default_amount),
    Bassd = Multiplier*Default_amount.
s63_c_2(Taxp,Taxy,Bassd) :-
    not s63_c_2_A(Taxp,Taxy,_),
    s63_c_2_B(Taxp,Taxy,Bassd).
s63_c_2(Taxp,Taxy,Bassd) :-
    person(Taxp),
    not s63_c_2_A(Taxp,Taxy,_),
    not s63_c_2_B(Taxp,Taxy,_),
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
    not s63_c_7_i(Taxy,_),
    Bassd = 4400.

%(C) $3,000 in any other case.
s63_c_2_C(Taxy,Bassd) :-
    s63_c_7_ii(Taxy,Bassd).
s63_c_2_C(Taxy,Bassd) :-
    year(Taxy),
    not s63_c_7_ii(Taxy,_),
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
   not couple_joint_return(_,Taxp,Spouse,First_day_year,Last_day_year),
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
    date(Last_day_year),not start_(Taxp_is_nra,_).
start_taxp_is_nra(Taxp_is_nra,Start_nra,Last_day_year):-
    start_(Taxp_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year).

end_taxp_is_nra(Taxp_is_nra,End_nra,First_day_year):-
    nonresident_alien_(Taxp_is_nra), date(End_nra),
    date(First_day_year),not end_(Taxp_is_nra,_).
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
    date(Last_day_year), not start_(Taxp_is_trust,_).
start_taxp_is_trust(Taxp_is_trust,Start_trust,Last_day_year):-
    start_(Taxp_is_trust,Start_trust),
    is_before(Start_trust,Last_day_year).

end_taxp_is_trust(Taxp_is_trust,End_trust,First_day_year):-
    nonresident_alien_(Taxp_is_trust), date(End_trust),
    date(First_day_year),not end_(Taxp_is_trust,_).
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
    not s63_f_3(Taxp,Taxy,_),
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
    not s63_f_1_A(Taxp,Taxy),Count1=0.  

s63_f_1_count2(Taxp,Taxy,Count2):-
    s63_f_1_B(Taxp,_,Taxy),Count2=1.  
s63_f_1_count2(Taxp,Taxy,Count2):-  
    person(Taxp),year(Taxy),
    not s63_f_1_B(Taxp,_,Taxy),Count2=0.  


%(A) for himself if he has attained age 65 before the close of his taxable year, and
s63_f_1_A(Taxp,Taxy) :-
    birth_(Taxp_birth),
    agent_(Taxp_birth,Taxp),
    start_(Taxp_birth,Day_of_birth),
    last_day_year(Taxy,Last_day_year),
    duration(Day_of_birth,Last_day_year,Y,M,D),
    Y >= 65.

%(B) for the spouse of the taxpayer if the spouse has attained age 65 before the close of the taxable year and an additional exemption is allowable to the taxpayer for such spouse under section 151(b).
s63_f_1_B(Taxp,Spouse,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    birth_(Spouse_birth),
    agent_(Spouse_birth,Spouse),
    start_(Spouse_birth,Day_of_birth),
    last_day_year(Taxy,Last_day_year),
    duration(Day_of_birth,Last_day_year,Y,M,D),
    Y >= 65,
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
    not s63_f_2_A(Taxp,Taxy),Count1=0.  

s63_f_2_count2(Taxp,Taxy,Count2):-
    s63_f_2_B(Taxp,_,Taxy),Count2=600.  
s63_f_2_count2(Taxp,Taxy,Count2):-  
    person(Taxp),year(Taxy),
    not s63_f_2_B(Taxp,_,Taxy),Count2=0.  
    

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
    not s7703(Taxp,_,_,Taxy),
    not s2_a(Taxp,_,Taxy),
    Amount = 750.

%(g) Marital status

%For purposes of this section, marital status shall be determined under section 7703.
