function [autoVector,autoValor, errores, iter]=Potencia(X,maxIteraciones,tolerancia)   
    % param A matriz 
    % param maxIteraciones 
    % param tolerancia 
	A = ObtenerMatrizDeTransicion(X);
    
    errores = zeros(1,maxIteraciones);

	%x0 = linspace(1,1,columns(A)); 
	x0 = zeros(1,columns(A)); % Inicializo x^{x0} con 0's
	x0(1) = 1; % le asigno un 1 a la primer componente

	%maxIteraciones = 1000; % Maxima cantidad de iteraciones 
	iter = 0; % Numero de iteracion	
	%tolerancia = 10^-10; % Tolerancia
	err = 1 ; % inicializo para que entre al while
 
	c = 0; % AutoValor
	autoValorAnterior = -1;

	x = x0(:); % Paso el vector x^{x0} como columna
	
	% Si la cantidad de iteraciones no supero el maximo y la diferencia
	% de dos valores consecutivos es mayor a la tolerancia
	while (iter < maxIteraciones && err > tolerancia) % TODO Ver si no es comparacion entre vectores
%	while (iter < maxIteraciones) % TODO Ver si no es comparacion entre vectores
		
		autoValorAnterior = c; % lo guardo para la proxima iteracion
		
		y = A*x; % y^{(j+1)} = Ax^{(j)}
		
		c = abs(max(y));  % Componente dominante de y^{(j+1)}
		
		x = (1 / c) * y; % Normalizado de y^{(j+1)}

        err = abs(c-autoValorAnterior);
     
		iter++; 
        errores(iter) = err;
	
	end

	
	%autoVector = x; % Normalizado
	
	autoVector = x/sum(x);
	autoValor = sum(autoVector);
	

end

function [T] = obtenerMatrizGoogle(G)
	[n,n] = size(G);
	d = zeros(1, n);
	p = zeros(1, n);

	for j = 1:n
    	L{j} = find(G(:,j));
    	c(j) = length(L{j});
    		if (c(j)== 0)
			d(j)= 1;
    		else
			P (:, j) = G (:, j) /c(j);
		end
		p(j)= 1/n;
		end 
	D = p'*d;
	T = P + D;
endfunction

function A = ObtenerMatrizDeTransicion(G) 

vectorSumaColumnas = sum(G);
%vectorSinCeros = vectorSumaColumnas;
%numeroColumnas = size(G,1);
%numeroFilas = size(G,2);
[numeroColumnas,numeroFilas] = size(G) ;

%vectorSinCeros(vectorSinCeros == 0) = 1; % para poder dividir sustituyo los 0's

% A = G./vectorSinCeros; % ./ es division elemento a elemento


for j = 1:numeroColumnas
	%j
	if (vectorSumaColumnas(j) == 0) 
		A(:,j) = (linspace(1/numeroColumnas,1/numeroColumnas,numeroFilas))'; 
	else
		A(:,j) = G(:,j) / vectorSumaColumnas(j); % no tiene 0 porque entra antes 
	end
end

v = (1/numeroColumnas);
e = ones(1,numeroColumnas);
A = (0.85) * A + (0.15) * v * e'*e;

%sum(A) 




%vectorAuxiliar =  linspace(1/numeroColumnas,1/numeroColumnas,numeroFilas); % creo un vector auxiliar para despues sumarlo a la matriz

% Para cada columna que sea cero le sumo 1/N en cada entrada
%for i = find(vectorSumaColumnas == 0);
%	A(:,i) = vectorAuxiliar.';
%end

endfunction





