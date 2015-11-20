%-----------------------------
% Metodo Euler Hacia Adelante 
%-----------------------------
%
% Ejemplo de ejecucion: 
%	[resS,resI,resR] = SIREuler(4.3,8.0,.99,.01,0,0.01,400);
%
% resS -> vector resultado S
% resI -> vector resultado I
% resR -> vector resultado R

%
% gamma -> tasa de recuperacion
% beta -> tasa de contagio
% S -> poblacion inicial de susceptibles
% I -> poblacion inicial de infectados
% R -> poblacion inicial de removidos
% h -> paso
% cantIteraciones -> cantidad de iteraciones 
function [resS,resI,resR] = SIREuler(gamma,beta,S,I,R,h,cantIteraciones)

	N = S + I + R;

	s(1) = S;
	i(1) = I;
	r(1) = R;

	for iter=2:cantIteraciones
		
		s(iter) = s(iter-1) + (-1 * beta * s(iter-1) * i(iter-1)) * h;

		i(iter) = i(iter-1) + (beta * s(iter-1) * i(iter-1) - gamma * i(iter-1)) * h;

		r(iter) = r(iter-1) + (gamma * i(iter-1)) * h;

	end

	pcol1 = [255,0,0]/255; % red
	pcol2 = [0,255,0]/255; % green
	pcol3 = [0,0,255]/255; % blue
	
	figure
	title('Euler')
	plot(s,'Color',pcol1); hold on;
	plot(i,'Color',pcol2); hold on;
	plot(r,'Color',pcol3); 

	resS = s;
	resI = i;
	resR = r;

endfunction
