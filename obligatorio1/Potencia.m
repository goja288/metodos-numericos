function [autoVector,autoValor]=Potencia(A,v) 
% param A matriz
% param v vector

	maxIteraciones = 100; % Maxima cantidad de iteraciones
	iter = 0; % Numero de iteracion	
	tolerancia = 10^-5; % Tolerancia
 
	autoValor = 0;
	autoValorAnterior = -1;

	x = v(:); % Paso el vector x0 como columna
	y = x / norm(x); % Normalizo

	% Si la cantidad de iteraciones no supero el maximo y la diferencia
	% de dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && abs(autoValor-autoValorAnterior) > tolerancia) 
		
		autoValorAnterior = autoValor; % lo guardo para la proxima iteracion
		
		x = A*y; % x^(k) = Ax^(k-1)
		y = x / norm(x);
		
		autoValor = x.'*y; % Calculo el autovector - con .' traspongo

		iter++; 
	
	end

	autoVector = y; % Normalizado

end





