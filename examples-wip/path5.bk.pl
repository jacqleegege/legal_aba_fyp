% Reachability, bigger graph

% BK

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
arc(6,9).

node(1).
node(2).
node(3).
node(4).
node(5).
node(6).
node(7).
node(8).
node(9).

domain(X) :- node(X).


% E+ = {path(1,2),path(2,2),path(1,3),path(1,4),path(3,7),path(1,7),path(6,9)}
% E- = {path(1,6),path(2,5),path(4,5),path(5,6),path(1,8),path(8,7),path(5,9),path(4,6),path(4,9),path(3,6),path(3,9)}

% aba_asp('./examples/path5.bk.pl',[path(1,2),path(2,2),path(1,3),path(1,4),path(3,7),path(1,7),path(6,9)],[path(1,6),path(2,5),path(4,5),path(5,6),path(1,8),path(8,7),path(5,9),path(4,6),path(4,9),path(3,6),path(3,9)]).
