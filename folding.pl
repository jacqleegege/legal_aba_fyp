:- use_module(library(dialect/hprolog),[ memberchk_eq/2 ]).
:- use_module('asp_utils').

:- dynamic tokens/1.
tokens(1).

% folding(+Rs,+R, -F)
% Rs: rules for folding, and
% F is the result of applying folding to R
folding(Rs,R, F) :-
  copy_term(R,rule(_,H,Ts)),
  folding(Rs,H,Ts, Fs),
  new_rule(H,Fs,F).

% folding(+Rs,+H,+Ts, -Fs)
% Rs: rules for folding
% H: head of the clause to be folded
% Ts: To be folded
% Fs: result
% non-deterministic
:- discontiguous folding/4.
folding(Rs,H,Ts, Fs) :-
  lopt(folding_mode(nd)),
  tokens(T),
  fold_all(T,Rs,H,[],Ts, Zs),
  folding_aux(Rs,H,Zs, Fs).
% fold_all auxiliary predicate
folding_aux(_,_,Fs, Fs).
folding_aux(Rs,H,[T|Ts], Fs) :-
  folding(Rs,H,[T|Ts], Fs).
folding_aux(Rs,H,Ts, Fs1) :-
  nselect(P,Ts, E,R),
  folding(Rs,H,R, Fs),
  combine(P,E,Fs, Fs1). 
% greedy
folding(Rs,H,Ts, Zs) :-
  lopt(folding_mode(greedy)),
  fold_greedy(Rs,H,[],Ts, Zs),
  !.   

% nselect(+P,+Ts, -E,-R)
% Ts is a list consisting of at least two elements,
% E is the element of Ts at position P, and
% R is Ts without E 
nselect(I,[H1,H2|T], E,R) :-
  nth1(I,[H1,H2|T], E,R).

% combine(+P,+E,+Fs, -Fs1)
% Fs1 is the result of adding E into Fs at position P
combine(P,E,F,C) :-
  combine_aux(1,P,E,F,[], C).
% combine auxiliary predicate
combine_aux(I,P,E,F,CI, CO) :-
  I==P,
  !,
  append(CI,[E|F],CO).
combine_aux(I,P,E,[H|T],CI, CO) :-
  I < P,
  J is I+1,
  append(CI,[H],CI1),
  combine_aux(J,P,E,T,CI1, CO).

% fold_all(+C,+Rs,+H,+Fs,+Ts, -Zs)
% C: tokens left for folding
% Rs: rules for folding
% H: head of the clause to be folded
% Fs: already Folded
% Ts: To be folded
% Zs: result
fold_all(C,_,_,Fs,[], Fs) :-
  C>=0,
  write(' '), write(C), write(': DONE'), nl.
fold_all(C,Rs,H,FsI,[T|Ts], FsO) :-
  C>=1,
  member(R,Rs), copy_term(R,R1), R1 = rule(I,F,As), memberchk(T,As),
  write(' '), write(C), write(': folding '), show_term([T|Ts]), write(' with '), write(I), write(': '), show_rule(R1), nl,
  apply_folding(As,[T|Ts], ResTs,NewTs),
  % check if new elements to be folded bind variables occurring elsewhere
  term_variables((H,FsI,ResTs),V1),
  term_variables(NewTs,V2),
  intersection_empty(V1,V2),
  append(ResTs,NewTs, Ts1),
  C1 is C-1,
  fold_all(C1,Rs,H,[F|FsI],Ts1, FsO).
fold_all(C,_,_,_,[T|Ts], _) :-
  C==0,
  write(' '), write(C), write(': FAIL - No more folding tokens left for '), show_term([T|Ts]), nl, fail.

% fold_greedy(+Rs,+H,+Fs,+Ts, -Zs)
% Rs: rules for folding
% H: head of the clause to be folded
% Fs: already Folded
% Ts: To be folded
% Zs: result
fold_greedy(Rs,H,FsI,Tbf, FsO) :-
  member(T,Tbf),
  member(R,Rs), 
  copy_term(R,R1), R1 = rule(I,H1,As), 
  memberchk(T,As),    % I can be used for folding an element in Tbf
  % get elements that cannot be folded using R1 (ResTbf) and
  % those elements occurring in R1 and not occurring in Tbf (NewTbf)
  apply_folding(As,Tbf, ResTbf,NewTbf),
  % 
  \+ memberchk_eq(H1,FsI),
  % check if new elements to be folded bind variables occurring elsewhere
  term_variables((H,FsI,ResTbf),V1),
  term_variables(NewTbf,V2),
  intersection_empty(V1,V2),
  write(' folding '), show_term(Tbf), write(' with '), write(I), write(': '), show_rule(R1), nl,
  % add new equalities to Tbf
  append(Tbf,[H1|NewTbf],Tbf1),
  fold_greedy(Rs,H,[H1|FsI],Tbf1, FsO).
fold_greedy(_,_,Fs,_, Fs) :-
  Fs = [_|_], % something has been folded
  write(' '), write('DONE'), nl.

% apply_folding(+Ls,+Ts, -ResTs,-NewTs)
% Ls: elements for folding
% Ts: elements to be folded
% ResTs consists of the elements in Ts not folded by R, and
% NewTs are newly introduced equalities (equalities in Ls)  
apply_folding([],Ts, Ts,[]).
apply_folding([E|B],TsI, TsO,NewTs) :-
  selectchk(E,TsI,TsI1),
  !,
  apply_folding(B,TsI1, TsO,NewTs).
apply_folding([E|B],TsI, TsO,[E|NewTs]) :-
  eq(E),
  apply_folding(B,TsI, TsO,NewTs).

% TODO: code for replacing the first member in fold_greedy
% % tbf(+T,+Ts)
% % T is an element of Ts to be folded
% tbf(T,[V1=V2|Ts]) :-
%   var(V1),
%   var(V2),
%   !,
%   tbf(T,Ts).
% tbf(T,[T|_]).
% tbf(T,[_|Ts]) :-
%   tbf(T,Ts).

% eq(E) holds iff E is a term of the form  V=C,
% where V is a variable and C is a ground term
eq(V=C) :-
  var(V), ground(C).

% intersection_empty(L1,L2) holds iff
% the intersection of L1 and L2 is empty
intersection_empty(L1,L2) :- 
  intersection(L1,L2,L3),
  L3==[].

% intersection(L1,L2,I)
% I is the intersection of L1 and L2
intersection([],_,[]).
intersection([E|L],L2,[E|L3]) :-
  memberchk_eq(E,L2),
  !,
  intersection(L,L2,L3).
intersection([_|L],L2,L3) :-
  intersection(L,L2,L3).

% append_difflist
append_difflist(L1-T1, T1-T2, L1-T2).