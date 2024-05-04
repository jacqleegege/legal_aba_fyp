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

start2(Start_time,First_day) :- date(Start_time), date(First_day), not_start_(someone_is_nra,_),Start_time=First_day.
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
s1_a_i(Taxinc,Tax) :-
    finance(Taxinc),Taxinc <= 36900, Tax = (Taxinc*15)/100.
%(ii) $5,535, plus 28% of the excess over $36,900 if the taxable income is over $36,900 but not over $89,150;
s1_a_ii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 89150,
    36900 < Taxinc,
    Tax = 5535+(Taxinc-36900)*28/100.
%(iii) $20,165, plus 31% of the excess over $89,150 if the taxable income is over $89,150 but not over $140,000;
s1_a_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 140000,
    89150 < Taxinc,
    Tax = 20165+(Taxinc-89150)*31/100.
%(iv) $35,928.50, plus 36% of the excess over $140,000 if the taxable income is over $140,000 but not over $250,000;
s1_a_iv(Taxinc,Tax) :-
    finance(Taxinc), finance(Tax),
    Taxinc <= 250000,
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
    Taxinc <= 29600,
    Tax = (Taxinc*15)/100.
%(ii) $4,440, plus 28% of the excess over $29,600 if the taxable income is over $29,600 but not over $76,400;
s1_b_ii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 76400,
    29600 < Taxinc,
    Tax = 4440+((Taxinc-29600)*28)/100.
%(iii) $17,544, plus 31% of the excess over $76,400 if the taxable income is over $76,400 but not over $127,500;
s1_b_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 127500,
    76400 < Taxinc,
    Tax = 17544+((Taxinc-76400)*31)/100.
%(iv) $33,385, plus 36% of the excess over $127,500 if the taxable income is over $127,500 but not over $250,000;
s1_b_iv(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 250000,
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
    finance(Taxinc), finance(Tax),
    Taxinc <= 22100,
    Tax = (Taxinc*15)/100.
%(ii) $3,315, plus 28% of the excess over $22,100 if the taxable income is over $22,100 but not over $53,500;
s1_c_ii(Taxinc,Tax) :-
    finance(Taxinc), finance(Tax),
    Taxinc <= 53500,
    22100 < Taxinc,
    Tax = 3315+((Taxinc-22100)*28)/100.
%(iii) $12,107, plus 31% of the excess over $53,500 if the taxable income is over $53,500 but not over $115,000;
s1_c_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 115000,
    53500 < Taxinc,
    Tax = 12107+((Taxinc-53500)*31)/100.
%(iv) $31,172, plus 36% of the excess over $115,000 if the taxable income is over $115,000 but not over $250,000;
s1_c_iv(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc <= 250000,
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
    Taxinc <= 18450,
    Tax = (Taxinc*15)/100.
%(ii) $2,767.50, plus 28% of the excess over $18,450 if the taxable income is over $18,450 but not over $44,575;
s1_d_ii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 44575,
    18450 < Taxinc,
    Tax = 2768+((Taxinc-18450)*28)/100.
%(iii) $10,082.50, plus 31% of the excess over $44,575 if the taxable income is over $44,575 but not over $70,000;
s1_d_iii(Taxinc,Tax) :-
    finance(Taxinc),
    Taxinc <= 70000,
    44575 < Taxinc,
    Tax = 10083+(Taxinc-44575)*31/100.
%(iv) $17,964.25, plus 36% of the excess over $70,000 if the taxable income is over $70,000 but not over $125,000;
s1_d_iv(Taxinc,Tax) :-
    finance(Taxinc), 
    Taxinc <= 125000,
    70000 < Taxinc,
    Tax = 17964 +(Taxinc-70000)*36/100.
%(v) $37,764.25, plus 39.6% of the excess over $125,000 if the taxable income is over $125,000
s1_d_v(Taxinc,Tax) :-
    finance(Taxinc), 
    125000 < Taxinc,
    Tax = 37764 +(Taxinc-125000)*396/1000.




not_nonresident_alien_cant_file_jointly(Taxp, Spouse, First_day, Last_day) :- 
    spouse(Spouse), 
    taxpayer(Taxp), 
    date(Last_day), 
    date(First_day), 
    not nonresident_alien_cant_file_jointly(Taxp, Spouse, First_day, Last_day).

not_end_(someone_is_nra,Time) :- date(Time), not end_(someone_is_nra,Time).
not_start_(someone_is_nra,Time) :- date(Time), not start_(someone_is_nra,Time).

not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day) :- 
    joint_return(Joint_return),
    spouse(Spouse), 
    taxpayer(Taxp), 
    year(Taxy),
    date(Last_day), 
    date(First_day), 
    not single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day).

not_s2_a(Taxp,Spouse,Taxy) :- taxpayer(Taxp),year(Taxy), spouse(Spouse), not s2_a(Taxp,Spouse,Taxy).
not_s2_b(Taxp,Dependent,Taxy) :- taxpayer(Taxp),year(Taxy),dependent(Dependent), not s2_b(Taxp,Dependent,Taxy).
not_s7703(Taxp,Spouse,Marriage,Taxy) :- spouse(Spouse), marriage(Marriage), taxpayer(Taxp),year(Taxy),not s7703(Taxp,Spouse,Marriage,Taxy).

% assumption(not_start_(someone_is_nra,Time)).
% assumption(not_end_(someone_is_nra,Time)).
% assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
% assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
% assumption(not_s2_a(Taxp,Spouse,Taxy)).
% assumption(not_s2_b(Taxp,Dependent,Taxy)).
% assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).


% contrary(not_start_(someone_is_nra,Time),start_(someone_is_nra,Time)) :- 
%     assumption(not_start_(someone_is_nra,Time)).
% contrary(not_end_(someone_is_nra,Time),end_(someone_is_nra,Time)) :- 
%     assumption(not_end_(A,Time)).
% contrary(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day), 
%         nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)) :- 
%             assumption(not_nonresident_alien_cant_file_jointly(Taxp,Spouse,First_day,Last_day)).
% contrary(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day),
%         single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)) :-
%             assumption(not_single_return_joint_with_spouse(Joint_return, Taxp, Spouse, Taxy, First_day, Last_day)).
% contrary(not_s2_a(Taxp,Spouse,Taxy),s2_a(Taxp,Spouse,Taxy)):-
%     assumption(not_s2_a(Taxp,Spouse,Taxy)).
% contrary(not_s2_b(Taxp,Dependent,Taxy),s2_b(Taxp,Dependent,Taxy)):-
%     assumption(not_s2_b(Taxp,Dependent,Taxy)).
% contrary(not_s7703(Taxp,Spouse,Marriage,Taxy),s7703(Taxp,Spouse,Marriage,Taxy)):-
%     assumption(not_s7703(Taxp,Spouse,Marriage,Taxy)).




