
%BK
abnormal(2).
abnormal(4).
abnormal(8).
arc(1,2).
arc(1,3).
arc(1,8).
arc(3,7).
arc(3,4).
arc(2,2).
arc(2,5).
arc(5,6).
arc(4,5).
arc(8,7).

node(1).
node(2).
node(3).
node(4).
node(5).
node(6).
node(7).
node(8).

%domain(X) :- node(X).

%E+ = {normal_path(1,3),normal_path(3,7),normal_path(1,7)}

%E- = {normal_path(1,2),normal_path(2,2),normal_path(2,5),normal_path(1,5),normal_path(3,4),normal_path(4,3),
% normal_path(3,1),normal_path(5,7),normal_path(1,6)}

/* aba_asp('./examples-wip/normal_path1.bk.pl',
[normal_path(1,3),normal_path(3,7),normal_path(1,7)], 
[normal_path(1,2),normal_path(2,2),normal_path(2,5),normal_path(1,5),normal_path(3,4),normal_path(4,3),
normal_path(3,1),normal_path(5,7),normal_path(1,6)]).
*/


/*
lopt(folding_mode(nd)).
lopt(folding_steps(10)).
lopt(asm_intro(relto)).
lopt(learning_mode(cautious)).
*/

%LOOPS


