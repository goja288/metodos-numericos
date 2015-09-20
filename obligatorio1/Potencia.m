function [autoVector,autoValor]=Potencia(A,v) 
% param A matriz
% param v vector

	maxIteraciones = 100; % Maxima cantidad de iteraciones
	iter = 0; % Numero de iteracion	
	tolerancia = 10^-5; % Tolerancia
 
	c = 0; % AutoValor
	autoValorAnterior = -1;

	x = v(:); % Paso el vector x0 como columna
	
	% Si la cantidad de iteraciones no supero el maximo y la diferencia
	% de dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && abs(c-autoValorAnterior) > tolerancia) 
		
		autoValorAnterior = c; % lo guardo para la proxima iteracion
		
		y = A*x; % y^{(j+1)} = Ax^{(j)}
		
		c = abs(max(y));  % Componente dominante de y^{(j+1)
		
		x = (1 / c) * y; % Normalizado de y^{(j+1)

		iter++; 
	
	end

	autoValor = c;
	autoVector = x; % Normalizado

end





