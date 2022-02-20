% coverage.lp
% Finds every set that covers every clause.

% domain
d(D) :- inc(S, D).
s(S) :- inc(S, D).

% Generates all combinations (we always take essentials)
{selected(S) : s(S), not essential(S)}.

% Both essential and selected are in the final (candidate) set
final(S) :- essential(S).
final(S) :- selected(S).

% Ensure selected cover every (not essential) D
covered(D) :- not essentially_covered(D), inc(S, D), selected(S).
:- d(D), not covered(D), not essentially_covered(D).

#show final/1.