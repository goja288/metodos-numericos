function [autoVector,autoValor]=Potencia(A,v) 
% param A matriz
% param v vector

	%% Dados A, x0 , numiter
	%% Desde k = 1 hasta numiter
	%% x^k = Ax^(k−1)
	%% Definimos αlpha^(k) como una componente de x^(k) de modulo maximo.
	%% x^k = x^(k)/α^(k) ===> Normalizamos el vector x^(k)
	%% Fin del bucle.
	%% Devuelve autoValor ==> x^(iter) , alpha^(iter) .
	

	maxIteraciones = 10000;
	iter = 0;	

	tolerancia = 10^-5; 

	maximo = 0;
	indiceDelMaximo = -1;

	diferencia = 1;

	autoValor = 0;
	autoValorAnterior = -1;

	x = v(:); % Lo paso a columna

	% Si la cantidad de iteraciones no supero el maximo y la diferncia
	% dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && diferencia > tolerancia) 
		x = A*x; % x^(k) = Ax^(k-1)	

		[maximo,indiceDelMaximo] = max(abs(x)); % Tomo el maximo en valor absoluto del autovector

		autoValor = x(indiceDelMaximo);

		x = 1 / (autoValor * x); % Normalizo


		diferencia = abs(autoValor-autoValorAnterior);
		autoValorAnterior = autoValor;

		iter++;
	
	end
	autoVector = x;

end





