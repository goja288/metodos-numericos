%-----------------------------
% Metodo Euler Hacia Adelante 
%-----------------------------

% gamma -> tasa de recuperacion
% beta -> tasa de contagio
% S -> poblacion inicial de susceptibles
% I -> poblacion inicial de infectados
% R -> poblacion inicial de removidos
% h -> paso 
function [res, errorGlobal] = SIREuler(gamma,beta,S,I,R,h)

	N = S + I + R;

	cantIteraciones = 400;

	iter = 0;
	
	s(1) = .99;
	i(1) = .01
	r(1) = 0;


	for iter=2:cantIteraciones
		
		s(iter) = s(iter-1) + (-1 * beta * s(iter-1) * i(iter-1)) * h;

		i(iter) = i(iter-1) + (beta * s(iter-1) * i(iter-1) - gamma * i(iter-1)) * h;

		r(iter) = r(iter-1) + (gamma * i(iter-1)) * h;


	end


	pcol1 = [255,0,0]/255; % red
	pcol2 = [0,255,0]/255; % red
	pcol3 = [0,0,255]/255; % red


	%plot3(s,i,r,'Color',pcol)

	
	plot(s/N,'Color',pcol1); hold on;
	plot(i/N,'Color',pcol2); hold on;
	plot(r/N,'Color',pcol3); 

	res = 20;
	errorGlobal = 21;

endfunction
