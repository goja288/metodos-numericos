%-----------------------------
% Metodo Predictor Corrector (Heun)
%-----------------------------
%
% Ejemplo de ejecucion:
%	[resS,resI,resR] = SIRPC(4.3,8.0,.99,.01,0,0.01,400);
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
function [resS_1, resI_1, resR_1] = SIRPC(gamma,beta,S,I,R,h,cantIteraciones)

	N = S + I + R;

	s(1) = S;
	i(1) = I;
	r(1) = R;

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
	
	resS_1 = s;
	resI_1 = i;
	resR_1 = r;

end
