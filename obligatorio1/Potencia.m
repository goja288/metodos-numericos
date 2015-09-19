function [autoVector,autoValor]=Potencia(A,v) 
% param A matriz
% param v vector

	maxIteraciones = 100; % Maxima cantidad de iteraciones
	iter = 0; % Numero de iteracion	
	tolerancia = 10^-5; % Tolerancia
 
	diferencia = 1; % Variable auxiliar para comprar con la tolerancia

	autoValor = 0;
	autoValorAnterior = -1;

	x = v(:); % Paso el vector x0 como columna
	y = x / norm(x); % Normalizo

	% Si la cantidad de iteraciones no supero el maximo y la diferencia
	% dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && diferencia > tolerancia) 
		
		x = A*y; % x^(k) = Ax^(k-1)
		y = x / norm(x);
		
		autoValor = x.'*y; % Calculo el autovector - con .' traspongo
		
		diferencia = abs(autoValor-autoValorAnterior);
		autoValorAnterior = autoValor; % lo guardo para la proxima iteracion

		iter++; 
	
	end
	
	
	autoVector = y; % Normalizado
%	autoVector = x
end





