%-----------------------------
% Metodo Predictor Corrector (Heun)
%-----------------------------
%
% Ejemplo de ejecucion: 
%	[resS,resI,resR,errorGlobal] = SIRPC(4.3,8.0,.99,.01,0,0.01,400);
%
% resS -> vector resultado S
% resI -> vector resultado I
% resR -> vector resultado R
% errorGlobal -> vector de errores
%
% gamma -> tasa de recuperacion
% beta -> tasa de contagio
% S -> poblacion inicial de susceptibles
% I -> poblacion inicial de infectados
% R -> poblacion inicial de removidos
% h -> paso 
% cantIteraciones -> cantidad de iteraciones 
function [resS_1, resI_1, resR_1, errorGlobal] = SIRPC(gamma,beta,S,I,R,h,cantIteraciones)

	N = S + I + R;

	s(1) = S/N;
	i(1) = I/N;
	r(1) = R/N;

	for iter=2:cantIteraciones
		
		% Predictor
		sp = s(iter-1) + (-1 * beta * s(iter-1) * i(iter-1)) * h;
		ip = i(iter-1) + (beta * s(iter-1) * i(iter-1) - gamma * i(iter-1)) * h;
		rp = r(iter-1) + (gamma * i(iter-1)) * h;

		% Metodo del Trapecio
		s(iter) = s(iter-1) + (h/2) * ( (-1 * beta * s(iter-1) * i(iter-1)) + (-1 * beta * sp * ip) );
		i(iter) = i(iter-1) + (h/2) * ( (beta * s(iter-1) * i(iter-1) - gamma * i(iter-1)) + (beta * sp * ip - gamma * ip) );
		r(iter) = r(iter-1) + (h/2) * ( (gamma * i(iter-1)) + (gamma * ip) );

	end

	pcol1 = [255,0,0]/255; % red
	pcol2 = [0,255,0]/255; % red
	pcol3 = [0,0,255]/255; % red
	
	plot(s/N,'Color',pcol1); hold on;
	plot(i/N,'Color',pcol2); hold on;
	plot(r/N,'Color',pcol3); 

	resS_1 = s/N;
	resI_1 = i/N;
	resR_1 = r/N;

	errorGlobal = 0;

end