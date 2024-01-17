%from Proietti-Toni ILP-22
% variant of the paper version

% Background
step(1,2).
step(1,3).
step(2,4).
step(2,5).
step(3,2).    % added a loop in the graph
step(4,6).
step(5,2).

busy(3).
busy(6).

node(1).
node(2).
node(3).
node(4).
node(5).
node(6).

domain(X) :- node(X).

% aba_asp('../examples/free2.bk.pl',[free(1),free(2),free(5)],[free(3),free(4),free(6)]).

% E+: {free(1),free(2),free(5)}
% E-: {free(3),free(4),free(6)}

% lopt(folding_mode(nd)).
% lopt(folding_steps(10)).
% lopt(asm_intro(relto)).
% lopt(learning_mode(cautious)).

/*
free(A) :- node(B), step(A,B), alpha_2(A,B).
c_alpha_2(A,B) :- step(C,B), step(C,A).
c_alpha_2(A,B) :- busy(B), node(A).

---

free(A) :- node(B), step(A,B), alpha_15(A,B).
c_alpha_15(A,B) :- node(B), busy(A).
c_alpha_15(A,B) :- busy(B), node(A).

---

free(A) :- node(B), step(A,B), alpha_15(A,B).
c_alpha_15(A,B) :- node(B), busy(A).
c_alpha_15(A,B) :- c_alpha_15(B,A).

*/

% set_lopt(folding_mode(greedy)).
% set_lopt(learning_mode(brave)).
% ?- aba_asp('../examples/free2.bk.pl',[free(1),free(2),free(5)],[free(3),free(4),free(6)]).
% LOOPS
