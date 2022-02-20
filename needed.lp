% needed.lp
% Prunes the solutions which include not neccessary sets.

% A D is covered by multiple selected
mult(D) :- 
	inc(S, D), inc(S2, D), 
	multiply_covered(D),  % Sould it be any D?? And not only 
	selected(S), selected(S2), S!=S2.

% S is neccesary to cover Ds
needed(S) :- 
	inc(S, D),
	not mult(D),
	selected(S).

:- selected(S), not needed(S).

%#show mult/1.
%#show needed/1.
