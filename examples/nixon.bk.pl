% BK
quaker(a).
quaker(b).

republican(a).
republican(b).

person(a).
person(b).

% definition of domain predicate
domain(X) :- person(X).

% aba_asp('./examples/nixon.bk.pl',[pacifist(a)],[pacifist(b)]).