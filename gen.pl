:- dynamic current_new_pred/1.
current_new_pred(0).

:- consult(folding).

% Gen procedure
genT(R2,Ep,En, Ro) :-
  gen(R2,Ep,En, Ro).
genT(R2,Ep,En, Ro) :-
  lopt(folding_mode(nd)),
  retract(tokens(T)), % max number of folding
  T1 is T+1,
  lopt(folding_steps(M)),
  ( T1 > M -> fail ; true ),
  nl, write('* Increasing folding tokens to: '), write(T1), nl, 
  assert(tokens(T1)),
  genT(R2,Ep,En, Ro).

% gen
gen(Ri,Ep,En, Rf) :-
  select_nonintensional(Ri, S,Ri1), % Ri1 = Ri\S
  !,
  write('gen: non-intensional selection: '), show_rule(S), nl,
  % folding
  aba_rules(Ri1,AR), % AR = ABA Rules
  write(' begin folding'), nl, 
  folding(AR,S, F),  % F = fold-all(S)
  write(' folding result: '), show_rule(F), nl,
  gen2(Ri1,Ep,En,F, Rf).
gen(Ri,_Ep,_En, Ri) :-
  asp(Ri,ASP),
  dump_rules(ASP).
% gen2
gen2(Ri,Ep,En,F, Rf) :-
  aba_rules_append(Ri,[F], Ri1),
  entails(Ri1,Ep,En),
  write('gen2: extended ABA entails <E+,E-> - using folding'), nl,
  !,
  gen7(Ri1,Ep,En, Rf). % go to subsumption
% gen2 - RELTO assumption found
gen2(Ri,Ep,En,F, Rf) :-
  lopt(asm_intro(relto)),
  write('gen2: extended ABA does not entail <E+,E-> - looking for assumption relative to'), nl,
  exists_assumption_relto(Ri,F, APF/_),
  !,
  gen3(Ri,Ep,En,F,APF, Rf).
% gen2 - RELTO NEW assumption or SECHK assumption chk
gen2(Ri,Ep,En,F, Rf) :-
  new_assumption(Ri,Ep,En,F, Ra,Rg,A,FwAP),
  write('gen2: generating NEW assumption: '), show_term(A), nl,
  write(' assumption introduction result: '), show_rule(FwAP), nl,
  compute_conseq(Rg, Cs),
  member(RgAS, Cs),
  gen4(Ri,Ep,En,F,Ra,A,RgAS, Rf).
% gen3 - OLD assumption found
gen3(Ri,Ep,En,F,APF, Rf) :-
  F = rule(_,H,B),
  term_variables(B,V),
  AP =.. [APF|V],
  new_rule(H,[AP|B], FwAP),
  aba_rules_append(Ri,[FwAP], Ri1),
  write('gen3: found: '), show_term(AP), write(' ... '),
  entails(Ri1,Ep,En), % if Ri1 w/mg_alpha does not entails E+,E-,
  !,
  write('OK, assumption introduction result: '), show_rule(FwAP), nl,
  gen7(Ri1,Ep,En, Rf). % go to subsumption
gen3(_Ri,_Ep,_En,F,_APF, _Rf) :-
  F = rule(_,_,B),
  write('KO, cannot introduce an assumption for '), show_term(B), nl,
  fail.
% gen4 - RELTO NEW assumption
gen4(_Ri,Ep,En,_F,Ra,A,RgAS, Rf) :-
  lopt(asm_intro(relto)),
  !,
  write('gen4: relto using current consequences ...'), nl,
  % Ri is replaced by Ra (ABA rules with the new assumption)
  gen6(Ra,Ep,En,A,RgAS, Rf). % go to role
% gen4 - SECHK assumption chk
gen4(Ri,Ep,En,F,Ra,A,RgAS, Rf) :-
  lopt(asm_intro(sechk)),
  write('gen4: sechk using current consequences ...'), nl,
  gen5(Ri,Ep,En,F,Ra,A,RgAS, Rf).
% gen5 - SECHK assumption found 
gen5(Ri,Ep,En,F,_Ra,A,RgAS, Rf) :-
  write('gen5: extended ABA does not entail <E+,E-> - looking for assumption in the stable extension'), nl,
  functor(A,AF,N),
  exists_assumption_sechk(AF/N,Ri,RgAS, APF/N),
  !,
  gen3(Ri,Ep,En,F,APF, Rf).
% gen5 - SECHK NEW assumption
gen5(_Ri,Ep,En,_F,Ra,A,RgAS, Rf) :-
  % Ri is replaced by Ra (ABA rules with the new assumption)
  gen6(Ra,Ep,En,A,RgAS, Rf). % go to rote-learning
% gen6 - rote learning 
gen6(Ra,Ep,En,A,RgAS, Rf) :-
  write('gen6: rote learning of new contrary'), nl,
  functor(A,AF,N),
  atom_concat('c_',AF,C_A),
  % rote learning
  findall(R, ( functor(C,C_A,N),member(C,RgAS), e_rote_learn(C,R) ), Rs),
  aba_rules_append(Ra,Rs,Ra1),
  ( lopt(learning_mode(cautious)) -> entails(Ra1,Ep,En) ; true ),
  gen7(Ra1,Ep,En, Rf). % go to subsumption
% gen7 - subsumption
gen7(Ri,Ep,En, Rf) :-
  subsumption(Ri,Ep,En, Ri1),
  gen(Ri1,Ep,En, Rf). % back to gen


new_assumption(Ri,Ep,En,F, Ra,Rg,A,FwA) :-
  % assumption introduction
  F = rule(_,H,B),
  term_variables(B,V),
  % new assumption
  gen_new_name(ANewName),
  A =.. [ANewName|V],
  new_rule(H,[A|B], FwA),
  length(V,N),
  % create assumption/1 utility clause
  copy_term(A,A1),
  term_variables(A1,V1),
  domain_preds(V1, D1),
  new_rule(assumption(A1),D1,U1),
  % create contrary/2 utility clause
  copy_term(A1,A2),
  assumption_contrary(A2,C2),
  new_rule(contrary(A2,C2),[assumption(A2)],U2),
  % create Ra (Ri w/assumption)
  aba_rules_append(Ri,[FwA], Ri1),    
  utl_rules_append(Ri1,[U1,U2], Ra),
  % create Rg (Ra w/generator of c_alpha)
  functor(C2,CNewName,N),
  asp_plus(Ra,Ep,En,[CNewName/N], Rg).
%
assumption_contrary(Alpha,C_Alpha) :-
  nonvar(Alpha),
  !,
  Alpha =.. [AlphaF|Args],
  atom_concat('c_',AlphaF,C_AlphaF),
  C_Alpha =.. [C_AlphaF|Args].
assumption_contrary(Alpha,C_Alpha) :-
  nonvar(C_Alpha),
  !,
  C_Alpha =.. [C_AlphaF|Args],
  atom_concat('c_',AlphaF,C_AlphaF),
  Alpha =.. [AlphaF|Args].


%
c_alpha(CA,CNewName/N,CA1) :-
  findall(CC, ( member(CC,CA),          % C is a conseq. of R extended w/generators & ic
                functor(CC,CNewName,N)  % C is a contrary of an assumption
              ), CA1).

% gen_new_name(-NewName)
% NewName is a fresh new predicate name of the form alpha_N (N is an integer)
gen_new_name(NewName) :-
  retract(current_new_pred(N)),
  M is N + 1,
  assert(current_new_pred(M)),
  number_codes(M,C),
  atom_codes(A,C),
  atom_concat('alpha_',A,NewName).

% select_nonintensional(+R, -S,-R1)
% S is a non-intensional learnt rule in R and R1 is R\S
select_nonintensional(R, S,R1) :-
  aba_rules(R,A),
  select(S,A, A1),
  nonintensional(S),
  !,
  utl_rules(R,U),
  aba_rules(R1,A1),
  utl_rules(R1,U).
 
% subsumption(+Ri, -Ro)
% Ro is the result obained by removing all subsumed nonintensional rules from Ri
subsumption(Ri,Ep,En, Ro) :-
  write('checking subsumption'), nl,
  aba_rules(Ri,A),   utl_rules(Ri, U),
  % Ri1 has an empty set of rules
  aba_rules(Ri1,[]), utl_rules(Ri1,U),
  subsumption_aux(A,Ri1,Ep,En, Ro).
%
subsumption_aux([],R,_,_, R).
subsumption_aux([R|Rs],Ri,Ep,En, Ro) :-
  nonintensional(R),
  aba_rules_append(Ri,Rs,Ri1),
  subsumed(Ri1,Ep,En, R),
  !,
  write('sub: '), show_rule(R), nl, write(' deleted'), nl, 
  subsumption_aux(Rs,Ri,Ep,En, Ro).
subsumption_aux([R|Rs],Ri,Ep,En, Ro) :-
  aba_rules_append(Ri,[R],Ri1),
  subsumption_aux(Rs,Ri1,Ep,En, Ro).

% nonintensional(+R)
% R is nonintensional if in the body of R there is an equality of the form X=C, 
% where X is a variable and C is a constant.
nonintensional(R) :-
  R = rule(J,_,B),
  rlid(I),
  J>=I,
  member((V=C),B),
  var(V),
  ground(C).   

% looking for a more general alpha 
exists_assumption_sechk(AlphaF/N,R,A, AlphaPF/N) :-
  utl_rules(R,U),
  member(rule(_,assumption(AlphaP),_),U),
  functor(AlphaP,AlphaPF,N),
  AlphaPF \== AlphaF,
  mg_alpha(AlphaPF/N,AlphaF/N,A).
% exists_assumption_sechk utility predicate
mg_alpha(AlphaPF/N,AlphaF/N,A) :-
  functor(Alpha,AlphaF,N),
  select(Alpha,A,A1),
  !,
  Alpha =.. [_|Args], 
  AlphaP =.. [AlphaPF|Args],
  select(AlphaP,A1,A2),
  mg_alpha(AlphaPF/N,AlphaF/N,A2).
mg_alpha(_,_,_).

% looking for an existing alpha for F
exists_assumption_relto(R,F, Alpha/N) :-
  aba_rules(R, AR),
  utl_rules(R, UR),
  % rule to be folded
  F = rule(_,_,B1),
  % take any rule in AR and its assumption in UR
  member(rule(_,_,B2),AR),
  member(rule(_,assumption(A2),_),UR),
  copy_term(A2,A2Cpy),
  select(A2Cpy,B2,R2),
  % B1 and R2 (B2 w/o assumption) are variant
  permutation_variant(B1,R2),
  functor(A2Cpy,Alpha,N).


% MODE: permutation_functor(+T1,+T2, -T3)
% SEMANTICS: T3 is a permutation of T1 sorted by functors occurring in T2.
permutation_functor([],[],[]).
permutation_functor(As,[B|Bs], [A|P1]) :-
  functor(B,P,N), functor(A,P,N),
  select(A,As,As1),
  permutation_functor(As1,Bs, P1).


% MODE: permutation_variant(+L1,+L2, -L3)
% SEMANTICS: L3 is a permutation of L1 which is a variant of L2
% length 1
permutation_variant(L1,L2) :-
  L1 = [_], L2 = [_],
  !,
  L1 =@= L2.
% length 2
permutation_variant(L1,L2) :-
  L1 = [_,_],
  L2 = [_,_],
  L1 =@= L2.
permutation_variant(L1,L2) :-
  L1 = [X,Y],
  P1 = [Y,X],
  !,
  P1 =@= L2.
% length >= 3
permutation_variant(L1,L2) :-
  L1 = [_,_,_|T1],
  L2 = [_,_,_|T2],
  !,
  length(T1,N), length(T2,N),
  permutation_functor(L1,L2, P1), % P1 is a permutation of L1
  P1 =@= L2.                      % P1 is a variant of L2
