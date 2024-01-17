% Reachability in a graph

%BK
arc(1,3).
arc(3,4).
arc(2,2).

node(1).
node(2).
node(3).
node(4).

domain(X) :- node(X).

% E+ = {path(2,2), path(1,3), path(3,4), path(1,4)}
% E- = {path(3,1), path(1,2), path(4,1)}

% lopt(folding_mode(nd)).
% lopt(folding_steps(10)).
% lopt(asm_intro(relto)).
% lopt(learning_mode(cautious)).

% aba_asp('../examples/free.bk.pl',[path(2,2), path(1,3), path(3,7), path(1,7)],[path(3,1), path(1,2), path(7,1)]).

% ERROR (Wrong query: path not defined, 7 is not in the domain)

% aba_asp('../examples/path1.bk.pl',[path(2,2), path(1,3), path(3,4), path(1,4)],[path(3,1), path(1,2), path(4,1)]).

/*
path(A,B) :- arc(A,B).
path(A,B) :- arc(C,B), arc(A,C).

---

path(A,B) :- arc(A,B).
path(A,B) :- path(A,C), path(C,B).

---

path(A,B) :- arc(A,B).
path(A,B) :- path(C,B), arc(A,C).

---

path(A,B) :- arc(A,B).
path(A,B) :- arc(C,B), path(A,C).

THEN LOOPS LOOKING FOR THE NEXT SOL. 

*/


% set_lopt(folding_mode(greedy)).
% LOOPS
