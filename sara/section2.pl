%§2. Definitions and special rules
person(alice).
person(spouse).
year(2017).
date("2017-01-01").


%(a) Definition of surviving spouse
s2_a(Taxp,Spouse,Taxy) :-
    s2_a_1(Taxp,Spouse,Previous_marriage,_,_,Taxy),
    not s2_a_2(Taxp,Spouse,Previous_marriage,Taxy).

%(1) In general

%For purposes of section 1, the term "surviving spouse" means a taxpayer-
s2_a_1(Taxp,Spouse,Previous_marriage,Household,Dependent,Taxy) :-
    s2_a_1_A(Taxp,Spouse,Previous_marriage,_,Taxy),
    s2_a_1_B(Taxp,Household,Dependent,Taxy).

% check whether the marriage ended with the death of the spouse
marriage_not_ended_with_spouse_death(Marriage, End_marriage, Time_death) :-
    marriage_(Marriage), date(End_marriage), 
    date(Time_death), not end_(Marriage,_).
marriage_not_ended_with_spouse_death(Marriage, End_marriage, Time_death) :-
    end_(Marriage,End_marriage),
    is_before(Time_death,End_marriage).

%(A) whose spouse died during either of the two years immediately preceding the taxable year, and
s2_a_1_A(Taxp,Spouse,Marriage,YS,Taxy) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not Taxp = Spouse,
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
    date(Last_day_year), not end_(Taxpayer_residence,_).
taxp_residence_not_end_after_year(Taxpayer_residence,End_taxpayer_residence,Last_day_year) :-
    end_(Taxpayer_residence,End_taxpayer_residence),
    is_before(Last_day_year,End_taxpayer_residence).

dependent_residence_not_end_after_year(Dependent_residence,End_dependent_residence, Last_day_year) :-
    date(End_dependent_residence), residence_(Dependent_residence),
    date(Last_day_year), not end_(Dependent_residence,_).
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
    not s2_a_2_B(Taxp,Spouse,Taxy).

%(A) if the taxpayer has remarried at any time before the close of the taxable year, or
s2_a_2_A(Taxp,Remarriage,Previous_marriage,S31,Taxy) :-
    marriage_(Previous_marriage),
    agent_(Previous_marriage,Taxp),
    start_(Previous_marriage,Start_previous_marriage),
    marriage_(Remarriage),
    agent_(Remarriage,Taxp),
    start_(Remarriage,S31),
    not Remarriage = Previous_marriage,
    is_before(Start_previous_marriage,S31),
    last_day_year(Taxy,Last_day_year),
    is_before(S31,Last_day_year).

agent2(Taxp,Spouse) :- person(Spouse), agent_(Someone_is_nra,Taxp).
agent2(Taxp,Spouse) :- person(Taxp), agent_(Someone_is_nra,Spouse).

start2(Someone_is_nra, Start_nra, Taxy, Last_day_year) :- 
    year(Taxy),date(Start_nra),date(Last_day_year),
    nonresident_alien_(Someone_is_nra),not start_(Someone_is_nra,_).
start2(Someone_is_nra, Start_nra, Taxy, Last_day_year) :- 
    start_(Someone_is_nra,Start_nra),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_nra,Last_day_year).

end2(Someone_is_nra, End_nra, Taxy, First_day_year) :- 
    year(Taxy),date(End_nra),date(First_day_year),
    nonresident_alien_(Someone_is_nra),not end_(Someone_is_nra,_).
end2(Someone_is_nra, End_nra, Taxy, First_day_year) :- 
    end_(Someone_is_nra,End_nra),
    first_day_year(Taxy,First_day_year),
    is_before(First_day_year,End_nra).
    
nonresident_alien_cant_file_jointly(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year) :-
    nonresident_alien_(Someone_is_nra),
    agent2(Taxp,Spouse),
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
    not nonresident_alien_cant_file_jointly(Taxp,Spouse, Someone_is_nra, Start_nra, End_nra, Taxy, First_day_year, Last_day_year).

%(b) Definition of head of household
s2_b(Taxp,Dependent,Taxy) :- 
    s2_b_1(Taxp,_,Dependent,Taxy),
    % s2_b_2 was incorporated directly into s2_b_1
    not s2_b_3(Taxp,Dependent,Taxy).

%(1) In general

individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year) :-
    marriage_(Marriage),
    agent_(Marriage,Taxp),
    agent_(Marriage,Spouse),
    not Spouse = Taxp,
    start_(Marriage,Start_marriage),
    last_day_year(Taxy,Last_day_year),
    is_before(Start_marriage,Last_day_year),
    individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year),
    not s2_b_2_A(_,_,_,Marriage,Taxy),
    not s2_b_2_B(Taxp,Spouse,Taxy).

individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    death_(Spouse_dies),
    agent_(Spouse_dies,Spouse),
    individual_married_3(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year).
individual_married_2(Taxp,Marriage,Spouse,Taxy,Spouse_dies,Death_time,Last_day_year):-
    death_(Spouse_dies),person(Spouse),date(Death_time),
    date(Last_day_year),person(Taxp),not spouse_dead(Spouse_dies,Spouse),
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
    not end_(Marriage,_).

s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy):-
    s2_b_1_A(Taxp,Household,Dependent,Taxy).
s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy):-
    s2_b_1_B(Taxp,Household,Dependent,_,Taxy).

%An individual shall be considered a head of a household if, and only if, such individual is not married at the close of his taxable year, is not a surviving spouse (as defined in subsection (a)), and either-
s2_b_1(Taxp,Household,Dependent,Taxy) :-
    death_(Spouse_dies),person(Spouse),date(Death_time),
    date(Last_day_year),marriage_(Marriage),date(Start_marriage),
    not individual_married(Marriage,Taxp,Spouse,Start_marriage,Taxy,Spouse_dies,Death_time,Last_day_year),
    not s2_a(Taxp,_,Taxy),
    s2_b_1_A_or_s2_b_1_B(Taxp,Household,Dependent,Taxy).

not_start_taxp_residence(Taxpayer_residence,Start_taxpayer_residence,First_day_year):-
    date(First_day_year),date(Start_taxpayer_residence),
    residence_(Taxpayer_residence),not start_(Taxpayer_residence,_).
not_start_taxp_residence(Taxpayer_residence,Start_taxpayer_residence,First_day_year):-
    start_(Taxpayer_residence,Start_taxpayer_residence),
    is_before(Start_taxpayer_residence,First_day_year).

not_end_taxp_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year):-
    date(Last_day_year),date(End_taxpayer_residence),
    residence_(Taxpayer_residence),not end_(Taxpayer_residence,End_taxpayer_residence).
not_end_taxp_residence(Taxpayer_residence,End_taxpayer_residence,Last_day_year):-
    end_(Taxpayer_residence,End_taxpayer_residence),
    is_before(Last_day_year,End_taxpayer_residence).

start_individual_residence(Individual_residence,Start_individual_residence,First_day_year):-
    date(First_day_year),residence_(Individual_residence),
    date(Start_individual_residence),not start_(Individual_residence,_),
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
    not s2_b_1_A_i_I_and_II(Dependent,Taxp,Taxy).

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
    residence_(Parent_residence),not end_(Parent_residence,_).
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
    not Taxp = Spouse,
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
    not start_(Spouse_is_nra,_).
start_spouse_is_nra(Spouse_is_nra,Start_nra,Last_day_year):-
    start_(Spouse_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year).

end_spouse_is_nra(Spouse_is_nra,Stop_nra,First_day_year):-
    date(First_day_year),nonresident_alien_(Spouse_is_nra),date(Stop_nra),
    not end_(Spouse_is_nra,_).
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
    not s2_b_2_B(Taxp,Spouse,Taxy),
    death_(Spouse_dies),
    agent_(Spouse_dies,Spouse),
    start_(Spouse_dies,Time_death),
    died_and_married(Marriage,Time_death,End_marriage),  
    is_before(First_day_year,Time_death),
    is_before(Time_death,Last_day_year).

died_and_married(Marriage,Time_death,End_marriage):-
    marriage_(Marriage),date(Time_death),date(End_marriage),
    not end_(Marriage,_).
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
    not start_(Taxpayer_is_nra,_),
    S119=First_day_year.
start_taxp_is_nra(Taxpayer_is_nra,Start_nra,Last_day_year):-
    start_(Taxpayer_is_nra,Start_nra),
    is_before(Start_nra,Last_day_year),
    S119=Last_day_year.

end_taxp_is_nra(Taxpayer_is_nra,Stop_nra,Last_day_year):-
    date(Last_day_year),date(Stop_nra),nonresident_alien_(Taxpayer_is_nra),
    not end_(Taxpayer_is_nra,_).
end_taxp_is_nra(Taxpayer_is_nra,Stop_nra,Last_day_year):-
    date(Last_day_year),
    end_(Taxpayer_is_nra,Stop_nra),
    is_before(First_day_year,Stop_nra),
    is_before(S119,Stop_nra).

%(B) by reason of an individual who would not be a dependent for the taxable year but for subparagraph (H) of section 152(d)(2).
s2_b_3_B(Taxp,Dependent,Taxy) :-
    first_day_year(Taxy,First_day),
    last_day_year(Taxy,Last_day),
    not s152_b(Dependent,Taxp,Taxy),
    not s152_a_1(Dependent,Taxp,Taxy),
    s152_d_1_B(Dependent,Taxy),
    s152_d_1_D(Dependent,Taxy),
    not valid_relationship_s152_d_2(Dependent,Taxp),
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

% not_s2_a_2(Taxp,Spouse,Previous_marriage,Taxy) :- 
%     person(Taxp),
%     person(Spouse),
%     marriage_(Previous_marriage),
%     year(Taxy),
%     not s2_a_2(Taxp,Spouse,Previous_marriage,Taxy).
