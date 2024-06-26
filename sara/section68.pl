% finance(17330).
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
    not s68_f(Taxy),
    s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out).

s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out):-
    s68_a(Taxp,_,_,Amount_deductions_in,Reduction,Taxy),
    Amount_deductions_out = Amount_deductions_in-Reduction.
s68_amount_deductions(Taxp,Amount_deductions_in,Taxy,Amount_deductions_out):-
    person(Taxp),year(Taxy),finance(Amount_deductions_in),
    not s68_a(Taxp,_,_,Amount_deductions_in,_,Taxy),
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
    not s7703(Taxp,_,_,Taxy),
    not s2_a(Taxp,_,Taxy), 
    not s2_b(Taxp,_,Taxy),
    amount("C",Aa).

%(D) ½ the amount applicable under subparagraph (A) in the case of a married individual filing a separate return.
s68_b_1_D(Taxp,Aa,Taxy) :-
    s7703(Taxp,Spouse,_,Taxy),
    not joint_return_def(Taxp,Spouse,Taxy),
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
