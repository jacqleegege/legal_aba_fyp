:- module(asp_utils,
    [  asp/2
    ,  asp/4
    ,  asp_star/4
    ,  asp_plus/5
    ,  dump_rule/1
    ,  dump_rules/1
    ,  dump_rules/2
    ,  new_rule/3
    ,  normalize_args/3
    ,  normalize_eqs/3
    ,  read_bk/2
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

% new_asp_rule(H,B, R): R is the term representing
% an asp rule whose head is H and body is B
new_asp_rule(H,B, R) :-
  ( is_list(B) -> true; throw(new_rule:not_a_list(B)) ),
  R = asp_rule(H,B).

%
rules_aba_utl(Rs, asp_enc(Rs,Us)) :-
  findall(R, 
    ( member(contrary(Alpha,C_Alpha),Rs), 
      member(rule(_,_,BwA),Rs), 
      select(Alpha,BwA,B),
      copy_term((Alpha,C_Alpha,B),(Alpha1,C_Alpha1,B1)),
      new_rule(Alpha1,[not C_Alpha1|B1], R) 
    ), 
  Us).

% read_bk(+File, -Rules):
% read a read of rules of from File and
% generate a list of rule/3 terms representing them.
read_bk(FileName, Rules) :-
  atom_concat(FileName,'.aba',File),
  catch( open(File, read, Stream, [alias(bk)]), Catcher,
         (write(open(File, read, Stream)), write(': '), write(Catcher), nl, fail)),
  retractall(rlid(_)),
  read_bk_aux(Stream, Rules),
  rid(ID),
  assert(rlid(ID)), % ID of the first learnt rule
  close(Stream).
% read_bk/2 utility predicate: 
% read all terms from Stream and
% generate the corresponding rule/3 terms
read_bk_aux(Stream, [R|Rs]) :-
  read(Stream,Term),
  Term \== end_of_file,
  !,
  bk_term(Term,R),
  read_bk_aux(Stream, Rs).
read_bk_aux(_, []).
%
bk_term(Term, R) :-
  Term = ( Head :- Body ),
  !,
  conj_to_list(Body,B),
  ( functor(Head,contrary,2) ->
    R = Head
  ;
    new_rule(Head,B, R)
  ).
bk_term(Term, R) :-
  ( functor(Term,assumption,1) ->
    R = Term
  ;
    new_rule(Term,[], R)
  ).

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
 
% SEMANTICS: writes all rules to file
dump_rules(Rs) :-
  dump_rules(Rs,'asp.clingo') .
dump_rules(Rs,File) :-
  tell(File),
  aba_rules(Rs,A), utl_rules(Rs,U),
  dump_rules_aux(A),
  nl,
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
  write(H),      % head of the rule
  ( B==[] ->
    ( write('.'), nl ) % fact or int. constr. 
  ;
    ( write(' :- '), write_bd(B) ) % rule w/nonempty body
  ).
dump_rule(R) :-
  R = ic(B),
  !,
  ( write(' :- '), write_bd(B) ). 
dump_rule(R) :-
  R = directive(D,A),
  !,
  write('#'), write(D), write(' '), write(A), write('.'), nl.
dump_rule(R) :-
  % ignore assumption/1, contrary/2, gen/2
  functor(R,F,N),
  memberchk(F/N,[assumption/1,contrary/2,gen/2]),
  !.
dump_rule(R) :-
  told,
  write('ERROR: unrecognized rule: '), 
  copy_term(R,CpyR),
  numbervars(CpyR,0,_), 
  write(CpyR),
  nl,
  halt.

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
  % select only rule/1
  findall(rule(I,H,B),member(rule(I,H,B),Ai),Ao),     % (b.1)
  aba_rules(Ro,Ao),
  utl_rules(Ro,Ui).
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
  aba_rules(Ri, A),
  findall((Alpha,C_Alpha,B), 
    ( member(contrary(Alpha,C_Alpha),A), member(rule(_,_,BwA),A), select(Alpha,BwA,B) ), Cs),
  generators_pp(Cs, Gs),     % (e)
  utl_rules_append(Ri,Gs, Ri1),
  ep_generators_pp(Ep, Gs1), 
  utl_rules_append(Ri1,Gs1, Ri2),
  asp(Ri2,Ep,En, Ro).

%
generators([], []).
generators([(CP,B)|Fs], [G,O|Gs]) :-
  new_rule({CP},B, G),
  O=directive(minimize,{1,CP:CP}),
  generators(Fs, Gs).

%
generators_pp([], []).
generators_pp([(AP,CP,B)|Fs], [G,R,A,O|Gs]) :-
  CP =..[C|V],
  atom_concat(C,'_P',C_P),
  C_PP =.. [C_P|V],
  new_rule({C_PP},B, G),            % {p_P} :- B
  copy_term((CP,C_PP),(CP1,C_PP1)),
  new_rule(CP1,[C_PP1],R),          % p :- p_P
  copy_term((AP,CP,B),(AP2,CP2,B2)), 
  new_rule(AP2,[not CP2|B2], A),
  copy_term(C_PP,C_PP3),
  O=directive(minimize,{1,C_PP3:C_PP3}),
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

% ic(+Ep,+En, I), I is the list of integrity constratints
% generated from positive Ep and negative examples En
ic([],[], []).
ic([],[N|Ns], [ic([N])|Rs]) :-
  ic([],Ns, Rs).
ic([P|Ps],Ns, [ic([not P])|Rs]) :-
  ic(Ps,Ns, Rs).

%
ic(B, ic(B)).

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