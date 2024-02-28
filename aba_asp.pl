
:- consult('rote_learning.pl'),
   consult('gen.pl').

:- initialization(set_lopt(folding_mode(nd))).
:- initialization(set_lopt(folding_steps(10))).
:- initialization(set_lopt(folding_selection(any))).
:- initialization(set_lopt(asm_intro(relto))).
:- initialization(set_lopt(learning_mode(cautious))).

:- initialization(listing(lopt/1)).

% aba_asp(+BK,+Ep,+En)
% BK: file including the background knowledge
% Ep: positive examples
% En: negative examples
aba_asp(BK,Ep,En) :-
  aba_asp(BK,Ep,En, _Ro).

% aba_asp(+BK,+Ep,+En, -Ro)
% BK: file including the background knowledge
% Ep: positive examples
% En: negative examples
% Ro: learnt ABA framework
aba_asp(BK,Ep,En, Ro) :-
  % initialize rule identifier
  retractall(rid(_)),
  assert(rid(1)),
  % initialize solution counter
  retractall(sol_counter(_)),
  assert(sol_counter(0)),
  % initialize tokens (for folding)
  retractall(tokens(_)),
  assert(tokens(1)),
  %%%
  nl, write('Current learning options:'), nl,
  listing(lopt/1),
  %
  read_bk(BK, Rs),    % encode the background theory as terms of the form rule(ID,Head,Body)
  check_aba(Rs,Ep,En),
  rules_aba_utl(Rs, R1), % partition the list of rules Rs into two sublists ABA and UTL
                         % ABA = rules of the ABA framework
                         % UTL = utility rules (e.g., assumption, contrary)
  aba_asp_proc(BK,R1,Ep,En, Ro).
%
aba_asp_proc(BK,R1,Ep,En, Ro) :-
  statistics(runtime,[T1,_]), % start time
  roLe(R1,Ep,En, R2),    % RoLe
  ( lopt(folding_selection(mgr)) -> init_mgr(R2,R3) ; R2=R3 ),
  genT(R3,Ep,En, Ro),    % GEN
  nl,
  write('Positive examples: '), length(Ep,EpN), write(EpN), nl,
  write('Negative examples: '), length(En,EnN), write(EnN), nl,
  statistics(runtime,[T2,_]), % end time
  T is T2-T1,
  nl, write('Learning CPU time (ms): '), write(T), nl,
  atom_concat(BK,'.sol.aba',Out),
  retract(sol_counter(N)), M is N+1, assert(sol_counter(M)),
  nl, write('Writing solution no. '), write(M), write(' to '), write(Out), nl, nl,
  write_sol(Ro,Out),
  asp(Ro,RoASP),
  atom_concat(BK,'.sol.asp',OutASP),
  dump_rules(RoASP,OutASP).
aba_asp_proc(_,_,_,_, _) :-
  sol_counter(N),
  nl, 
  ( N == 0 ->
    write('* There is no solution! ')
  ; 
    write('* There are no more solutions! ')
  ). 

%
:- dynamic lopt/1.
set_lopt(folding_mode(X)) :-
  member(X,[nd,greedy,all]),
  !,
  retractall(lopt(folding_mode(_))),
  assert(lopt(folding_mode(X))).
set_lopt(folding_steps(X)) :-
  !,
  retractall(lopt(folding_steps(_))),
  assert(lopt(folding_steps(X))).
set_lopt(asm_intro(X)) :-
  member(X,[sechk,relto]),
  !,
  retractall(lopt(asm_intro(_))),
  assert(lopt(asm_intro(X))).
set_lopt(learning_mode(X)) :-
  member(X,[brave,cautious]),
  !,
  retractall(lopt(learning_mode(_))),
  assert(lopt(learning_mode(X))).
set_lopt(folding_selection(X)) :-
  member(X,[any,mgr]),
  !,
  retractall(lopt(folding_selection(_))),
  assert(lopt(folding_selection(X))).    
set_lopt(X) :-
  throw(wrong_lopt(X)).  

write_sol(Rs,File) :-
  tell(File),
  aba_rules(Rs,A),
  write_rules(A),
  nl,
  write_ac(A),
  told.

% write rule
write_rules([]). 
write_rules([R|Rs]) :-
  R = rule(_,_,_),
  !,
  copy_term(R,CpyR),
  numbervars(CpyR,0,_),  
  CpyR = rule(_,H,B),
  write(H), write(' :- '), write_conj(B),
  write_rules(Rs).
write_rules([_|Rs]) :-
  write_rules(Rs). 

%
write_conj([]) :-
  write('.'), nl.
write_conj([H]) :-
  !,
  write(H), write('.'), nl.
write_conj([H|T]) :-
  write(H), write(', '),
  write_conj(T).

%
write_ac([]).
write_ac([R|Rs]) :-
  R = assumption(_),
  !,
  copy_term(R,CpyR),
  numbervars(CpyR,0,_),    
  write(CpyR), write('.'), nl,
  write_ac(Rs). 
write_ac([R|Rs]) :-
  R = contrary(_,_),
  !,
  copy_term(R,CpyR),
  numbervars(CpyR,0,_),
  CpyR = contrary(A,_),
  write(CpyR), write(' :- '), write(assumption(A)),  write('.'), nl,
  write_ac(Rs).
write_ac([_|Rs]) :-
  write_ac(Rs). 

%
check_aba(Rules,Ep,En) :-
  collect_consts(Rules,[], Cs),
  append(Ep,En,E),
  check_ep_consts(E,Cs),
  check_to_be_learnt(Rules,Ep).

%
collect_consts([],Ci, Co) :-
  sort(Ci,Co).
collect_consts([R|Rs],Ci, Co) :-
  R = rule(_,_,B),
  !,  
  collect_consts_aux(B, Cs),
  append(Ci,Cs, Ci1),
  collect_consts(Rs,Ci1, Co).
collect_consts([_|Rs],Ci, Co) :-
  collect_consts(Rs,Ci, Co).  
% assumption: rules are normalized
% (i.e., constants occur in the body 
% of rules as equalities of the form 
% Var=constant)
collect_consts_aux([], []).
collect_consts_aux([X=C|Bs], [C|Cs]) :-
  var(X),
  ground(C),
  !,
  collect_consts_aux(Bs, Cs).
collect_consts_aux([_|Bs], Cs) :-
  collect_consts_aux(Bs, Cs).

%
check_ep_consts([],_).
check_ep_consts([E|Es],Ci) :-
  E =.. [_|Args],
  check_ep_consts_aux(Args,Ci),
  check_ep_consts(Es,Ci).

%
check_ep_consts_aux([],_).
check_ep_consts_aux([Arg|Args],Ci) :-
  nonvar(Arg),
  !,
  ( member(Arg,Ci) ->
    check_ep_consts_aux(Args,Ci)
  ;
    ( write('ERROR: unknown constant: '), write(Arg), nl, nl, halt )
  ).
check_ep_consts_aux([Arg|Args],Ci) :-
  var(Arg),
  check_ep_consts_aux(Args,Ci).

%
:- dynamic tbl_occurs_in_BK/0.
check_to_be_learnt(Rules,Ep) :-
  member(E,Ep), 
  functor(E,F,N),
  member(rule(_,H,_),Rules),
  functor(H,F,N),
  !,
  assert(tbl_occurs_in_BK).
check_to_be_learnt(_,_).   