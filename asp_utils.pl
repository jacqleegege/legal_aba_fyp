:- module(asp_utils,
    [  asp/2
    ,  asp/4
    ,  asp_star/4
    ,  asp_plus/5
    ,  dump_rules/1
    ,  dump_rules/2
    ,  new_rule/3
    ,  normalize_args/3
    ,  normalize_eqs/3
    ,  read_rules/2
    ,  rules_aba_utl/2
    ,  utl_rules/2
    ,  utl_rules_append/3
    ,  aba_rules/2
    ,  aba_rules_append/3
    ,  show_rule/1
    ,  show_term/1
    ,  op(300,fy,not)
    ,  rlid/1
    ,  ic/2
    ]).

:- use_module(library(dialect/hprolog),
    [ memberchk_eq/2 ]).

:- dynamic rid/1.
rid(1).

:- dynamic rlid/1.

% rule_id(I): I is a fresh new rule identifier 
rule_id(I) :-
  retract(rid(I)),
  I1 is I+1,
  assert(rid(I1)).

% new_rule(H,B, R): R is the term representing
% a rule whose head is H and body is B
new_rule(H,B, R) :-
  ( is_list(B) -> true; throw(new_rule:not_a_list(B)) ),
  rule_id(I),
  normalize_head(H, H1,B1),
  append(B1,B,B3),
  %normalize_eqs(B3, [],B4),
  B3=B4,
  R = rule(I, H1,B4).
% new_rule/3 utility predicate
normalize_head(H, H1,B) :-
  H  =.. [P|A],
  normalize_args(A, N,B),
  H1 =.. [P|N].
% normalize_head/3 utility predicate
normalize_args([], [],[]).
normalize_args([C|As], [V|Vs],[V=C|Bs]) :-
  atomic(C),
  !,
  normalize_args(As, Vs,Bs).
normalize_args([A|As], [A|Vs],Bs) :-
  normalize_args(As, Vs,Bs).
% normalize_eqs/3
normalize_eqs([],N, N).
normalize_eqs([V=C|L],NI, [V1=V|NO]) :-
  var(V),
  ground(C),
  copy_term(V,V1),
  memberchk(V1=C,NI),
  !,
  normalize_eqs(L,NI, NO).
normalize_eqs([E|L],NI, NO) :-
  normalize_eqs(L,[E|NI], NO).

%
rules_aba_utl([], asp_enc([],[])).
rules_aba_utl([R|Rs], asp_enc(A,[R|U])) :-
  R = rule(_,H,_),
  functor(H,F,_),
  member(F,[assumption,contrary,domain]),
  !,
  rules_aba_utl(Rs, asp_enc(A,U)).
rules_aba_utl([R|Rs], asp_enc([R|A],U)) :-
  rules_aba_utl(Rs, asp_enc(A,U)).

% read_rules(+File, -Rules):
% read a read of rules of from File and
% generate a list of rule/3 terms representing them.
read_rules(File, Rules) :-
  catch( open(File, read, Stream, [alias(bk)]), Catcher,
         (write(open(File, read, Stream)), write(': '), write(Catcher), nl, fail)),
  retractall(rlid(_)),
  read_rules_aux(Stream,Rules),
  check_rules(Rules),
  rid(ID),
  assert(rlid(ID)), % ID of the first learnt rule
  close(Stream).
% read_rules/2 utility predicate: 
% read all terms from Stream and
% generate the corresponding rule/3 terms
read_rules_aux(Stream, [R|Rs]) :-
  read(Stream,Term),
  Term \== end_of_file,
  !,
  ( Term  = ( Head :- Body ) ->
    ( conj_to_list(Body,B), new_rule(Head,B, R) )
  ;
    new_rule(Term,[], R)
  ),
  read_rules_aux(Stream, Rs).
read_rules_aux(_, []).
% conj_to_list(C, L): 
% C is a conjunction of the form (A1,...,An);
% L is a list of the form [A1,...,An]
conj_to_list(X,[]) :-
  X==true,
  !.
conj_to_list(B,L) :-
  ( nonvar(B), functor(B,',',_) ->
    ( B = (B1,B2), L=[B1|H], conj_to_list(B2,H) )
  ;
    L=[B]
  ).
% perform checks on rules
check_rules(Rules) :-
  check_domain_existence(Rules).
% check existend of predicate 'domain/1' 
check_domain_existence(Rules) :-
 member(rule(_,assumption(A),_),Rules),
 copy_term(A,A1),
 \+ member(rule(_,domain(A),_),Rules),
 numbervars(A1,0,_),
 nl, write('domain/1 for '), write(A1), write(' undefined!'), nl, nl, halt.
check_domain_existence(_).
 
% SEMANTICS: writes all rules to file
dump_rules(Rs) :-
  dump_rules(Rs,'asp.clingo') .
dump_rules(Rs,File) :-
  tell(File),
  aba_rules(Rs,A), utl_rules(Rs,U),
  dump_rules_aux(A),
  nl, write('% utility rules'), nl,
  dump_rules_aux(U),
  told.  
% write rules
dump_rules_aux([]).
dump_rules_aux([R|Rs]) :-
  copy_term(R,CpyR),
  numbervars(CpyR,0,_),
  dump_rule(CpyR),
  dump_rules_aux(Rs).
% write rule
dump_rule(R) :-
  R = rule(_,H,B),
  !,
  ( H == false -> 
    true % integriry constraint
  ; 
    write(H)      % head of the rule
  ),
  ( B==[] ->
    ( write('.'), nl ) % fact or int. constr. 
  ;
    ( write(' :- '), write_bd(B) ) % rule w/nonempty body
  ).
dump_rule(R) :-
  R = directive(D,A),
  !,
  write('#'), write(D), write(' '), write(A), write('.'), nl.
% dump_rule/1 utility predicate
write_bd([H]) :-
  !,
  write(H), write('.'), nl.
write_bd([H|T]) :-
  write(H), write(', '),
  write_bd(T).

write_show([]).
write_show([P/N|Ps]) :-
   write('#show '), write(P/N), write('.'), nl,
  write_show(Ps).

% asp: ASP encoding of Ri
asp(Ri, Ro) :-
  aba_rules(Ri,Ai),
  utl_rules(Ri,Ui),
  asp_utl_rules(Ui, Uo),     % (b.1)
  aba_rules(Ro,Ai),
  utl_rules(Ro,Uo).
asp(Ri,Ep,En, Ro) :-
  ic(Ep,En, I),              % (c), (d)
  utl_rules_append(Ri,I,Ri1),
  asp(Ri1, Ro).
% asp_plus: ASP+
asp_plus(Ri,Ep,En,Ts, Ro) :-
  generators(Ts, G),         % (b.2) learnable predicates
  utl_rules_append(Ri,G,Ri1),
  asp(Ri1,Ep,En, Ro).
% asp_star: ASP* (w/primed predicates)
asp_star(Ri,Ep,En, Ro) :-
  % Cs: set of contrary predicates
  utl_rules(Ri, U),
  findall((A/N,C/N), ( member(rule(_,contrary(Alpha,C_Alpha),_),U), functor(Alpha,A,N), functor(C_Alpha,C,N) ), Cs),
  generators_pp(Cs, Gs),     % (e)
  utl_rules_append(Ri,Gs, Ri1),
  ep_generators_pp(Ep, Gs1), 
  utl_rules_append(Ri1,Gs1, Ri2),
  asp(Ri2,Ep,En, Ro).

%
generators([], []).
generators([(A/N,C/N)|Fs], [G,O|Gs]) :-
  length(V,N),
  AP =..[A|V],
  CP =..[C|V],
  new_rule({CP},[domain(AP)], G),
  O=directive(minimize,{1,CP:CP}),
  generators(Fs, Gs).

%
generators_pp([], []).
generators_pp([(A/N,C/N)|Fs], [G,R,O|Gs]) :-
  length(V,N),
  AP =..[A|V],
  CP =..[C|V],
  atom_concat(C,'_P',C_P),
  C_PP =.. [C_P|V],
  new_rule({C_PP},[domain(AP)], G),
  copy_term((CP,C_PP),(CP1,C_PP1)),
  new_rule(CP1,[C_PP1],R),          % p :- p_P
  O=directive(minimize,{1,C_PP:C_PP}),
  generators_pp(Fs, Gs).

%
ep_generators_pp(Ep, [G|Gs]) :-
  findall(E1, ( member(E,Ep), E =..[F|A], atom_concat(F,'_P',F_P), E1 =..[F_P|A]), EpP),
  ep_choice(EpP, EpG), 
  new_rule({EpG},[], G),
  setof((F/N,F_P/N), [E]^( member(E,Ep), functor(E,F,N), atom_concat(F,'_P',F_P) ), Fs), 
  ep_generators_pp_aux(Fs, Gs).

%
ep_choice([E],E).
ep_choice([E|Es],(E;Gs)) :-
  ep_choice(Es,Gs).

%
ep_generators_pp_aux([], []).
ep_generators_pp_aux([(F/N,F_P/N)|Ls], [R,directive(minimize,{1,F_PP:F_PP})|Gs]) :-
  length(V,N),
  FP =.. [F|V],
  F_PP =.. [F_P|V],
  new_rule(FP,[F_PP],R), 
  ep_generators_pp_aux(Ls, Gs).

%
asp_utl_rules([], []).
asp_utl_rules([U|UsI], [R|UsO]) :-
  % convert contrary/2 into ASP rules encoding attacks to assumptions
  % i.e., contrary(Alpha,C_Alpha) into Alpha :- not C_Alpha, domain(Alpha)
  U = rule(_,contrary(Alpha,C_Alpha),_),
  !,
  copy_term((Alpha,C_Alpha),(Alpha1,C_Alpha1)),
  new_rule(Alpha1,[not C_Alpha1, domain(Alpha1)], R),
  asp_utl_rules(UsI, UsO).
asp_utl_rules([U|UsI], UsO) :-
  % delete assumption/1
  U = rule(_,assumption(_),_),
  !,
  asp_utl_rules(UsI, UsO).
asp_utl_rules([U|UsI], [U|UsO]) :-
  % keep any other utility rule
  asp_utl_rules(UsI, UsO).

% ic(+Ep,+En, I), I is the list of integrity constratints
% generated from positive Ep and negative examples En
ic([],[], []).
ic([],[N|Ns], [R|Rs]) :-
  new_rule(false,[N], R),
  ic([],Ns, Rs).
ic([P|Ps],Ns, [R|Rs]) :-
  new_rule(false,[not P], R),
  ic(Ps,Ns, Rs).

%
ic(B, R) :-
  new_rule(false,B, R).

% aba_rules(+ABAF, A), A is the list of ABA rules in ABAF
aba_rules(asp_enc(A,_), A).
% aba_rules_append(+ABA_Fwk_encI,+R, -ABA_Fwk_encO)
% ABA_Fwk_encO is obtained from ABA_Fwk_encI by 
% appending R to the ABA rules in ABA_Fwk_encI
aba_rules_append(asp_enc(A1,U),A2, asp_enc(A3,U)) :-
  append(A1,A2,A3).

% utl_rules(+ABAF, U), U is the list of utility rules in ABAF
utl_rules(asp_enc(_,U), U).
% utl_rules_append(+ABA_Fwk_encI,+U, -ABA_Fwk_encO)
% ABA_Fwk_encO is obtained from ABA_Fwk_encI by 
% appending U to the utility rules in ABA_Fwk_encI
utl_rules_append(asp_enc(A,U1),U2, asp_enc(A,U3)) :-
  append(U1,U2,U3).

% pretty print a rule
show_rule(R) :-
  copy_term(R,CpyR),
  numbervars(CpyR,0,_),
  CpyR = rule(_,H,B),
  write(H), write(' <- '), write(B).

% pretty print a term
show_term(A) :-
  copy_term(A,CpyA),
  numbervars(CpyA,0,_),
  write(CpyA).