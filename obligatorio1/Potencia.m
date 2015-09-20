function [autoVector,autoValor]=Potencia(A) 
% param A matriz 

	%x0 = linspace(1,1,columns(A)); 
	x0 = zeros(1,columns(A)); % Inicializo x^{x0} con 0's
	x0(1) = 1; % le asigno un 1 a la primer componente



	maxIteraciones = 1000; % Maxima cantidad de iteraciones 
	iter = 0; % Numero de iteracion	
	tolerancia = 10^-10; % Tolerancia
 
	c = 0; % AutoValor
	autoValorAnterior = -1;

	x = x0(:); % Paso el vector x^{x0} como columna
	
	% Si la cantidad de iteraciones no supero el maximo y la diferencia
	% de dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && abs(c-autoValorAnterior) > tolerancia) % TODO Ver si no es comparacion entre vectores
%	while (iter < maxIteraciones) % TODO Ver si no es comparacion entre vectores
		
		autoValorAnterior = c; % lo guardo para la proxima iteracion
		
		y = A*x; % y^{(j+1)} = Ax^{(j)}
		
		c = abs(max(y));  % Componente dominante de y^{(j+1)}
		
		x = (1 / c) * y; % Normalizado de y^{(j+1)}

		iter++; 
	
	end

	autoValor = c;
	%autoVector = x; % Normalizado
	
	autoVector = x/sum(x);
	

end





