
:- consult('rote_learning.pl'),
   consult('gen.pl').

:- initialization(set_lopt(folding_mode(nd))).
:- initialization(set_lopt(folding_steps(10))).
:- initialization(set_lopt(asm_intro(relto))).
:- initialization(set_lopt(learning_mode(cautious))).

:- initialization(listing(lopt/1)).

% aba_asp(+BK,+Ep,+En, -Ro)
% BK: file including the background knowledge
% Ep: positive examples
% En: negative examples
% Ro: learnt ABA framework
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
  rules_aba_utl(Rs, R1), % partition the list of rules Rs into two sublists ABA and UTL
                         % ABA = rules of the ABA framework
                         % UTL = utility rules (e.g., domain, assumption, contrary)
  aba_asp_proc(BK,R1,Ep,En, Ro).
%
aba_asp_proc(BK,R1,Ep,En, Ro) :-
  roLe(R1,Ep,En, R2),    % RoLe 
  genT(R2,Ep,En, Ro),    % GEN
  atom_concat(BK,'.sol',Out),
  retract(sol_counter(N)), M is N+1, assert(sol_counter(M)),
  nl, write('Writing solution no. '), write(M), write(' to '), write(Out), nl, nl, trace,
  dump_rules(Ro,Out),
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
  member(X,[nd,greedy]),
  !,
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
set_lopt(X) :-
  throw(wrong_lopt(X)).  