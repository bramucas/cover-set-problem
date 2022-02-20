% essentials.lp
% Identifies essential sets and the clauses D covered by them.

% D is covered by more than one S
multiply_covered(D) :- inc(S, D), inc(S2, D), S!=S2.
% S cover some D that is not covered by anyone else
% S is neccesary
essential(S) :- s(S), inc(S, D), not multiply_covered(D).
% D is covered by an essential S
essentially_covered(D) :- d(D), inc(S, D), essential(S).

#show essential/1.
%#show essentially_covered/1.
%#show multiply_covered/1.