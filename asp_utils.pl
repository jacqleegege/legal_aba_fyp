:- module(asp_utils,
    [  is_contrary/2
    ,  asp/2
    ,  asp/4
    ,  asp_star/4
    ,  asp_plus/5
    ,  domain_preds/2
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
  ( member(rule(_,domain(_),_),Rules) -> 
    true 
  ;
    ( nl, write('domain/1 is undefined!'), halt )
  ).

% SEMANTICS: writes all rules to file
dump_rules(Rs) :-
  dump_rules(Rs,'asp.clingo') .
dump_rules(Rs,File) :-
  tell(File),
  aba_rules(Rs,A), utl_rules(Rs,U),
  %preds_in_rules(A,[],Preds1),
  %preds_in_rules(U,Preds1,Preds),
  %write_show(Preds),
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

% check if C is a contrary of an assumption
is_contrary(C,R) :-
  ground(C),
  functor(C,F,N), % C is a ground term whose functor is F/N
  functor(T,F,N), % T is a nonground term whose functor is F/N
  utl_rules(R,A),
  member(rule(_,contrary(_,T),_),A).

% asp: ASP encoding of Ri
asp(Ri, Ro) :-
  utl_rules(Ri,Us),
  % add asp rules enconding attacks to assumptions: alpha :- not c_alpha
  attacks(Us, As),           % (b.1)
  utl_rules_append(Ri,As,Ro).
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
  findall(F1/N1, ( member(rule(_,contrary(_,C),_),U), functor(C,F1,N1) ), Cs),
  append(Ep,En,E), % E is the list of positive and negative examples
  % Ps: set of predicates in Ep and En (different from contraries)
  setof(F2/N2,[P]^( member(P,E), functor(P,F2,N2), \+ member(F2,Cs) ), Ps),
  append(Ps,Cs,Ts),
  generators_pp(Ts, Gs),     % (e)
  utl_rules_append(Ri,Gs, Ri1),
  asp(Ri1,Ep,En, Ro).

%
generators([], []).
generators([F/N|Fs], [G,O|Gs]) :-
  functor(P,F,N),
  generator(P, G),
  O=directive(minimize,{1,P:P}),
  generators(Fs, Gs).

%
generators_pp([], []).
generators_pp([F/N|Fs], [R,G,O|Gs]) :-
  atom_concat(F,'_P',FP), 
  length(A,N),
  PP =.. [FP|A],
  generator(PP, G),
  P =.. [F|A],
  new_rule(P,[PP],R),   % p :- p_P
  O=directive(minimize,{1,PP:PP}),
  generators_pp(Fs, Gs).

%
generator(P, G) :-
  term_variables(P,V),
  domain_preds(V, D),
  new_rule({P},D, G).

% 
domain_preds([], []).
domain_preds([V|Vs], [domain(V)|Ds]) :-
  domain_preds(Vs, Ds).

%
attacks([], []).
attacks([U|Us], [R|Rs]) :-
  U = rule(_,contrary(A,C),_),
  !,
  copy_term((A,C),(CpyA,CpyC)),
  new_rule(CpyA,[not CpyC, assumption(CpyA)], R),
  attacks(Us, Rs).
attacks([_|Us], As) :-
  attacks(Us, As).

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

% MODE: preds_in_rules(+Rs,+InPreds, -OutPreds)
% SEMANTICS: OutPreds is the list of predicates occurring in Rs and in InPreds
preds_in_rules([],Preds,Preds).
preds_in_rules([rule(_,contrary(A,C),_)|Rs],InPreds,OutPreds) :-
  !,
  add_pred(A,InPreds,InPreds1),
  add_pred(C,InPreds1,InPreds2),  
  preds_in_rules(Rs,InPreds2,OutPreds).
preds_in_rules([rule(_,{H},_)|Rs],InPreds,OutPreds) :-
  !,
  add_pred(H,InPreds,InPreds1),
  preds_in_rules(Rs,InPreds1,OutPreds).
preds_in_rules([rule(_,H,_)|Rs],InPreds,OutPreds) :-
  functor(H,P,N), 
  memberchk(P/N,[false/0,assumption/1,domain/1]),
  !,
  preds_in_rules(Rs,InPreds,OutPreds).
preds_in_rules([rule(_,H,_)|Rs],InPreds,OutPreds) :-
  !,
  add_pred(H,InPreds,InPreds1),
  preds_in_rules(Rs,InPreds1,OutPreds).
preds_in_rules([directive(_,_)|Rs],InPreds,OutPreds) :-
  preds_in_rules(Rs,InPreds,OutPreds).
%
add_pred(A,InPreds,OutPreds) :-
	functor(A,P,N),
	( memberchk(P/N,InPreds)  ->
		OutPreds = InPreds
  ;
		OutPreds = [P/N|InPreds]
  ).