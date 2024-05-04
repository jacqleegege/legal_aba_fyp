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
    not Dependent = Taxp,
	not s152_b_1(Taxp,_,Taxy), % check that the taxpayer is eligible to have depedents
    s152_a(Dependent,Taxp,Taxy,_,_),
	not s152_b_2(Dependent,_,_,Taxy). % check that the dependent is eligible

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
    person(Individual),date(Death_time),date(End_day),not individual_death(Individual,Death_time),End_time=End_day.

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
    not start_(Residence_individual,Start_individual),first_day_year(Taxy,Start_individual).

end_individual_residence(Residence_individual,Taxy,End_individual):-
    year(Taxy),end_(Residence_individual,End_individual).
end_individual_residence(Residence_individual,Taxy,End_individual):-
    residence_(Residence_individual),not end_(Residence_individual,End_individual),last_day_year(Taxy,End_individual).


%(C) who meets the age requirements of paragraph (3), and
s152_c_1_C(Dependent,Taxp,Taxy) :-
    s152_c_3(Dependent,Taxp,Taxy).

%(E) who has not filed a joint return (other than only for a claim of refund) with the individual's spouse for the taxable year beginning in the calendar year in which the taxable year of the taxpayer begins.
s152_c_1_E(Dependent,Spouse,Taxy) :-
    person(Dependent),person(Spouse),year(Taxy),not s152_c_1_E_joint_return(Dependent,Spouse,Taxy).

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
    not Dependent = Childc2a,
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
	Y >= 25.
s152_c_3(Dependent,Taxp,Taxy) :-
    not s152_c_3_dependent_born(Dependent),
    is_descendent_of(Dependent,Taxp,_,_),
    % is less than 25 years old at the end of the taxable year.
	s152_c_3_dependent(Individual_is_born),
	agent_(Individual_is_born,Dependent),
	start_(Individual_is_born,Individual_dob),
	last_day_year(Taxy,Last_day_year),
	duration(Individual_dob,Last_day_year,Y,M,D),
	Y >= 25.

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
    not s152_c(Dependent,_,Taxy).

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
    not Dependent = Child,
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
    not Dependent = Taxp,
    first_day_year(Taxy,First_day_year),
    last_day_year(Taxy,Last_day_year),
    not s152_d_2_H_end_marriage(Dependent,Taxp,Last_day_year,First_day_year),
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
    not end_(Marriage,_).

s152_d_2_H_end_residence(Individual_residence,End_individual_residence,Last_day_year):-
    end_(Individual_residence,End_individual_residence),is_before(Last_day_year,End_individual_residence).
s152_d_2_H_end_residence(Individual_residence,End_individual_residence,Last_day_year):-
    residence_(Individual_residence),date(End_individual_residence),date(Last_day_year),
    not end_(Individual_residence,_).